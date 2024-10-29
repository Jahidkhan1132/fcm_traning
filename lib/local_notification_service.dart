import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService{
  static final flutterLocalNotificationPlugin =FlutterLocalNotificationsPlugin();

  static void initLocalNotification(){
    flutterLocalNotificationPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        )
    );
  }

  static void showLocalNotification(RemoteMessage message) {
    try {
      var randomId = DateTime
          .now()
          .microsecondsSinceEpoch ~/ 1000;
      flutterLocalNotificationPlugin.show(
          0, message.notification?.title, message.notification?.body,
          const NotificationDetails(
              android: AndroidNotificationDetails(
                "channel_id_fcm_training", "channelNameFcmTraning",
                importance: Importance.max,
                priority: Priority.high,)
          ));
    }catch(error){
      print(error);
    }
  }
}