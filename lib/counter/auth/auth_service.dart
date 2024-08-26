import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final microsoftProvider = MicrosoftAuthProvider();
  final microOAUTH = OAuthProvider('microsoft.com');

  Future<void> signInUser() async {
    // microsoftProvider.setCustomParameters({prompt: 'consent', tenant: ''});
    microOAUTH.setCustomParameters(
        {'tenant': '926d8c3e-a149-481e-9339-92623ac50cb3'});
    await FirebaseAuth.instance.signInWithPopup(microOAUTH);
  }
}
