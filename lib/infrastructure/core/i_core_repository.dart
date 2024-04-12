import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/core_repository.dart';
import '../../domain/core/services/network_service/rest_service.dart';

class ICoreRepository extends CoreRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final String serverUrl;

  ICoreRepository({required this.serverUrl});

  @override
  Future<PermissionStatus> permissionStatus() async {
    final permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      return PermissionStatus.granted;
    }
    if (permissionStatus.isPermanentlyDenied) {
      return PermissionStatus.permanentlyDenied;
    }
    return PermissionStatus.denied;
  }

  @override
  Future<Either<PermissionStatus, File?>> selectImage() async {
    final permission = await permissionStatus();
    if (permission.isPermanentlyDenied) {
      return left(PermissionStatus.permanentlyDenied);
    }
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return right(null);

    final path = image.path;
    final file = File(path);

    return right(file);
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

  @override
  Future<String> uploadFile({required File file}) async {
    try {
      final url = '$serverUrl${CoreApiConstants.UPLOAD}';
      final response =
          await RESTService.performPOSTMediaRequest(httpUrl: url, file: file);

      // if (response.statusCode != 200) {
      //   return '';
      // }

      final body = response.body;
      final mediaUrlRaw = jsonDecode(body) as Map<String, dynamic>;
      final mediaUrl = mediaUrlRaw['url'];
      return mediaUrl ?? '';
    } catch (e) {
      return '';
    }
  }
}
