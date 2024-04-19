import 'package:dartz/dartz.dart';

import '../../infrastructure/auth/dtos/user_dto.dart';
import '../../infrastructure/core/dtos/community/community_dto.dart';
import '../../infrastructure/user/dtos/personalization_menu/personalization_menu_dto.dart';
import '../../infrastructure/user/dtos/user_tickets/user_tickets_dto.dart';

abstract class UserRepository {
  Future<Either<String, UserDto>> patchProfile({
    required Map<String, dynamic> input,
  });
  Future<CommunityDto> getUserFollowers({
    required int userId,
    required int page,
    required int limit,
    required String searchQuery,
  });
  Future<CommunityDto> getUserFriends({
    required int userId,
    required int page,
    required int limit,
    required String searchQuery,

  });

  Future<Either<dynamic, UserDto>> fetchUserDetails({
    required int userId,
  });

  void followUser({
    required int userId,
  });

  void unFollowUser({
    required int userId,
  });
  
  Future<bool> sendOtpToEmail({
    required String email,
  });

  Future<bool> verifyOtp({
    required String email,
    required String otp,
  });
  
  Future<List<PersonalizationMenuDto>> fetchPersonalizeMenu();

  void updatePersonalizedMenu({required String title, required List<String> list});
  Future<bool> deleteProfile({required int id, required String reason});

  Future<Either<dynamic,UserTicketsDto>> fetchAllUserTickets(); 
  
  Future<UserDto?> fetchUserByToken();

  Future<bool> report({
    required String type,
    required String msg,
    required String id,
  });

  
}
