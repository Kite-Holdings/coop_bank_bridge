import 'dart:convert';

import 'package:coop_bank_bridge/coop_bank_bridge.dart';
import 'package:coop_bank_bridge/operations/fetchCoopToken.dart';
import 'package:coop_bank_bridge/operations/settings.dart';
import 'package:coop_bank_bridge/settings/settings.dart';
import 'package:coop_bank_bridge/utils/database_bridge.dart';
import 'package:http/io_client.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:http/http.dart' as http;

class PesalinkOperations{

  PesalinkOperations({
    this.accountNumber,
    this.bankCode,
    this.amount,
    this.transactionCurrency = 'KES',
    this.narration
  });


  String messageReference;
  String callBackUrl;
  String accountNumber;
  String bankCode;
  int amount;
  String transactionCurrency;
  String narration;

  String transactionType;
  String transactionAction;

  static Db db =  Db(databaseUrl);
  final DbCollection companies = db.collection('coop_bank_transaction');

  Future get send => _transact(sending: true);
  Future get receive => _transact(sending: false);

  Future _transact({bool sending}) async{
    final String callBackURL = coopCallbackUrl;
    final String _accNumber = coopAccountNumber;
    final String _url = peaslinkUrl;
    // final String _accessToken = await fetchCoopToken();
    final String _accessToken = bearerToken;

    messageReference = "test";


    final Map<String, dynamic> payload = {
      "MessageReference": messageReference,
      "CallBackUrl": callBackURL,
      "Source": {
        "AccountNumber": sending ? _accNumber : accountNumber,
        "Amount": amount,
        "TransactionCurrency": transactionCurrency,
        "Narration": narration
      },
      "Destinations": [
        {
          "ReferenceNumber": '${messageReference}_1',
          "AccountNumber": sending ? accountNumber : _accNumber,
          "BankCode": bankCode,
          "Amount": amount,
          "TransactionCurrency": transactionCurrency,
          "Narration": narration
        }
      ]
    };
    // print(payload);

    final Map<String, String> headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer $_accessToken'
    };
    const bool trustSelfSigned = true;
    final HttpClient httpClient = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    final IOClient ioClient = IOClient(httpClient);

    try{
      final http.Response r = await ioClient.post(_url, headers: headers, body: json.encode(payload));
      // var r = await http.post(_url, headers: headers, body: json.encode(payload));
      print(r);
      print(r.statusCode);
      print(r.body);
      return json.decode(r.body);
    } catch (e){
      return e.toString();
    }

  }
}