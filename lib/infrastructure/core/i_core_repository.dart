import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/core/core_repository.dart';

class ICoreRepository extends CoreRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final String serverUrl;

  ICoreRepository({required this.serverUrl});
  @override
  Future<File?> selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    final path = image.path;
    final file = File(path);

    return file;
  }

  @override
  Future<Either<String, String>> uploadFileToUserLocation(
      {required File file}) async {
    try {
      final String uid = _firebaseAuth.currentUser!.uid;
      final String filePath = 'users/$uid/${file.uri.pathSegments.last}';
      final ref = _firebaseStorage.ref().child(filePath);

      final uploadTask = await ref.putFile(file);
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      return Right(downloadUrl); // Return the download URL on success
    } catch (e) {
      return Left(e.toString()); // Return error message on failure
    }
  }
}
