# homer_api_client.api.BookInfoApi

## Load the API package
```dart
import 'package:homer_api_client/api.dart';
```

All URIs are relative to *https://api.homer-app.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBookInfoFromUrl**](BookInfoApi.md#getbookinfofromurl) | **GET** /books/info | Extract book metadata from a webpage URL


# **getBookInfoFromUrl**
> BookInfo getBookInfoFromUrl(url)

Extract book metadata from a webpage URL

Scrapes the given URL and returns whatever book metadata can be found: title and ISBN(s). Intended for resolving a shared book page URL into something searchable.  `isbn10` and `isbn13` are null when not found on the page. If neither is present the client can fall back to a text search using `title`. 

### Example
```dart
import 'package:homer_api_client/api.dart';

final api = HomerApiClient().getBookInfoApi();
final String url = https://www.goodreads.com/book/show/3735293-clean-code; // String | The webpage URL to scrape for book metadata.

try {
    final response = api.getBookInfoFromUrl(url);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BookInfoApi->getBookInfoFromUrl: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **url** | **String**| The webpage URL to scrape for book metadata. | 

### Return type

[**BookInfo**](BookInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

