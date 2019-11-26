
import 'package:coop_bank_bridge/coop_bank_bridge.dart';

class InternalFundsTransferSerializer extends Serializable{
  String accountNumber;
  int amount;
  String transactionCurrency;
  String narration;

  @override
  Map<String, dynamic> asMap() {
    return {
      "accountNumber": accountNumber,
      "amount": amount,
      "transactionCurrency": transactionCurrency,
      "narration": narration
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    accountNumber = object['accountNumber'].toString();
    amount = int.parse(object['amount'].toString());
    transactionCurrency = object['transactionCurrency'].toString();
    narration = object['narration'].toString();
  }

}