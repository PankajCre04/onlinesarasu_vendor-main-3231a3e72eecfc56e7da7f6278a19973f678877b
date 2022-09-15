import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;
  SharedPreferences? pref;

  static const String _appName = "Localshoppi";
  Future initialise() async {
    pref = await SharedPreferences.getInstance();

    print("FCM Initalizing");
    if (Platform.isIOS) {
      // _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    _fcm.getToken().then((value) {
      // final box = GetStorage();
      // box.write('fcm_token', value);
      Constant.FCM_TOKEN = value!;
      pref!.setString("fcm_token", value);
      print("FCM Token: $value");
    });
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettings = InitializationSettings(android: AndroidInitializationSettings('logo'),);
    await _flutterLocalNotificationsPlugin!.initialize(initializationSettings);

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
          showBigPictureNotificationHiddenLargeIcon(message.data['image'],//message.notification!.android!.imageUrl!,
              message.data['image'],
              message.notification!.title!,
              message.notification!.body!,
            playSound
          );
        }else {
          bool playSound = await (message.notification!.title!.toLowerCase().contains("reached".toLowerCase()) || message.notification!.title!.toLowerCase().contains("received".toLowerCase()));
          showPublicNotification(message.notification!.title!, message.notification!.body!,playSound);
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
          showBigPictureNotificationHiddenLargeIcon(message.data['image'],//message.notification!.android!.imageUrl!,
              message.data['image'],
              message.notification!.title!, message.notification!.body!,
              playSound
          );
        }else {
          bool playSound = await (message.notification!.title!.toLowerCase().contains("reached".toLowerCase()) || message.notification!.title!.toLowerCase().contains("received".toLowerCase()));
          showPublicNotification(message.notification!.title!, message.notification!.body!,playSound);
        }
        // PushNotificationService.notificationHandler(message.data,message.notification!.title!,message.notification!.body!);
        // _notificationHandler(message.data,message.notification!.title!,message.notification!.body!);
      }

    });

  }
  static void clearAllNotification() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin!.cancelAll();
  }

  static Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  static Future<void> showBigPictureNotificationHiddenLargeIcon(String largeIcon,String pigPicture,
      String contentTitle,String contentMessage,bool playSound) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    final String largeIconPath = await _downloadAndSaveFile(
        largeIcon, 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(
        pigPicture, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
    BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
        hideExpandedLargeIcon: true,
        contentTitle: contentTitle,
        htmlFormatContentTitle: true,
        summaryText:contentMessage,
        htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        "${_appName + DateTime.now().microsecondsSinceEpoch.toString()}",
        _appName,
        channelDescription: _appName,
        largeIcon: FilePathAndroidBitmap(largeIconPath),
        playSound: playSound,
        channelShowBadge: true,
        icon: 'logo',
        sound: RawResourceAndroidNotificationSound('notification'),
        styleInformation: bigPictureStyleInformation);
    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics,iOS: IOSNotificationDetails(presentSound: playSound));
    await flutterLocalNotificationsPlugin.show(
        0, contentTitle, contentMessage, platformChannelSpecifics);
  }

  static Future<void> showPublicNotification( String contentTitle,String contentMessage,bool playSound) async {
    print("hello notification");
    print(contentTitle);
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        "${_appName + DateTime.now().microsecondsSinceEpoch.toString()}",
        _appName,
        icon: 'logo',
        channelDescription: _appName,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        playSound: playSound,
        channelShowBadge: true,
        sound: RawResourceAndroidNotificationSound('notification'),
        visibility: NotificationVisibility.public);
    NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics,iOS: IOSNotificationDetails(presentSound: playSound));
    await flutterLocalNotificationsPlugin.show(1, contentTitle,
      contentMessage, platformChannelSpecifics,);
  }

  static Future<void> notificationHandler(Map<String, dynamic> message,String title, String body) async {
    print("****************");
    print(message);
    print("****************");
    AndroidNotificationDetails _androidSpecifics =
    const AndroidNotificationDetails(
      _appName,
      _appName,
      importance: Importance.max,
      priority: Priority.high,
      icon: 'logo',
      groupKey: '',
      sound: RawResourceAndroidNotificationSound('notification'),
      playSound: true,
      enableLights: true,
      enableVibration: true,
    );

    NotificationDetails notificationPlatformSpecifics = NotificationDetails(
      android: _androidSpecifics,
      iOS: const IOSNotificationDetails(),
    );

    await _flutterLocalNotificationsPlugin!.show(
      0,
      title,
      body,
      // message['notification']['title'],
      // message['notification']['body'],
      notificationPlatformSpecifics,
    );
  }


  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      // Navigate to the create post view
      if (view == 'create_post') {
        //_navigationService.navigateTo(CreatePostViewRoute);
        //Get.to(); Go to some page
      }
      // If there's no view it'll just open the app on the first view
    }
  }

}
 Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  print("onBackground: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
  // var androidInitialize = new AndroidInitializationSettings('logo');
  // var iOSInitialize = new IOSInitializationSettings();
  // var initializationsSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  // NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin, true);
  //  bool playSound = await (message.notification!.title!.toLowerCase().contains("reached".toLowerCase()) || message.notification!.title!.toLowerCase().contains("received".toLowerCase()));
  // PushNotificationService.showPublicNotification(message.notification!.title!, message.notification!.body!,playSound);
}
