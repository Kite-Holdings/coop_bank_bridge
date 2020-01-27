
import 'package:coop_bank_bridge/coop_bank_bridge.dart';

class CoopMpesaSerializer extends Serializable{
  String phoneNo;
  int amount;
  String transactionCurrency;
  String narration;

  @override
  Map<String, dynamic> asMap() {
    return {
      "phoneNo": phoneNo,
      "amount": amount,
      "transactionCurrency": transactionCurrency,
      "narration": narration
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    phoneNo = object['phoneNo'].toString();
    amount = int.parse(object['amount'].toString());
    transactionCurrency = object['transactionCurrency'].toString();
    narration = object['narration'].toString();
  }

}