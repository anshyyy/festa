import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class CoreRepository {
  Future<Either<PermissionStatus, File?>> selectImage();
  Future<String> uploadFile({required File file});
  Future<PermissionStatus> permissionStatus();
}
