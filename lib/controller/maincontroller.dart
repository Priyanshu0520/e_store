
import 'package:firebase_auth/firebase_auth.dart';

class MainController {
  var auth = FirebaseAuth.instance;
  Future<bool?> getuserinfo() async {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
