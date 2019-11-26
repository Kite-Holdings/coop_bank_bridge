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
        const bool trustSelfSigned = true;
        final HttpClient httpClient = HttpClient()
          ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
        final IOClient ioClient = IOClient(httpClient);
        await ioClient.get('https://api-sit.co-opbank.co.ke/store/');
      return Response.ok({'hi': 'hi'});
    });

    return router;
  }
}