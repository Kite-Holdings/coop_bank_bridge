String databaseName = 'wallet';
String databaseUrl = "mongodb://localhost:27017/$databaseName";
String companyCode = '001';
double walletRate = 0.0;
double thirdPatyRate = 3.0;

// String pesalinkTokenUrl = "https://developer.co-opbank.co.ke:8243/token";
String pesalinkTokenUrl = "https://openapi-sit.co-opbank.co.ke:8243/token";
String pesalinkTransactUrl = "https://openapi-sit.co-opbank.co.ke/FundsTransfer/External/A2A/PesaLink/1.0.0";
// String pesalinkTransactUrl = "https://developer.co-opbank.co.ke:8280/FundsTransfer/External/A2A/PesaLink/1.0.0";
String pesalinkAuth = "Basic 94dd25a9-b7e1-3906-a2f6-50525b622f35";
Map<String, String> pesaLinkCredetials = {
  "username": "KITE",
  "password": "K!te_2019",
};

const String consumerKey = 'U_nfk2fd4wKd5wq40CIjJxe358ca'; 
const String consumerSecret = 'Agp2G_I84jLlcBLVHcaW41UZdeoa'; 
// const String bearerToken = '94dd25a9-b7e1-3906-a2f6-50525b622f35'; 