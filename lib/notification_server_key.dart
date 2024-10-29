import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServerKey{

  final _fm=FirebaseMessaging.instance;

  getToken() async{
    try {
      
     final x=await _fm.getToken();
     print("Token: $x");
    }
    catch(e){
      print("Error getting");
    }
  }
}