import 'package:coop_bank_bridge/coop_bank_bridge.dart';
import 'package:coop_bank_bridge/operations/coop_modules.dart' show CoopInternalFundsTransferOperations;
import 'package:coop_bank_bridge/serializers/coop_serializers.dart' show InternalFundsTransferSerializer;

class CoopInternalFundsTransferSendController extends ResourceController{
  @Operation.post()
  Future<Response> transact(@Bind.body() InternalFundsTransferSerializer _iftSerializer)async{
    final CoopInternalFundsTransferOperations _ift = CoopInternalFundsTransferOperations(
      accountNumber: _iftSerializer.accountNumber,
      amount: _iftSerializer.amount,
      transactionCurrency: _iftSerializer.transactionCurrency,
      narration: _iftSerializer.narration
    );
    final _response = await _ift.send;

    return Response.ok(_response);
  }
}