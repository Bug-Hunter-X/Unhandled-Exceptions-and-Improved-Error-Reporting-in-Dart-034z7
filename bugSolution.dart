```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFetchException implements Exception {
  final String message;
  DataFetchException(this.message);
  @override
  String toString() => 'DataFetchException: $message';
}

Future<Map<String, dynamic>> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw DataFetchException('Failed to load data: ${response.statusCode}');
    }
  } on http.ClientException catch (e) {
    throw DataFetchException('Network Error: $e');
  } on FormatException catch (e) {
    throw DataFetchException('JSON Parsing Error: $e');
  } catch (e) {
    throw DataFetchException('An unexpected error occurred: $e');
  }
}

void main() async {
  try {
    final data = await fetchData();
    print(data['key']);
  } on DataFetchException catch (e) {
    print('Error fetching data: $e');
  } catch (e) {
    print('A critical error occurred: $e');
  }
}
```