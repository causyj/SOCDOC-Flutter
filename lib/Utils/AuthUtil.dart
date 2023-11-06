import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

<<<<<<< HEAD
Future<void> tryAppleLogin() async {
  final appleProvider = AppleAuthProvider();
  await FirebaseAuth.instance.signInWithProvider(appleProvider);
}

=======
>>>>>>> 50487db (Update AuthUtil : Added Function for Google Login Attempt)
Future<void> tryGoogleLogin() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  await FirebaseAuth.instance.signInWithCredential(credential);
}