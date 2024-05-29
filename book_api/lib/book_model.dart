class Book {
  final String title;
  final String description;

  Book({required this.title, required this.description});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['volumeInfo']['title'] ?? 'No title available',
      description:
          json['volumeInfo']['description'] ?? 'No description available',
    );
  }
}