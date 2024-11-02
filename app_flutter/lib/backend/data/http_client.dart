import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class IHttpClient {
  Future get({required String url});
}

@injectable
class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}
