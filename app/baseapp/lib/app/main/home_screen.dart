import 'package:baseapp/app/screen_boarding/onboarding_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print('HomeScreen build');
    // return   GoogleSignInScreen();
return OnBoardingScreen();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your username',
            ),
          ),
          Text("global.hotHotel".tr()),
          CupertinoButton(
            child: const Text('Details'),
            onPressed: () => context.push('/details/123').then((value) {
              print('pop value: $value');
            }),
          ),
        ],
      ),
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// class GoogleSignInScreen extends StatefulWidget {
//   const GoogleSignInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
// }
//
// class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
//   ValueNotifier userCredential = ValueNotifier('');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Google SignIn Screen')),
//         body: ValueListenableBuilder(
//             valueListenable: userCredential,
//             builder: (context, value, child) {
//               return (userCredential.value == '' || userCredential.value == null)
//                   ? Center(
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                         child: IconButton(
//                           iconSize: 40,
//                           icon: Image.asset(
//                             'assets/images/google_icon.png',
//                           ),
//                           onPressed: () async {
//                             userCredential.value = await signInWithGoogle();
//                             if (userCredential.value != null) print(userCredential.value.user!.email);
//                           },
//                         ),
//                       ),
//                     )
//                   : Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             clipBehavior: Clip.antiAlias,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle, border: Border.all(width: 1.5, color: Colors.black54)),
//                             child: Image.network(userCredential.value.user!.photoURL.toString()),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(userCredential.value.user!.displayName.toString()),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(userCredential.value.user!.email.toString()),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           ElevatedButton(
//                               onPressed: () async {
//                                 bool result = await signOutFromGoogle();
//                                 if (result) userCredential.value = '';
//                               },
//                               child: const Text('Logout'))
//                         ],
//                       ),
//                     );
//             }));
//   }
//   // Future<bool> signOutFromGoogle() async {
//   //   try {
//   //     await FirebaseAuth.instance.signOut();
//   //     return true;
//   //   } on Exception catch (_) {
//   //     return false;
//   //   }
//   // }
//   // Future<dynamic> signInWithGoogle() async {
//   //   try {
//   //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   //
//   //     final GoogleSignInAuthentication? googleAuth =
//   //     await googleUser?.authentication;
//   //
//   //     final credential = GoogleAuthProvider.credential(
//   //       accessToken: googleAuth?.accessToken,
//   //       idToken: googleAuth?.idToken,
//   //     );
//   //
//   //     return await FirebaseAuth.instance.signInWithCredential(credential);
//   //   } on Exception catch (e) {
//   //     // TODO
//   //     print('exception->$e');
//   //   }
//   // }
// }
