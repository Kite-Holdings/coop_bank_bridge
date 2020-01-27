import 'package:coop_bank_bridge/coop_bank_bridge.dart';
import 'package:coop_bank_bridge/operations/coop_modules.dart' show PesalinkOperations;
import 'package:coop_bank_bridge/serializers/coop_serializers.dart' show PesalinkSerializer;

class PesaLinkSendController extends ResourceController{
  @Operation.post()
  Future<Response> transact(@Bind.body() PesalinkSerializer _pesalinkSerializer)async{
    final PesalinkOperations _pesalink = PesalinkOperations(
      accountNumber: _pesalinkSerializer.accountNumber,
      amount: _pesalinkSerializer.amount,
      transactionCurrency: _pesalinkSerializer.transactionCurrency,
      narration: _pesalinkSerializer.narration,
      bankCode: _pesalinkSerializer.bankCode,
    );
    final _response = await _pesalink.send;

    return Response.ok(_response);
  }
}