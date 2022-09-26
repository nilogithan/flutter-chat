import 'package:flutter/material.dart';
import 'package:push_notification/chat_list/chat_list_view.dart';

class Routes{
   Routes._();

  static final routes = <String, WidgetBuilder>{
    ChatListView.routeName: (context) => ChatListView(),
  };
}