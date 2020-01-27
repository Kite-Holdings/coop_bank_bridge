import 'package:aqueduct/aqueduct.dart';
import 'package:coop_bank_bridge/operations/coop_modules.dart' show CoopMpesaOperations;
import 'package:coop_bank_bridge/serializers/coop_serializers.dart' show CoopMpesaSerializer;

class CoopMpesaController extends ResourceController{
  @Operation.post()
  Future<Response> transact(@Bind.body() CoopMpesaSerializer _coopMpesaSerializer)async{
    final CoopMpesaOperations _coopMpesa = CoopMpesaOperations(
      phoneNo: _coopMpesaSerializer.phoneNo,
      amount: _coopMpesaSerializer.amount,
      narration: _coopMpesaSerializer.narration
    );
    final _response = await _coopMpesa.send;

    return Response.ok(_response);
  }
}