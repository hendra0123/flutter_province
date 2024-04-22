abstract class BaseApiServices {
  Future<dynamic> getGetAPIResponse(String endpoint);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
