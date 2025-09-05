import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class CoreRepository {
  Future<Either<PermissionStatus, File?>> selectImage();
  Future<Either<PermissionStatus,File?>> openCamera();
  Future<String> uploadFile({required File file});
  Future<PermissionStatus> permissionStatus();
  Future<CroppedFile?> cropPhoto({required File file});
}
