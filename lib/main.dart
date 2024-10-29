import 'package:fcm_traning/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'local_notification_service.dart';
Future<void> backgroundHandler(RemoteMessage message) async {
 if(message!=null) {
   print(message.data.toString());
   print(message.notification!.title);
  }
else {
  print("No message");
 }}
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
FirebaseMessaging.onMessage.listen((RemoteMessage message){
  print("title:${message.notification?.title}");
  print("body:${message.notification?.body}");
});
FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
  print("title:${message.notification?.title}");
  print("body:${message.notification?.body}");
});
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

  LocalNotificationService.initLocalNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),);
  }
}
