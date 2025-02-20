```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, parse the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data from jsonData
      print(jsonData['key']);
    } else {
      // Handle error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any other exceptions
    print('Error: $e');
    //In this scenario, rethrow to alert calling functions about failure
    rethrow; 
  }
}

void main() async {
  try{
    await fetchData();
  } catch (e){
    print('An error occurred: $e');
  }
}
```