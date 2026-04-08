# homer_api_client.model.Book

## Load the model package
```dart
import 'package:homer_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**title** | **String** |  | 
**subtitle** | **String** | Empty string when no subtitle. | [default to '']
**authors** | **List&lt;String&gt;** |  | [default to []]
**pageCount** | **int** |  | [default to 0]
**industryIdentifiers** | **List&lt;String&gt;** | ISBN-10 and/or ISBN-13 strings. | [default to []]
**imageLinks** | **Map&lt;String, String&gt;** | Map of image-size key → absolute URL. Typical keys: `thumbnail`, `smallThumbnail`.  | [default to {}]
**averageRating** | **double** |  | [default to 0.0]
**description** | **String** | Book description/blurb. Null when not available. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


