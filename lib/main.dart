import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:part3/fcm.dart';
import 'package:part3/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:part3/provider/data_users.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Remove this method to stop OneSignal Debugging
/*   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none); */

  OneSignal.shared.setAppId("26f39338-3da0-4413-a556-84edf002d458");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      print('jalan open handle');
      print(openedResult.notification.additionalData);
      var data = openedResult.notification.additionalData;
      Get.to(Fcm(), arguments: data);
    });
    OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {});
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataUsers());

    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
