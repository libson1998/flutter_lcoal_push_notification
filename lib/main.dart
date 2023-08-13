import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/local_notification.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotification.initialize(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Notifications Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Notifications')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            LocalNotification.showBigTextNotification(
                title: "Hello",
                body: "erangi poda nari",
                flutterLocalNotificationsPlugin:
                    flutterLocalNotificationsPlugin);
          },
          child: const Text('Schedule Notification'),
        ),
      ),
    );
  }
}
