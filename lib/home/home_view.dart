
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:push_notification/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child){
        return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter push notification",style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Flutter push notification with firebase",style: TextStyle(color: Colors.black)),
        ),
        floatingActionButton: InkWell(
          onTap: ()=> model.triggerNotification(context:context),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.blue
            ),
            child: const Text("Notification",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0)),
          ),
        ),
      )
      );
      },
       onModelReady: (model) => model.initialise(context),
        viewModelBuilder: () => HomeViewModel()
    );
    
    
  }
}
