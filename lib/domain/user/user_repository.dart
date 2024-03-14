import 'package:dartz/dartz.dart';

import '../../infrastructure/auth/dtos/user_dto.dart';

abstract class UserRepository {
  Future<Either<String, UserDto>> patchProfile({
    required Map<String, dynamic> input,
  });
}
