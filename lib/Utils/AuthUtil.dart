import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> tryAppleLogin() async {
  final appleProvider = AppleAuthProvider();
  appleProvider.addScope('email');
  await FirebaseAuth.instance.signInWithProvider(appleProvider);
}

Future<void> tryGoogleLogin() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> tryLogin(var type) async {
  type == 0 ? tryAppleLogin() : tryGoogleLogin();
}

Future<bool> tryLogout() async {
  await FirebaseAuth.instance.signOut();
  return (FirebaseAuth.instance.currentUser == null);
}

Future<bool> tryDeleteUser() async {
  if(FirebaseAuth.instance.currentUser != null){
    await FirebaseAuth.instance.currentUser!.delete();
    return tryLogout();
  }

  return false;
}