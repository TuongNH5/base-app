// import 'package:flutter/material.dart';
//
//
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const WelcomeScreenUI();
//   }
// }
//
// class WelcomeScreenUI extends StatefulWidget {
//   const WelcomeScreenUI({super.key});
//
//   @override
//   State<WelcomeScreenUI> createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreenUI> {
//   final inReleaseProgress = injector<RemoteConfigManager>()
//       .getBool(RemoteConfigConstants.inReleaseProgress);
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         body: ColoredBox(
//           color: AppColors.veryLightPink,
//           child: SafeArea(
//             child: Scaffold(
//               body: Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image:
//                         AssetImage(Assets.images.backgroundWelcomeScreen.path),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: MediaQuery.of(context).size.width * 0.1,
//                         ),
//                         Assets.images.loginLogo.image(
//                           width: UiHelper.getScreenWidth(context) * 0.2,
//                           height: UiHelper.getScreenWidth(context) * 0.2,
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.width * 0.05,
//                         ),
//                         Text(
//                           S.current.welcome,
//                           style: AppFonts.boldBlackLarge.copyWith(fontSize: 30),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         _buildBigPicture(context),
//                         _buildText(context),
//                       ],
//                     ),
//                     Positioned(
//                       bottom: MediaQuery.of(context).size.height * 0.05,
//                       child: GestureDetector(
//                         onTap: () {
//                           if (inReleaseProgress) {
//                             AppNavigator.pushNamedAndRemoveUntil(
//                                 const LoginScreenExternalRoute(),
//                                 (route) => false);
//                           } else {
//                             AppNavigator.push(AppRouter.login);
//                           }
//                         },
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(24)),
//                             gradient: LinearGradient(
//                               begin: Alignment.topRight,
//                               end: Alignment.bottomLeft,
//                               colors: [
//                                 AppColors.primaryBlue500,
//                                 AppColors.blue200,
//                               ],
//                             ),
//                           ),
//                           width: MediaQuery.of(context).size.width * 0.8,
//                           height: 45,
//                           child: Text(
//                             S.current.login,
//                             style: AppFonts.boldWhiteXLarge,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildText(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.8,
//       child: Column(
//         children: [
//           FittedBox(
//             fit: BoxFit.fitWidth,
//             child: Text(
//               'Chào mừng bạn đến với My PT!',
//               style: AppFonts.boldBlack600XxxLarge.copyWith(
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           // Text(
//           //   S.current.welcomeDescription,
//           //   style: AppFonts.regularBlackXLarge.copyWith(color: Colors.grey),
//           //   textAlign: TextAlign.center,
//           //   maxLines: 2,
//           // ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBigPicture(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.7,
//       height: MediaQuery.of(context).size.height * 0.4,
//       child: Stack(
//         children: [
//           Assets.images.welcomeScreenImage.image(
//             width: MediaQuery.of(context).size.width * 0.7,
//           ),
//         ],
//       ),
//     );
//   }
// }
