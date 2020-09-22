
 import 'package:firebase_auth/firebase_auth.dart';


UserCustom _userToUserModel(User user) {
    if (user == null) {
      return null;
    }
    return UserCustom(uid: user.uid);
  }

  // is connected ?
  @override
  Future<UserCustom> isConnected() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null){

        return _userToUserModel(user);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

// custom user model
class UserCustom {
  String uid;
  UserCustom({ this.uid});
  
}