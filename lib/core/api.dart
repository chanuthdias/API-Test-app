import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_api_app/core/const.dart';
import 'package:movie_api_app/models/movie.dart';
import 'package:movie_api_app/models/people.dart';
import 'package:movie_api_app/models/tv.dart';

class Api {
  final Dio _dio = GetIt.I<Dio>(); // Use the Dio instance from GetIt

  Future<List<Movie>> getTrendingMovies() async {
    return _fetchMovies('/trending/movie/day');
  }

  Future<List<Movie>> getTopRatedMovies() async {
    return _fetchMovies('/movie/top_rated');
  }

  Future<List<Movie>> getUpcomingMovies() async {
    return _fetchMovies('/movie/upcoming');
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    return _fetchMovies('/movie/now_playing');
  }

  Future<List<TV>> getAiringTodayTV() async {
    return _fetchTVs('/tv/airing_today');
  }

  Future<List<TV>> getOnTheAirTV() async {
    return _fetchTVs('/tv/on_the_air');
  }

  Future<List<TV>> getPopularTV() async {
    return _fetchTVs('/tv/popular');
  }

  Future<List<People>> getPopularPeople() async {
    return _fetchPeople('/person/popular');
  }

  Future<List<Movie>> _fetchMovies(String endpoint) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: {'api_key': ApiConst.apiKey},
      );
      return (response.data['results'] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  Future<List<TV>> _fetchTVs(String endpoint) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: {'api_key': ApiConst.apiKey},
      );
      return (response.data['results'] as List)
          .map((tv) => TV.fromJson(tv))
          .toList();
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  Future<List<People>> _fetchPeople(String endpoint) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: {'api_key': ApiConst.apiKey},
      );
      return (response.data['results'] as List)
          .map((people) => People.fromJson(people))
          .toList();
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again later.';
      case DioExceptionType.sendTimeout:
        return 'Request timeout. Please check your internet connection.';
      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond.';
      case DioExceptionType.badResponse:
        return 'Server error: ${e.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.unknown:
      default:
        return 'An unexpected error occurred: ${e.message}';
    }
  }
}
