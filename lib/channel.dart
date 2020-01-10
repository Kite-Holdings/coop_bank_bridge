import 'package:coop_bank_bridge/controllers/coop_controllers/coop_controllers.dart';
import 'package:coop_bank_bridge/operations/balance.dart';
import 'package:coop_bank_bridge/operations/fetchCoopToken.dart';
import 'package:coop_bank_bridge/test_routes.dart';
import 'package:http/io_client.dart';

import 'coop_bank_bridge.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class CoopBankBridgeChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/")
      // .link(() => Authorizer.bearer(BearerAouthVerifier()))
      .linkFunction((request)async{
        print(await request.body.decode());
      //   final _res = await fetchCoopToken();
      return Response.ok({"message": 'hi'});
    });

    // Cooperative Bank
    // pesalink send
    router
      .route('/thirdParties/coop/peaslink/send')
      .link(() => PesaLinkSendController());

    // pesalink receive
    router
      .route('/thirdParties/coop/peaslink/receive')
      .link(() => PesaLinkReceiveController());

    // internal funds transfer send
    router
      .route('/thirdParties/coop/ift/send')
      .link(() => CoopInternalFundsTransferSendController());

    // internal funds transfer receive
    router
      .route('/thirdParties/coop/ift/receive')
      .link(() => CoopInternalFundsTransferReceiveController());

    // Balance
    router
      .route('/balance')
      .linkFunction((request)async{
        return Response.ok(await checkBalance());
      });

    testRoute(router);

    return router;
  }
}