import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/auth/auth_repository.dart';

class IAuthRepository extends AuthRepository {
  final String appUrl;
  final String serverUrl;
  IAuthRepository({required this.appUrl, required this.serverUrl});

  @override
  Future<Either<String, File>> selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return left('No File Selected');

    final path = image.path;
    final file = File(path);

    return right(file);
  }

  @override
  Future<User?> authenticateUser() {
    throw UnimplementedError();
  }
}
