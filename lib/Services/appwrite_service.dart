// lib/services/appwrite_service.dart
import 'package:appwrite/appwrite.dart';

class AppwriteService {
  static Client client = Client();

  static void init() {
    client
      .setEndpoint('https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
      .setProject('66d9f6f4000271bcad73') // Your Project ID
      .setSelfSigned(status: true); // For self-signed certificates, only for dev
  }
}
