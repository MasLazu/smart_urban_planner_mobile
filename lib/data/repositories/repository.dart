import 'package:get/get.dart';
// import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:smart_urban_planner/core/storage_keys.dart';

class Repository extends GetConnect {
  Repository(String domain) {
    httpClient.baseUrl = domain;
    // httpClient.addRequestModifier<dynamic>((request) async {
    //   String body = '';
    //   request.bodyBytes.transform(utf8.decoder).listen((String data) {
    //     body += data;
    //   });

    //   await Future.delayed(const Duration(seconds: 2));
    //   print('URL: ${request.url}');
    //   print('Method: ${request.method}');
    //   print('Headers: ${request.headers}');
    //   print('Body: $body');

    //   return request;
    // });
  }

  String get token => GetStorage().read(StorageKeys.token) ?? '';

  void checkStatusCode(Response res) {
    if (res.statusCode == null ||
        res.statusCode! < 200 ||
        res.statusCode! >= 300) {
      throw Exception(
          res.body != null ? res.body['message'] : 'Cannot connect to server');
    }
  }

  Map<String, String> assignToken(Map<String, String>? headers) {
    if (headers != null) {
      headers['Authorization'] = token;
    } else {
      headers = {'Authorization': token};
    }
    return headers;
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) async {
    headers = assignToken(headers);
    Response<T> res = await super.post(
      url,
      body,
      contentType: contentType,
      headers: headers,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
    checkStatusCode(res);
    return res;
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) async {
    headers = assignToken(headers);
    Response<T> res = await super.get(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );
    checkStatusCode(res);
    return res;
  }

  @override
  Future<Response<T>> put<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) async {
    headers = assignToken(headers);
    Response<T> res = await super.put(
      url,
      body,
      contentType: contentType,
      headers: headers,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
    checkStatusCode(res);
    return res;
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) async {
    headers = assignToken(headers);
    Response<T> res = await super.delete(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );
    checkStatusCode(res);
    return res;
  }

  @override
  Future<Response<T>> patch<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) async {
    headers = assignToken(headers);
    Response<T> res = await super.patch(
      url,
      body,
      contentType: contentType,
      headers: headers,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
    checkStatusCode(res);
    return res;
  }
}
