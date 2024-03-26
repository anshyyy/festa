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

class IUserRepository extends UserRepository {
  final String serverUrl;
  IUserRepository({required this.serverUrl});

  @override
  Future<Either<String, UserDto>> patchProfile(
      {required Map<String, dynamic> input}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      final url = '$serverUrl${EventApiConstants.USERS}';
      final response = await RESTService.performPATCHRequest(
          httpUrl: url, isAuth: true, token: token!, body: jsonEncode(input));
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final data = jsonDecode(response.body);
      return right(UserDto.fromJson(data));
    } catch (error) {
      return left(ErrorConstants.networkUnavailable);
    }
  }

  @override
  Future<CommunityDto> getUserFollowers({
    required int userId,
    required int page,
    required int limit,
  }) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final url = '$serverUrl${UserApiConstants.USERS}/$userId/followers';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
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
  }) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final url = '$serverUrl${UserApiConstants.USERS}/$userId/friends';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
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

      final response = await RESTService.performPOSTRequest(
          httpUrl: url, isAuth: true, token: token!);
      if (response.statusCode != 200 || response.statusCode != 201) {
        print('Error occured');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void unFollowUser({required int userId}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${UserApiConstants.USERS}/unfollow/$userId';

      final response = await RESTService.performPOSTRequest(
          httpUrl: url, isAuth: true, token: token!);
      if (response.statusCode != 200 || response.statusCode != 201) {
        print('Error occured');
      }
    } catch (e) {
      print(e);
    }
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
      print('error');
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
      print('error');
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
        return [] as List<PersonalizationMenuDto>;
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
      return [] as List<PersonalizationMenuDto>;
      // print(e);
    }
  }

  @override
  void updatePersonalizedMenu(
      {required String title, required List<String> list}) async {
    try {
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
    } catch (e) {
      print(e);
    }
  }
}
