abstract class BaseApiService {
  Future<Map<String, dynamic>> getGetApiResponse(String url);
  Future<Map<String, dynamic>> getPostApiResponse(String url, dynamic data);
}
