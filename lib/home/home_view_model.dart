
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:push_notification/chat_list/chat_list_view.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  String messageTitle = "Empty";
String notificationAlert = "alert";

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  initialise(BuildContext context) {
    _firebaseMessaging.subscribeToTopic("all").then((onValue) {});
      _getToken();
      FirebaseMessaging.onMessage.listen((message){
         debugPrint("messsage : $message");
         debugPrint("messsage : ${message.notification!.title}");
         triggerNotification(context: context,title: message.notification!.title,message: message.notification!.body);
      });

  }

  triggerNotification({required BuildContext context,String? title = "",String? message = ""}) {
    // toast('Hello world!');

    // show a notification at top of screen.
    showSimpleNotification(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
              Text(title!),
             Text(message!),
          ],
        ),
        background: Colors.green);
  }
  
  void _getToken() async{
    try {
      _firebaseMessaging.getToken().then((token) async {
        debugPrint("Device Token : $token");
      });
    } catch (e, st) {
     debugPrint("exception : $e \n Stacktrace : $st");
    }
  }

  moveChatList({required BuildContext context}) {
    Navigator.pushNamed(context, ChatListView.routeName);
  }
}