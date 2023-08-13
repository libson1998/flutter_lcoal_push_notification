import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {


  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var iOSPermission = FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();

    var androidPermission = AndroidFlutterLocalNotificationsPlugin();

    await iOSPermission?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

    await androidPermission.requestPermission();


    var androidInitialize =
        const AndroidInitializationSettings('@drawable/ic_launcher');


    
    DarwinInitializationSettings initializationSettingsDarwin =
        const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: androidInitialize, iOS: initializationSettingsDarwin);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showBigTextNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      "my_trial_notification",
      "channel name",
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(presentSound: false);
    var not = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    try {
      await flutterLocalNotificationsPlugin.show(0, title, body, not);
    } catch (e) {
      print(e);
    }
  }
}
