import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/product/utility/exception/dio_excepiton.dart';
import 'package:film_oasis/feature/home/model/genre_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filmServiceProvider = Provider<IFilmService>((ref) => FilmService());

abstract class IFilmService{
  Future<NowShowingModel> getNowShowing();
  Future<PopularFilmModel> getPopularFilms();
  Future<GenreModel> getGenres();
}

class FilmService implements IFilmService {
  FilmService() : _dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_BASE_URL'] ?? '',
    queryParameters: {'api_key': dotenv.env['API_KEY'] ?? ''},
  ),);
  
  final Dio _dio;

  @override
  Future<NowShowingModel> getNowShowing() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_FilmApiPath.nowPlaying.value);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data.containsKey('results')) {
          return NowShowingModel.fromJson(data);
          
        } else {
          throw MyDioException('Error: Data not available!');
        }
      } else {
        throw MyDioException('Failed to load data', statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      throw MyDioException('API Error: ${e.message}');
    } catch (e) {
      throw MyDioException('An unknown error occurred: $e');
    }
  }

  @override
  Future<PopularFilmModel> getPopularFilms() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_FilmApiPath.popular.value);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data.containsKey('results')) {
          return PopularFilmModel.fromJson(data);
        } else {
          throw MyDioException('Error: Data not available!');
        }
      } else {
        throw MyDioException('Failed to load data', statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      throw MyDioException('API Error: ${e.message}');
    } catch (e) {
      throw MyDioException('An unknown error occurred: $e');
    }
  }

  @override
  Future<GenreModel> getGenres() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_FilmApiPath.genreMovie.value);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null) {
          return GenreModel.fromJson(data);
        } else {
          throw MyDioException('Error: Data not available!');
        }
      } else {
        throw MyDioException('Failed to load genres', statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      throw MyDioException('API Error: ${e.message}');
    } catch (e) {
      throw MyDioException('An unknown error occurred: $e');
    }
  }
}

enum _FilmApiPath{
  nowPlaying('movie/now_playing'),
  popular('movie/popular'),
  genreMovie('genre/movie/list');

  final String value;

  // ignore: sort_constructors_first
  const _FilmApiPath(this.value);
}