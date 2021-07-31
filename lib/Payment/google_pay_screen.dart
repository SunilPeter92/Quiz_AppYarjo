// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_stripe/flutter_stripe.dart';
// //import 'package:stripe_platform_interface/stripe_platform_interface.dart';
// import 'package:pay/pay.dart' as pay;
// import 'package:quizapp/ApiClass/API.dart';
//
// import 'config.dart';
//
//
// const _paymentItems = [
//   pay.PaymentItem(
//     label: 'Total',
//     amount: '1',
//     status: pay.PaymentItemStatus.final_price,
//   )
// ];
//
// class GooglePayScreen extends StatefulWidget {
//   int id ;
//   String credit ;
//   @override
//   GooglePayScreen({Key key,  this.id, this.credit}) : super(key: key);
//
//   _GooglePayScreenState createState() => _GooglePayScreenState();
// }
//
// class _GooglePayScreenState extends State<GooglePayScreen> {
//   @override
//   void initState() {
//     Stripe.publishableKey = "pk_test_51JDG9UJV5I3x98yNlnepoll8KEZPe5lWWXV2NfniOhMXlPACcCbcCxijRsS67j288okE1m8KHEflgwYubEPk2MR800JMyyWRku";
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   void update() {
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: pay.GooglePayButton(
//               paymentConfigurationAsset: 'google_pay_payment_profile.json',
//               paymentItems: _paymentItems,
//               margin: const EdgeInsets.only(top: 15),
//               onPaymentResult: onGooglePayResult,
//               loadingIndicator: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//               onPressed: () async {
//                 // 1. Add your stripe publishable key to assets/google_pay_payment_profile.json
//              //   await debugChangedStripePublishableKey();
//               },
//               onError: (e) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text(
//                         'There was an error while trying to perform the payment'),
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//
//
//   Future<void> onGooglePayResult(paymentResult) async {
//     try {
//       // 1. Add your stripe publishable key to assets/google_pay_payment_profile.json
//       print("payment result: "+paymentResult.toString());
//
//       final token =
//       paymentResult['paymentMethodData']['tokenizationData']['token'];
//       final tokenJson = Map.castFrom(json.decode(token));
//       print("token is: "+tokenJson['id']);
//
//       // 2. fetch Intent Client Secret from backend
//      // final response = await fetchPaymentIntentClientSecret();
//     //  print("response is: "+response.toString());
//       final clientSecret="sk_test_51JDG9UJV5I3x98yNrSVPkXc8RopUEwAGyCs6y9HUlfck52ysAxuWL6A5U9EKwEZVv1UIAKWbvLpkKW8PkLJbtz7200KJIfmoqQ";
//
//     //  final clientSecret = response['clientSecret'];
//
//
//
//       final params = PaymentMethodParams.cardFromToken(
//         token: tokenJson['id'], // TODO extract the actual token
//       );
//       print('params: ');
//       print(params);
//
//       // 3. Confirm Google pay payment method
//       await Stripe.instance.confirmPayment(
//         clientSecret,
//         params,
//       );
//       _BUYCREDIT(widget.id , widget.credit);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Google Pay payment succesfully completed')),
//       );
//     } catch (e) {
//       print("error is: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }
//
//   Future<Map<String, dynamic>> fetchPaymentIntentClientSecret() async {
//     final url = Uri.parse('$kApiUrl/create-payment-intent');
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({
//         'email': 'example@gmail.com',
//         'currency': 'usd',
//         'items': [
//           {'id': 'id'}
//         ],
//         'request_three_d_secure': 'any',
//       }),
//
//     );
//     print("error is: $response");
//
//     return json.decode(response.body);
//   }
//
//   Future<void> debugChangedStripePublishableKey() async {
//     if (kDebugMode) {
//       final profile =
//           await rootBundle.loadString('assets/google_pay_payment_profile.json');
//       final isValidKey = !profile.contains('pk_test_51JDG9UJV5I3x98yNlnepoll8KEZPe5lWWXV2NfniOhMXlPACcCbcCxijRsS67j288okE1m8KHEflgwYubEPk2MR800JMyyWRku');
//       assert(
//         isValidKey,
//         'No stripe publishable key added to assets/google_pay_payment_profile.json',
//       );
//     }
//   }
//
//   _BUYCREDIT(uid , price){
//     API.BuyCredit(
//         context,
//         uid.toString(),
//         price).then((value) {
//       if(value == '201' ){
//         Fluttertoast.showToast(
//             msg: 'Success',
//             toastLength: Toast.LENGTH_SHORT);
//       } else{
//         Fluttertoast.showToast(
//             msg: 'Enter Valid Credential',
//             toastLength: Toast.LENGTH_SHORT);
//       }
//
//     });
//   }
// }
