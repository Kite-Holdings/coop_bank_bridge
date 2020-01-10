import 'package:coop_bank_bridge/coop_bank_bridge.dart';
import 'package:coop_bank_bridge/operations/test_operations.dart';

Router testRoute(Router router){
  router
    .route("/test/greaterThan")
    .linkFunction((request)async{
      print('greaterthan chanell............');
    return Response.ok(await greaterThan());
  });
  router
    .route("/test/lessThan")
    .linkFunction((request)async{
    return Response.ok(await lessThan());
  });
  router
    .route("/test/greaterThanThree")
    .linkFunction((request)async{
    return Response.ok(await greaterThanThree());
  });
  router
    .route("/test/lessThanThree")
    .linkFunction((request)async{
    return Response.ok(await lessThanThree());
  });
  router
    .route("/test/notEqual")
    .linkFunction((request)async{
    return Response.ok(await notEqual());
  });
  router
    .route("/test/zero")
    .linkFunction((request)async{
    return Response.ok(await zero());
  });
  router
    .route("/test/invalidValues")
    .linkFunction((request)async{
    return Response.ok(await invalidValues());
  });
  router
    .route("/test/missingValue")
    .linkFunction((request)async{
    return Response.ok(await missingValue());
  });
  router
    .route("/test/missingParameter")
    .linkFunction((request)async{
    return Response.ok(await missingParameter());
  });
  router
    .route("/test/diplicateMessageRef")
    .linkFunction((request)async{
    return Response.ok(await diplicateMessageRef());
  });
  router
    .route("/test/missingCurrency")
    .linkFunction((request)async{
    return Response.ok(await missingCurrency());
  });
  router
    .route("/test/missingAmount")
    .linkFunction((request)async{
    return Response.ok(await missingAmount());
  });
  router
    .route("/test/missingBranchCode")
    .linkFunction((request)async{
    return Response.ok(await missingBranchCode());
  });
  router
    .route("/test/missingDestination")
    .linkFunction((request)async{
    return Response.ok(await missingDestination());
  });
  router
    .route("/test/missingNaration")
    .linkFunction((request)async{
    return Response.ok(await missingNaration());
  });
  router
    .route("/test/missingSource")
    .linkFunction((request)async{
    return Response.ok(await missingSource());
  });
  return router;
}