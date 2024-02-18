class Url {
  static const String baseUrl = 'https://jsonplaceholder.org';
  static String getProducts() => '$baseUrl/posts';
  static String getProductDetails(int id) => '$baseUrl/posts/$id';
}
