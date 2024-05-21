import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';

import '../exceptions/app_exception.dart';
import '../exceptions/fetch_data_exception.dart';
import '../exceptions/timeout_exception.dart';
import '../resources/api_endpoint.dart';
import '../resources/strings.dart';
import 'enums/enums.dart';
import 'print_utils.dart';


abstract class BaseGetConnect extends GetConnect {
  
  @override
  String get baseUrl => APIEndpoint.login;

  Future<Response<dynamic>> methodRequest(
    String url, {
    required Method method,
    Object? params,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {

      Response<dynamic> response;

      response = await request(
        url,
        method.name,      
        body: params,
        contentType: contentType,
        headers: headers,
        query: query,
      );
      
      printUtil('\n -Url: ${response.request?.url} \n -Body: ${response.body}');

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        var exception = _getException(response.body);
        if(exception != null){
          throw exception;
        }
        return response;
      } else if (response.statusCode == 404 || response.statusCode == 400) {
        var exception = _getException(response.body);
        if(exception != null){
          throw exception;
        } else {
          throw FetchDataException(Strings.somethingWentWrong);
        }
      } else if (response.statusCode == 500 &&
          (response.body != null || response.body == null)) {
        throw FetchDataException(Strings.somethingWentWrong);
      } else if (response.statusCode == null && response.body == null) {
        throw FetchDataException(Strings.noInternetConnection);
      } else {
        throw FetchDataException(Strings.somethingWentWrong);
      }
    } on TimeoutException catch (_) {
      throw TimeOutException(Strings.timeoutException);
    } on SocketException {
      throw FetchDataException(Strings.noInternetConnection);
    }
  }

  AppException? _getException(dynamic response) {
    String? error;
    try {
      if (response is Map<String, dynamic>) {
        final hasError = response['status_message'] != null && response['status_message'] == "Error";
        final condition = response['message'] != null && hasError;

        if (condition) {
          error = response['message'].toString();
        }
      
      } else {
        
        final jsonResponse = jsonDecode(response);
        final hasError = response['status_message'] != null && response['status_message'] == "Error";
        final condition = jsonResponse['message'] != null && hasError;

        if (condition) {
          error = jsonResponse['message'].toString();
        }
      }
    } catch (e) {      
      error = null;
    }
    
    return _getExceptionFromErrorResponse(error);
  }

  AppException? _getExceptionFromErrorResponse(String? error) {
    if (error?.toLowerCase().contains('mobile number') == true) {
      return FetchDataException(error);  
    } else if (error?.toLowerCase().contains("password") == true) {
      return FetchDataException(error);
    } else if (error?.toLowerCase().contains( "Mobile number or password is incorrect".toLowerCase()) == true) {
      return FetchDataException(error);
    } else if (error?.toLowerCase().contains("You haven't clocked out from your previous shift yet".toLowerCase()) == true) {
      return FetchDataException(error);
    } else if (error?.toLowerCase().contains("Already clocked out the previous shift".toLowerCase()) == true) {
      return FetchDataException(error);
    } else if (error?.toLowerCase().contains("Please set up a bank account first".toLowerCase()) == true) {
      return FetchDataException(error);
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 30);
    super.onInit();
  }
}
