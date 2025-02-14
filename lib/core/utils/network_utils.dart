import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class NetworkUtils {
  final Connectivity _connectivity = Connectivity();
  final Dio _dio = Dio();

  // Check if the device is connected to the internet
  Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // Verify if the internet is actually working by making a network request
  Future<bool> isInternetWorking() async {
    final _isConnected = await isConnected();
    if (!_isConnected) {
      return false; // No internet connection
    }

    try {
      // Use a reliable and lightweight endpoint for checking internet connectivity
      final response = await _dio.get('https://www.google.com',
          options: Options(
            receiveTimeout: const Duration(seconds: 5), // Set a timeout
          ));
      return response.statusCode == 200; // Internet is working
    } on DioException catch (e) {
      // Handle specific Dio errors
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        print('DNS or connection error: ${e.message}');
        return false; // Internet is not working
      }
      rethrow; // Re-throw other Dio errors
    } catch (e) {
      print('Unexpected error: $e');
      return false; // Internet is not working
    }
  }
}
