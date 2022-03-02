// import 'package:flutter/material.dart';
// import 'package:flutter_settings_screens/flutter_settings_screens.dart';
//
// class Account_Page extends StatelessWidget {
//   const Account_Page({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => SimpleSettingsTile(
//         title: "Account Settings",
//         subtitle: 'Privacy,Security,Langauge',
//         leading: Icon(
//           Icons.person,
//           color: Colors.red,
//         ),
//         child: SettingsScreen(
//           children: [
//             buildPrivacy(context),
//             buildSecurity(context),
//             buildAccountInfo(context)
//           ],
//         ),
//       );
// }
//
// Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
//       title: "Privacy",
//       subtitle: '',
//       leading: Icon(
//         Icons.privacy_tip,
//         color: Colors.red,
//       ),
//       onTap: () {},
//     );
//
// Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
//       title: "Security",
//       subtitle: '',
//       leading: Icon(
//         Icons.security,
//         color: Colors.red,
//       ),
//       onTap: () {},
//     );
//
// Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
//       title: "Account Info",
//       subtitle: '',
//       leading: Icon(
//         Icons.account_box_outlined,
//         color: Colors.red,
//       ),
//       onTap: () {},
//     );
