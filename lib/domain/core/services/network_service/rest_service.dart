import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class RESTService {
  static Future<http.Response> performPOSTRequest({
    required String httpUrl,
    bool isAuth = false,
    String contentType = 'application/json',
    String? body,
    String token = '',
    Map<String, String>? header,
    Map<String, String> param = const {},
  }) async {
    if (param.isNotEmpty) {
      httpUrl += paramParser(param: param);
    }

    final request = http.Request('POST', Uri.parse(httpUrl));
    final Map<String, String> headers = {
      'Content-Type': contentType,
    };
    if (isAuth && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
      if (header != null) {
        headers.addAll(header);
      }
    }
    if (body != null) {
      request.body = body;
    }
    request.followRedirects = false;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final resultResponse = await http.Response.fromStream(response);
      return resultResponse;
    } else {
      final resultResponse = await http.Response.fromStream(response);
      throw resultResponse;
    }
  }

  static Future<http.Response> performPATCHRequest({
    required String httpUrl,
    bool isAuth = false,
    String contentType = 'application/json',
    String? body,
    String token = '',
    Map<String, String>? header,
    Map<String, String> param = const {},
  }) async {
    if (param.isNotEmpty) {
      httpUrl += paramParser(param: param);
    }

    final request = http.Request('patch', Uri.parse(httpUrl));
    final Map<String, String> headers = {
      'Content-Type': contentType,
    };
    if (isAuth && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
      if (header != null) {
        headers.addAll(header);
      }
    }
    if (body != null) {
      request.body = body;
    }
    request.followRedirects = false;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final resultResponse = await http.Response.fromStream(response);
      return resultResponse;
    } else {
      final resultResponse = await http.Response.fromStream(response);
      throw resultResponse;
    }
  }

  static Future<http.Response> performPUTRequest({
    required String httpUrl,
    bool isAuth = false,
    String contentType = 'application/json',
    String? body,
    String token = '',
    Map<String, String>? header,
    Map<String, String> param = const {},
  }) async {
    if (param.isNotEmpty) {
      httpUrl += paramParser(param: param);
    }

    final request = http.Request('PUT', Uri.parse(httpUrl));
    final Map<String, String> headers = {
      'Content-Type': contentType,
    };
    if (isAuth && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
      if (header != null) {
        headers.addAll(header);
      }
    }
    if (body != null) {
      request.body = body;
    }
    request.followRedirects = false;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final resultResponse = await http.Response.fromStream(response);
      return resultResponse;
    } else {
      final resultResponse = await http.Response.fromStream(response);
      throw resultResponse;
    }
  }

  static Future<http.Response> performDELETERequest({
    required String httpUrl,
    bool isAuth = false,
    String contentType = 'application/json',
    String token = '',
    Map<String, String>? header,
    Map<String, String> param = const {},
    String? body,
  }) async {
    if (param.isNotEmpty) {
      httpUrl += paramParser(param: param);
    }

    final request = http.Request('DELETE', Uri.parse(httpUrl));
    final Map<String, String> headers = {
      'Content-Type': contentType,
    };
    if (isAuth && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
      if (header != null) {
        headers.addAll(header);
      }
    }
    if (body != null) {
      request.body = body;
    }
    request.followRedirects = false;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final resultResponse = await http.Response.fromStream(response);
      return resultResponse;
    } else {
      final resultResponse = await http.Response.fromStream(response);
      throw resultResponse;
    }
  }

  static Future<http.Response> performGETRequest({
    required String httpUrl,
    bool isAuth = false,
    String token = '',
    Map<String, String>? header,
    Map<String, String> param = const {},
  }) async {
    if (param.isNotEmpty) {
      httpUrl += paramParser(param: param);
    }

    final request = http.Request('GET', Uri.parse(httpUrl));
    final Map<String, String> headers = {'Access-Control-Allow-Origin': '*'};
    if (isAuth) {
      headers['Authorization'] = 'Bearer $token';
      if (header != null) {
        headers.addAll(header);
      }
    }

    request.followRedirects = false;
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final resultResponse = await http.Response.fromStream(response);
      return resultResponse;
    } else {
      final resultResponse = await http.Response.fromStream(response);
      throw resultResponse;
    }
  }

  static Future<http.Response> performPOSTMediaRequest({
    required String httpUrl,
    required File file,
  }) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(httpUrl));
      final Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
      };
      // request.files.add(await http.MultipartFile.fromPath('file', file.path));
      request.files.add(
        await http.MultipartFile(
          'file',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: 'file_path.png',
          contentType: MediaType('image', 'jpeg'),
        ),
      );
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final resultResponse = await http.Response.fromStream(response);
        return resultResponse;
      } else {
        final resultResponse = await http.Response.fromStream(response);
        throw resultResponse;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }

    //  try {
    //     final dio = Dio();
    //  dio.options.contentType = "multipart/form-data";
    //  final multiPartFile = await MultipartFile.fromFile(
    //    file.path,
    //    filename: file.path.split('/').last,
    //  );
    //  FormData formData = FormData.fromMap({
    //    "file": multiPartFile,
    //  });
    //  final response = await dio.post(
    //    httpUrl,
    //    data: formData,
    //  );
    //  return response.data;
    //  } catch (e) {
    //    (e);
    //    throw e;
    //  }
  }

  static String paramParser({required Map<String, String> param}) {
    String parameter = '';
    for (String key in param.keys) {
      if (parameter.contains('?')) {
        parameter +=
            param[key] == null || param[key] == 'null' || param[key] == ''
                ? ''
                : '&$key=${param[key]}';
      } else {
        parameter +=
            param[key] == null || param[key] == 'null' || param[key] == ''
                ? ''
                : '?$key=${param[key]}';
      }
    }
    return parameter;
  }
}
