import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class CoreRepository {
  Future<File?> selectImage();
  Future<Either<String, String>> uploadFileToUserLocation({required File file});
  Future<String> uploadFile({required File file});
}
