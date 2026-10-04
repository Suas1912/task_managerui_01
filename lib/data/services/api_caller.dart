import 'dart:convert';
import 'package:http/http.dart';

class ApiCaller {
  static Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);


      final int statusCode = response.statusCode;
      if (statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSucccess: true,
          responseCode: statusCode,
          responseData: decodedData,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSucccess: false,
          responseCode: statusCode,
          responseData: decodedData,
        );
      }
    } on Exception catch (e) {
      // TODO
      return ApiResponse(
        isSucccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString()
      );
    }
  }

  static Future<ApiResponse> postRequest({required String url,Map<String,dynamic>?body}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await post(uri,
          //ki dhoroner data pathabo sheita bole deuyar jonne header use kora hoy
          headers: {'content-type':'application/json'},
          body: jsonEncode(body)
      );

      final int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode==201) {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSucccess: true,
          responseCode: statusCode,
          responseData: decodedData,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSucccess: false,
          responseCode: statusCode,
          responseData: decodedData,
        );
      }
    } on Exception catch (e) {
      // TODO
      return ApiResponse(
        isSucccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString()
      );
    }
  }
}

class ApiResponse {
  final bool isSucccess;
  final int responseCode;
  final dynamic responseData;
  final String errorMessage;

  ApiResponse({
    required this.isSucccess,
    required this.responseCode,
    required this.responseData,
    this.errorMessage='Something went Wrong',
  });
}
