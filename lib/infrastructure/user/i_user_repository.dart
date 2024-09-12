import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/user/user_repository.dart';
import '../auth/dtos/user_dto.dart';
import '../core/dtos/community/community_dto.dart';
import 'dtos/personalization_menu/personalization_menu_dto.dart';
import 'dtos/personalize_option/personalize_option_dto.dart';
import 'dtos/user_tickets/user_tickets_dto.dart';

class IUserRepository extends UserRepository {
  final String serverUrl;
  IUserRepository({required this.serverUrl});

  @override
  Future<Either<String, UserDto>> patchProfile({
    required Map<String, dynamic> input,
  }) async {
    try {
      print(input);
      final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      final url = '$serverUrl${EventApiConstants.USERS}';
      final response = await RESTService.performPATCHRequest(
          httpUrl: url, isAuth: true, token: token!, body: jsonEncode(input));
      print(response.statusCode);
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final userFetchUrl = '$serverUrl${EventApiConstants.GET_USER_DETAILS}';
      final userResponse = await RESTService.performGETRequest(
          httpUrl: userFetchUrl, isAuth: true, token: token);

      if (userResponse.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final data = jsonDecode(userResponse.body);
      return right(UserDto.fromJson(data));
    } catch (error) {
       print(error);
      return left(ErrorConstants.networkUnavailable);
    }
  }

  @override
  Future<CommunityDto> getUserFollowers({
    required int userId,
    required int page,
    required int limit,
    required String searchQuery,
  }) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final url = '$serverUrl${UserApiConstants.USERS}/$userId/followers';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
        'search': searchQuery,
      };
      final response = await RESTService.performGETRequest(
          httpUrl: url, param: param, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return const CommunityDto(totalCount: 0, users: []);
      }
      final body = response.body;
      final userFollowersRaw = jsonDecode(body) as Map<String, dynamic>;
      final userCommunity = CommunityDto.fromJson(userFollowersRaw);

      return userCommunity;
    } catch (e) {
      return const CommunityDto(totalCount: 0, users: []);
    }
  }

  @override
  Future<CommunityDto> getUserFriends({
    required int userId,
    required int page,
    required int limit,
    required String searchQuery,
  }) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final url = '$serverUrl${UserApiConstants.USERS}/$userId/friends';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
        'search': searchQuery,
      };
      final response = await RESTService.performGETRequest(
          httpUrl: url, param: param, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return const CommunityDto(totalCount: 0, users: []);
      }
      final body = response.body;
      final userFriendsRaw = jsonDecode(body) as Map<String, dynamic>;
      final userCommunity = CommunityDto.fromJson(userFriendsRaw);

      return userCommunity;
    } catch (e) {
      return const CommunityDto(totalCount: 0, users: []);
    }
  }

  @override
  Future<Either<dynamic, UserDto>> fetchUserDetails(
      {required int userId}) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final url =
          '$serverUrl${UserApiConstants.USERS}/$userId/${UserApiConstants.DETAILS}';

      final response = await RESTService.performGETRequest(
          httpUrl: url, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return left(null);
      }

      final body = response.body;
      final userRaw = jsonDecode(body) as Map<String, dynamic>;
      final user = UserDto.fromJson(userRaw);
      return right(user);
    } catch (e) {
      return left(null);
    }
  }

  @override
  void followUser({required int userId}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${UserApiConstants.USERS}/follow/$userId';

      await RESTService.performPOSTRequest(
          httpUrl: url, isAuth: true, token: token!);
    } catch (e) {
      (e);
    }
  }

  @override
  void unFollowUser({required int userId}) async {
    final token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final url = '$serverUrl${UserApiConstants.USERS}/unfollow/$userId';
    await RESTService.performPOSTRequest(
        httpUrl: url, isAuth: true, token: token!);
  }

  @override
  Future<bool> sendOtpToEmail({required String email}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${UserApiConstants.USERS}/email/otp';

      final bodyObj = {
        'email': email,
      };

      final response = await RESTService.performPOSTRequest(
        httpUrl: url,
        isAuth: true,
        token: token!,
        body: jsonEncode(bodyObj),
      );

      if (response.statusCode != 201) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> verifyOtp({required String email, required String otp}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${UserApiConstants.USERS}/email/verify';

      final bodyObj = {
        'email': email,
        'otp': otp,
      };

      final response = await RESTService.performPOSTRequest(
        httpUrl: url,
        isAuth: true,
        token: token!,
        body: jsonEncode(bodyObj),
      );

      if (response.statusCode != 201) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<PersonalizationMenuDto>> fetchPersonalizeMenu() async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final url = '$serverUrl${UserApiConstants.PERSONALIZE_LIST}';

      final response = await RESTService.performGETRequest(
          httpUrl: url, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return [];
      }
      final body = response.body;
      final menuRaw = jsonDecode(body) as Map<String, dynamic>;
      final personalizedList = menuRaw.keys.map((key) {
        return PersonalizationMenuDto(
            title: key,
            list: List.from(menuRaw[key].map((value) {
              return PersonalizationOptionDto.fromJson(value);
            })));
      }).toList();
      return personalizedList;
    } catch (e) {
      return [];
      // (e);
    }
  }

  @override
  void updatePersonalizedMenu(
      {required String title, required List<String> list}) async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
    final url = '$serverUrl${UserApiConstants.PERSONALIZE}';
    final response = await RESTService.performPATCHRequest(
        httpUrl: url,
        isAuth: true,
        token: token!,
        body: jsonEncode({title: list}));
    if (response.statusCode != 200) {
      throw ErrorConstants.unknownNetworkError;
    }
  }

  @override
  Future<bool> deleteProfile({required int id, required String reason}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      final url = '$serverUrl${UserApiConstants.USERS}/$id';
      final feedbackUrl = '$serverUrl${UserApiConstants.DELETE_REASON}';
      final response = await RESTService.performDELETERequest(
        httpUrl: url,
        isAuth: true,
        token: token!,
      );
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      await RESTService.performPOSTRequest(
          httpUrl: feedbackUrl, isAuth: true, token: token);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either<dynamic, UserTicketsDto>> fetchAllUserTickets() async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final url = '$serverUrl${UserApiConstants.GET_USER_TICKETS}';

      final response = await RESTService.performGETRequest(
          httpUrl: url, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return left(null);
      }
      final body = response.body;
      (body);
      final ticketsRaw = jsonDecode(body) as Map<String, dynamic>;
      final allTickets = UserTicketsDto.fromJson(ticketsRaw);
      return right(allTickets);
    } catch (e) {
      return left(null);
    }
  }

  @override
  Future<UserDto?> fetchUserByToken() async {
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      if (token == null) {
        return null;
      }
      final url = '$serverUrl${EventApiConstants.GET_USER_DETAILS}';
      final response = await RESTService.performGETRequest(
          httpUrl: url, isAuth: true, token: token);
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final data = jsonDecode(response.body);
      return UserDto.fromJson(data);
    } catch (error) {
      return null;
    }
  }

  @override
  Future<bool> report(
      {required String type, required String msg, required String id}) async {
    bool isReported = false;
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${UserApiConstants.REPORT}';
      final reqBody = {
        'type': type,
        'value': id,
        'message': msg,
      };
      final res = await RESTService.performPOSTRequest(
          body: jsonEncode(reqBody), httpUrl: url, isAuth: true, token: token!);

      if (res.statusCode == 200 || res.statusCode == 201) {
        isReported = true;
      }

      return isReported;
    } catch (e) {
      return isReported;
    }
  }

  @override
  Future<bool> block({required String type, required String id}) async {
    bool isBlocked = false;
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${UserApiConstants.BLOCK}';
      final reqBody = {'entityType': type, 'entityId': id};
      final res = await RESTService.performPOSTRequest(
          body: jsonEncode(reqBody), httpUrl: url, isAuth: true, token: token!);

      if (res.statusCode == 200 || res.statusCode == 201) {
        isBlocked = true;
      }

      return isBlocked;
    } catch (e) {
      return isBlocked;
    }
  }

  @override
  Future<bool> unBlock({required String type, required String id}) async {
    bool isUnblocked = false;
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${UserApiConstants.BLOCK}';
      final reqBody = {'entityType': type, 'entityId': id};
      final res = await RESTService.performDELETERequest(
          body: jsonEncode(reqBody), httpUrl: url, isAuth: true, token: token!);

      if (res.statusCode == 200 || res.statusCode == 201) {
        isUnblocked = true;
      }

      return isUnblocked;
    } catch (e) {
      return isUnblocked;
    }
  }
}
