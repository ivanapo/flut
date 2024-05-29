import 'dart:convert';
import 'package:http/http.dart' as http;
import 'book_model.dart';

class BookService {
  static Future<List<Book>> fetchBooks(String query) async {
    final response = await http
        .get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final books =
          (data['items'] as List).map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }
}