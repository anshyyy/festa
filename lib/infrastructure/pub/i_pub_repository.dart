import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/pub/pub_repository.dart';
import '../event/dtos/pub/pub_dto.dart';

class IPubRepository extends PubRepository {
  final String serverUrl;
  IPubRepository({required this.serverUrl});
  @override
  Future<Either<String, PubDto>> getPubById({required int pubId}) async {
    try {
      final url = '$serverUrl${PubApiConstants.PUBS}/$pubId';
      final response = await RESTService.performGETRequest(httpUrl: url);

      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }

      final parsedBody = jsonDecode(response.body);

      PubDto pub = PubDto.fromJson(parsedBody);

      return right(pub);
    } catch (e) {
      return left(e.toString());
    }
  }
}
