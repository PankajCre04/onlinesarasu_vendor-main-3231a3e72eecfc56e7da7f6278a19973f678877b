import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/MainBinding.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/themes.dart';
import 'package:sooooperbusiness/controllers/authcontrollers.dart';
import 'package:sooooperbusiness/controllers/getstartedcontroller.dart';
import 'package:sooooperbusiness/exparimant/in_app_update.dart';
import 'package:sooooperbusiness/service/push_notification_services.dart';
import 'package:sooooperbusiness/views/authentication/create_new_password.dart';
import 'package:sooooperbusiness/views/authentication/getstarted.dart';
import 'package:sooooperbusiness/views/authentication/loginscreen.dart';
import 'package:sooooperbusiness/views/authentication/send_password_otp.dart';
import 'package:sooooperbusiness/views/authentication/signupscreen.dart';
import 'package:sooooperbusiness/views/dashboard/homeroot.dart';
import 'package:sooooperbusiness/views/mainsplashscreen.dart';
import 'package:sooooperbusiness/views/owner/addrestaurant.dart';
import 'package:sooooperbusiness/views/splashscreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sooooperbusiness/views/unknownroute.dart';
import 'package:http/http.dart' as http;
import 'views/authentication/accountwelcome.dart';
import 'package:path_provider/path_provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  PushNotificationService pushNotificationService = PushNotificationService();
  pushNotificationService.initialise();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.setAutoInitEnabled(false);
  // await Firebase.initializeApp().whenComplete(() {
  //   print("completed");
  // });
  FirebaseMessaging.instance.getToken().then((value) {
    print(value);
    Constant.FCM_TOKEN = value!;
  });
  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification!.body.toString()}');
      print('Message also contained a notification: ${message.notification!.title}');
      // print('Message also contained a notification: ${message..}');
      print(message.data['image']);
      if(message.data['image']!=null){
        bool playSound = await (message.notification!.title!.toLowerCase().contains("reached".toLowerCase()) || message.notification!.title!.toLowerCase().contains("received".toLowerCase()));
        PushNotificationService.showBigPictureNotificationHiddenLargeIcon(message.data['image'],//message.notification!.android!.imageUrl!,
            message.data['image'],
            message.notification!.title!,
            message.notification!.body!,
            playSound
        );
      }else {
        bool playSound = await (message.notification!.title!.toLowerCase().contains("reached".toLowerCase()) || message.notification!.title!.toLowerCase().contains("received".toLowerCase()));
        PushNotificationService.showPublicNotification(message.notification!.title!, message.notification!.body!,playSound);
      }
      // PushNotificationService.notificationHandler(message.data,message.notification!.title!,message.notification!.body!);
      // _notificationHandler(message.data,message.notification!.title!,message.notification!.body!);
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    print('Got a message whilst in the background!');
    print('Message data: ${message.data}');
    if (message.notification!.titleLocKey != null) {
      print('Message also contained a notification: ${message.notification}');
      print('Message also contained a notification: ${message.notification!.title}');
      print(message.data['image']);
      if(message.data['image']!=null){
        bool playSound = await (message.notification!.title!.toLowerCase().contains("reached".toLowerCase()) || message.notification!.title!.toLowerCase().contains("received".toLowerCase()));
        PushNotificationService.showBigPictureNotificationHiddenLargeIcon(message.data['image'],//message.notification!.android!.imageUrl!,
            message.data['image'],
            message.notification!.title!, message.notification!.body!,
            playSound
        );
      }else {
        bool playSound = await (message.notification!.title!.toLowerCase().contains("reached".toLowerCase()) || message.notification!.title!.toLowerCase().contains("received".toLowerCase()));
        PushNotificationService.showPublicNotification(message.notification!.title!, message.notification!.body!,playSound);
      }
      // PushNotificationService.notificationHandler(message.data,message.notification!.title!,message.notification!.body!);
      // _notificationHandler(message.data,message.notification!.title!,message.notification!.body!);
    }

  });
  print(Constant.FCM_TOKEN + "dd");
SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${Constant.appName} Vendor',
      color: Constant.white,
      theme: CustomTheme.lightTheme,
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => MainSplashScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<GetStartedController>(() => GetStartedController());
              Get.lazyPut<AuthControllers>(() => AuthControllers());
            }),
            transition: Transition.zoom),
        GetPage(
            name: '/splash',
            page: () => SplashScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<GetStartedController>(() => GetStartedController());
              Get.lazyPut<AuthControllers>(() => AuthControllers());
            }),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/signUp',
            page: () => SignUpScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<GetStartedController>(() => GetStartedController());
              Get.lazyPut<AuthControllers>(() => AuthControllers());
            }),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: '/getstarted',
            page: () => GetStartedScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<GetStartedController>(() => GetStartedController());
              Get.lazyPut<AuthControllers>(() => AuthControllers());
            }),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: '/welcomeaccount',
            page: () => AccountWelcome(),
            binding: BindingsBuilder(() {
              Get.lazyPut<GetStartedController>(() => GetStartedController());
              Get.lazyPut<AuthControllers>(() => AuthControllers());
            }),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: '/login',
            page: () => LoginScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<GetStartedController>(() => GetStartedController());
              Get.lazyPut<AuthControllers>(() => AuthControllers());
            }),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: '/homeroot',
            page: () => HomeRoot(),
            transition: Transition.rightToLeftWithFade,

            binding: MainBinding()),
        GetPage(
            name: '/sendPasswordOtp',
            page: () => SendPasswordOtpScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/createNewPassword',
            page: () => CreateNewPassword(),
            transition: Transition.rightToLeft),
        // GetPage(
        //     name: '/addrestaurant',
        //     page: () => AddEditRestaurant(),
        //     transition: Transition.rightToLeftWithFade)
      ],
      unknownRoute: GetPage(
          name: '/unknownRoute',
          page: () => unknownPage(),
          transition: Transition.rightToLeft),
    );
  }
}
