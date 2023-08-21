class Book {
  Book({
    required this.title,
    required this.author,
    required this.isbn,
  });

  final String title;
  final String author;
  final String isbn;

  factory Book.fromNetwork(Map<String, dynamic> book) {
    return Book(
      title: book['title'] as String,
      author: book['author'] as String,
      isbn: book['isbn'] as String,
    );
  }
}

class BookPartial {
  BookPartial({
    required this.title,
    required this.author,
  });

  final String title;
  final String author;
}
