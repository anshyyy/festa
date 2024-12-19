// // File: lib/wallet_ticket_library.dart

// import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'dart:convert';

// class WalletTicket {
//   final String id;
//   final String title;
//   final String subheader;
//   final String header;
//   final String qrCodeData;
//   final Map<String, String> additionalData;

//   WalletTicket({
//     String? id,
//     required this.title,
//     required this.subheader,
//     required this.header,
//     required this.qrCodeData,
//     this.additionalData = const {},
//   }) : id = id ?? const Uuid().v4();

//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "cardTitle": {"defaultValue": {"language": "en", "value": title}},
//       "subheader": {"defaultValue": {"language": "en", "value": subheader}},
//       "header": {"defaultValue": {"language": "en", "value": header}},
//       "barcode": {"type": "QR_CODE", "value": qrCodeData},
//       "textModulesData": additionalData.entries.map((e) => {
//             "header": e.key.toUpperCase(),
//             "body": e.value,
//             "id": e.key.toLowerCase()
//           }).toList(),
//     };
//   }
// }

// class WalletTicketManager {
//   static const String _issuerId = '3333000000000000000';
//   static const String _issuerEmail = 'example@example.com';
//   static const String _passClass = 'example';

//   static String createPassJson(WalletTicket ticket) {
//     final passData = {
//       "iss": _issuerEmail,
//       "aud": "google",
//       "typ": "savetowallet",
//       "origins": [],
//       "payload": {
//         "genericObjects": [
//           {
//             "id": "$_issuerId.${ticket.id}",
//             "classId": "$_issuerId.$_passClass",
//             "genericType": "GENERIC_TYPE_UNSPECIFIED",
//             "hexBackgroundColor": "#4285f4",
//             "logo": {
//               "sourceUri": {
//                 "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/pass_google_logo.jpg"
//               }
//             },
//             "heroImage": {
//               "sourceUri": {
//                 "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/google-io-hero-demo-only.jpg"
//               }
//             },
//             ...ticket.toJson(),
//           }
//         ]
//       }
//     };

//     return jsonEncode(passData);
//   }

//   static Widget buildAddToWalletButton(
//     WalletTicket ticket, {
//     required Function() onSuccess,
//     required Function() onCanceled,
//     required Function(Object) onError,
//     Locale locale = const Locale('en', 'US'),
//   }) {
//     return AddToGoogleWalletButton(
//       pass: createPassJson(ticket),
//       onSuccess: onSuccess,
//       onCanceled: onCanceled,
//       onError: onError,
//       locale: locale,
//     );
//   }
// }