import 'dart:convert';
import 'dart:io';

import 'package:gigamike/models/portfolio.dart';
import 'package:http/http.dart' as http;

// ignore: avoid_classes_with_only_static_members
class PortfolioApi {
  static Future<List<Portfolio>> getPortfolios(
    int page,
    int limit, {
    String? searchTerm,
  }) async =>
      http
          .get(
            _ApiUrlBuilder.Portfolios(
              page,
              limit,
              searchTerm: searchTerm,
            ),
            // headers: {'Accept': 'application/json'},
          )
          // .timeout(const Duration(seconds: 1000))
          .mapFromResponse<List<Portfolio>, List<dynamic>>(
            (jsonArray) => _parseItemListFromJsonArray(
              jsonArray,
              (jsonObject) => Portfolio.fromJson(jsonObject),
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
  static const _baseUrl = 'https://laravel7.gigamike.net/api/';
  static const _PortfolioResource = 'portfolios';

  static Uri Portfolios(
    int page,
    int limit, {
    String? searchTerm,
  }) =>
      Uri.parse(
        '$_baseUrl$_PortfolioResource'
        '?page=$page'
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
      if (response.statusCode == 201) {
        return jsonParser(jsonDecode(response.body)['data']);
      } else {
        throw GenericHttpException();
      }
    } on SocketException {
      throw NoConnectionException();
    }
  }
}