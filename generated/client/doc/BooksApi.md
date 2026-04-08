# homer_api_client.api.BooksApi

## Load the API package
```dart
import 'package:homer_api_client/api.dart';
```

All URIs are relative to *https://api.homer-app.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBookByIsbn**](BooksApi.md#getbookbyisbn) | **GET** /books/{isbn} | Look up a single book by ISBN
[**searchBooks**](BooksApi.md#searchbooks) | **GET** /books | Search books by text query


# **getBookByIsbn**
> Book getBookByIsbn(isbn)

Look up a single book by ISBN

Returns exactly one book for the given ISBN-10 or ISBN-13.  Note: the literal path `/books/info` is matched before this parameter, so `GET /books/info` and `GET /books/{isbn}` do not conflict. 

### Example
```dart
import 'package:homer_api_client/api.dart';

final api = HomerApiClient().getBooksApi();
final String isbn = 0132350882; // String | ISBN-10 or ISBN-13.

try {
    final response = api.getBookByIsbn(isbn);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BooksApi->getBookByIsbn: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **isbn** | **String**| ISBN-10 or ISBN-13. | 

### Return type

[**Book**](Book.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchBooks**
> List<Book> searchBooks(q)

Search books by text query

### Example
```dart
import 'package:homer_api_client/api.dart';

final api = HomerApiClient().getBooksApi();
final String q = Clean Code; // String | Free-text search term (title, author, keyword, …).

try {
    final response = api.searchBooks(q);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BooksApi->searchBooks: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String**| Free-text search term (title, author, keyword, …). | 

### Return type

[**List&lt;Book&gt;**](Book.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

