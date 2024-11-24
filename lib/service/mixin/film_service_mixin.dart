import 'dart:io';

import 'package:dio/dio.dart';
import 'package:film_oasis/product/constants/enum/film_api_path.dart';
import 'package:film_oasis/product/utility/exception/dio_excepiton.dart';

mixin FilmServiceMixin {
  void checkResponseStatus(Response<Map<String, dynamic>> response) {
    if (response.statusCode != HttpStatus.ok) {
      throw AppDioException('Failed to load data', statusCode: response.statusCode);
    }
  }

  Map<String, dynamic> extractData(Map<String, dynamic>? data, {bool isResultsRequired = true}) {
    if (data != null && (!isResultsRequired || data.containsKey(FilmApiPath.results.value))) {
      return data;
    }
    throw AppDioException('Error: Data not available!');
  }
}
