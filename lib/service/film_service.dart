import 'package:dio/dio.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/feature/home/model/genre_model.dart';
import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/feature/search/model/search_model.dart';
import 'package:film_oasis/product/constants/enum/film_api_path.dart';
import 'package:film_oasis/product/utility/exception/dio_excepiton.dart';
import 'package:film_oasis/service/mixin/film_service_mixin.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IFilmService {
  Future<NowShowingModel> getNowShowing();
  Future<PopularFilmModel> getPopularFilms();
  Future<GenreModel> getGenres();
  Future<FilmDetailModel> getFilmDetail(int filmId);
  Future<SearchModel> searchMovies(String query);
}

class FilmService with FilmServiceMixin implements IFilmService {
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
      final response = await _dio.get<Map<String, dynamic>>(FilmApiPath.nowPlaying.value);
      checkResponseStatus(response);

      final data = extractData(response.data);
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
      final response = await _dio.get<Map<String, dynamic>>(FilmApiPath.popular.value);
      checkResponseStatus(response);

      final data = extractData(response.data);
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
      final response = await _dio.get<Map<String, dynamic>>(FilmApiPath.genreMovie.value);
      checkResponseStatus(response);

      final data = extractData(response.data, isResultsRequired: false);
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
        '${FilmApiPath.detail.value}/$filmId',
      );
      checkResponseStatus(response);

      final data = extractData(response.data, isResultsRequired: false);
      return FilmDetailModel.fromJson(data);
    } on DioException catch (e) {
      throw AppDioException('API Error: ${e.message}');
    } catch (e) {
      throw AppDioException('An unknown error occurred: $e');
    }
  }

  @override
  Future<SearchModel> searchMovies(String query) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        FilmApiPath.search.value,
        queryParameters: {
          'query': query,
        },
      );
      checkResponseStatus(response);

      final data = extractData(response.data);
      return SearchModel.fromJson(data);
    } on DioException catch (e) {
      throw AppDioException('API Error: ${e.message}');
    } catch (e) {
      throw AppDioException('An unknown error occurred: $e');
    }
  }
}
