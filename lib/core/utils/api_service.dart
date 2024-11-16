import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = "https://api.stripe.com/v1/";
  ApiService(this.dio);

  Future<Map<String, dynamic>> post(String endPoint, Map<String, dynamic> data,
      {String? token, Map<String, dynamic>? headers}) async {
    Response response = await dio.post('$baseUrl$endPoint',
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: headers ?? {"Authorization": "Bearer $token"}),
        data: data);

    return response.data;
  }
}