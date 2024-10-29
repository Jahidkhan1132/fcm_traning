
import 'dart:convert';
import 'dart:io';

class PushNotification {
  // final baseUrl = "https://us-central1-urlifemebership.cloudfunctions.net/app/";
   static const fcmServerKey = "key=AAAAOVn2y0A:APA91bFfcFvxqHr4NA7Ah0Xsc4_W0vkTaLj2fXN-m7fmur48Q9EfIYLXxKSGVg6Fpoq2YGvtFGHU__LPwubI-kW_4yQVtFjRNoLNDr0vp42qZAcd7VVdOo3dsYsSxsG9NzuEK2PU06As";
  final httpClient = HttpClient();

  // call this fun for sending notification to one app to another app or app to app
  sendNotification(String title, String body, String id, List<String> to,
      String type) async {
    var notificationData = {
      "registration_ids": [to[0]],
      "notification": {
        "body": body,
        "title": title,
        "android_channel_id": "channel_id_fcm_training",
        "sound": true
      },
      "data": {"_id": id, "_type": type}
    };

    final client = HttpClient();
    final request =
        await client.postUrl(Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.headers.set("Content-Type", "application/json; charset=UTF-8");
    request.headers.set("Authorization", fcmServerKey);
    request.add(utf8.encode(json.encode(notificationData)));
    final response = await request.close();
    print(response.statusCode);
  }

}
