import 'package:dio/dio.dart';
class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    )
  );

  Future<List<dynamic>> fetchProductsList() async {
    try {
      final response = await dio.get('/products');

      return response.data['products'];
    } catch (e) {
      if (e is DioError) {
        print('Error occurred: ${e.message}');
      }
      return [];
    }
  }
}