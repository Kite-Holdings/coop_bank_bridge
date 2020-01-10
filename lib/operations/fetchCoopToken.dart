import 'dart:convert';

import 'package:coop_bank_bridge/coop_bank_bridge.dart';
import 'package:coop_bank_bridge/operations/settings.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

Future<String> fetchCoopToken()async{
  print("fetching token............");
  final String username = coopConsumerKey;
  final String password = coopConsumerSecret;
  final String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  final Map<String, String> _headers = {
    'authorization': basicAuth,
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded"
  };

  const bool trustSelfSigned = true;
  final HttpClient httpClient = HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  final IOClient ioClient = IOClient(httpClient);

  print('trying to fetch token.........');
  final http.Response r = await ioClient.post(coopTokenUrl, body: {'grant_type': 'client_credentials'}, headers: _headers, );
  print("done fetching token............");
  print(r.statusCode);
  final body = json.decode(r.body);

  return body['access_token'].toString();

}
