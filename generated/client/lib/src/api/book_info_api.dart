//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:homer_api_client/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:homer_api_client/src/model/book_info.dart';
import 'package:homer_api_client/src/model/error_response.dart';

class BookInfoApi {

  final Dio _dio;

  const BookInfoApi(this._dio);

  /// Extract book metadata from a webpage URL
  /// Scrapes the given URL and returns whatever book metadata can be found: title and ISBN(s). Intended for resolving a shared book page URL into something searchable.  &#x60;isbn10&#x60; and &#x60;isbn13&#x60; are null when not found on the page. If neither is present the client can fall back to a text search using &#x60;title&#x60;. 
  ///
  /// Parameters:
  /// * [url] - The webpage URL to scrape for book metadata.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BookInfo] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BookInfo>> getBookInfoFromUrl({ 
    required String url,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/books/info';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      r'url': url,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    BookInfo? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<BookInfo, BookInfo>(rawData, 'BookInfo', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BookInfo>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
