import 'package:dartz/dartz.dart';

import '../../infrastructure/event/dtos/pub/pub_dto.dart';

abstract class PubRepository {
  Future<Either<String, PubDto>> getPubById({required int pubId});
}
