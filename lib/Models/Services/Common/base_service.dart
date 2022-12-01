abstract class BaseService {
  final String baseUrl =
      "https://7ucpp7lkyl.execute-api.ap-southeast-1.amazonaws.com/dev";
  Future<dynamic> getResponse(String url, {Map<String, dynamic>? params});
}
