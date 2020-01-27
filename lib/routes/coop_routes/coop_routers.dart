import 'package:coop_bank_bridge/controllers/coop_controllers/coop_controllers.dart';
import 'package:coop_bank_bridge/coop_bank_bridge.dart';
import 'package:coop_bank_bridge/operations/coop_modules.dart' show checkBalance;

Router coopRoutes(Router router){

  // Cooperative Bank
  // pesalink send
  router
    .route('/thirdParties/coop/peaslink/send')
    .link(() => PesaLinkSendController());

  // internal funds transfer send
  router
    .route('/thirdParties/coop/ift/send')
    .link(() => CoopInternalFundsTransferSendController());
  
  // internal funds transfer send
  router
    .route('/thirdParties/coop/mpesa')
    .link(() => CoopMpesaController());

  // Balance
  router
    .route('/balance')
    .linkFunction((request)async{
      return Response.ok(await checkBalance());
    });

  return router;
}