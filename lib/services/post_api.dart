import 'dart:convert';
import 'dart:io';

import 'package:gigamike/models/post.dart';
import 'package:http/http.dart' as http;

// ignore: avoid_classes_with_only_static_members
class PostApi {
  static Future<List<Post>> getPost(
    int page,
    int limit, {
    String? searchTerm,
  }) async =>
      http
          .get(
            _ApiUrlBuilder.posts(
              page,
              limit,
              searchTerm: searchTerm,
            ),
            // headers: {'Accept': 'application/json'},
          )
          // .timeout(const Duration(seconds: 1000))
          .mapFromResponse<List<Post>, List<dynamic>>(
            (jsonArray) => _parseItemListFromJsonArray(
              jsonArray,
              (jsonObject) => Post.fromJson(jsonObject),
            ),
          );

  static List<T> _parseItemListFromJsonArray<T>(
    List<dynamic> jsonArray,
    T Function(dynamic object) mapper,
  ) =>
      jsonArray.map(mapper).toList();
}

class GenericHttpException implements Exception {}

class NoConnectionException implements Exception {}

// ignore: avoid_classes_with_only_static_members
class _ApiUrlBuilder {
  // https://developer.wordpress.org/rest-api/reference/posts/
  static const _baseUrl = 'https://www.alexachamp.com/wp-json/wp/v2/';
  static const _postResource = 'posts';

  static Uri posts(
    int page,
    int limit, {
    String? searchTerm,
  }) =>
      Uri.parse(
        '$_baseUrl$_postResource?_embed'
        '&page=$page'
        '&per_page=$limit'
        '${_buildSearchTermQuery(searchTerm)}',
      );

  static String _buildSearchTermQuery(String? searchTerm) =>
      searchTerm != null && searchTerm.isNotEmpty
          ? '&search=${searchTerm.replaceAll(' ', '+').toLowerCase()}'
          : '';
}

extension on Future<http.Response> {
  Future<R> mapFromResponse<R, T>(R Function(T) jsonParser) async {
    try {
      final response = await this;

      if (response.statusCode == 200) {
        return jsonParser(jsonDecode(response.body));
      } else {
        throw GenericHttpException();
      }
    } on SocketException {
      throw NoConnectionException();
    }
  }
}