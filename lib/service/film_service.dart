import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/feature/home/model/genre_model.dart';
import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/product/utility/exception/dio_excepiton.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IFilmService {
  Future<NowShowingModel> getNowShowing();
  Future<PopularFilmModel> getPopularFilms();
  Future<GenreModel> getGenres();
  Future<FilmDetailModel> getFilmDetail(int filmId);
}

class FilmService implements IFilmService {
  FilmService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: dotenv.env['API_BASE_URL'] ?? '',
            queryParameters: {'api_key': dotenv.env['API_KEY'] ?? ''},
          ),
        );

  final Dio _dio;

  @override
  Future<NowShowingModel> getNowShowing() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_FilmApiPath.nowPlaying.value);
      _checkResponseStatus(response);

      final data = _extractData(response.data);
      return NowShowingModel.fromJson(data);
    } on DioException catch (e) {
      throw AppDioException('API Error: ${e.message}');
    } catch (e) {
      throw AppDioException('An unknown error occurred: $e');
    }
  }

  @override
  Future<PopularFilmModel> getPopularFilms() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_FilmApiPath.popular.value);
      _checkResponseStatus(response);

      final data = _extractData(response.data);
      return PopularFilmModel.fromJson(data);
    } on DioException catch (e) {
      throw AppDioException('API Error: ${e.message}');
    } catch (e) {
      throw AppDioException('An unknown error occurred: $e');
    }
  }

  @override
  Future<GenreModel> getGenres() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_FilmApiPath.genreMovie.value);
      _checkResponseStatus(response);

      final data = _extractData(response.data, isResultsRequired: false);
      return GenreModel.fromJson(data);
    } on DioException catch (e) {
      throw AppDioException('API Error: ${e.message}');
    } catch (e) {
      throw AppDioException('An unknown error occurred: $e');
    }
  }

  @override
  Future<FilmDetailModel> getFilmDetail(int filmId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${_FilmApiPath.detail.value}/$filmId',
      );
      _checkResponseStatus(response);

      final data = _extractData(response.data, isResultsRequired: false);
      return FilmDetailModel.fromJson(data);
    } on DioException catch (e) {
      throw AppDioException('API Error: ${e.message}');
    } catch (e) {
      throw AppDioException('An unknown error occurred: $e');
    }
  }

  void _checkResponseStatus(Response<Map<String, dynamic>> response) {
    if (response.statusCode != HttpStatus.ok) {
      throw AppDioException('Failed to load data', statusCode: response.statusCode);
    }
  }

  Map<String, dynamic> _extractData(Map<String, dynamic>? data, {bool isResultsRequired = true}) {
    if (data != null && (!isResultsRequired || data.containsKey('results'))) {
      return data;
    } else {
      throw AppDioException('Error: Data not available!');
    }
  }
}

enum _FilmApiPath {
  nowPlaying('movie/now_playing'),
  popular('movie/popular'),
  genreMovie('genre/movie/list'),
  detail('movie');

  const _FilmApiPath(this.value);

  final String value;
}
