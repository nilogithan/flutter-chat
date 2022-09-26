// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:push_notification/chat_list/chat_list_view_model.dart';
import 'package:push_notification/theme/theme_text.dart';
import 'package:push_notification/widgets/common_widgets.dart';
import 'package:stacked/stacked.dart';

import '../theme/theme.dart';

class ChatListView extends StatelessWidget {
  static const routeName = "/chatList";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatListViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: const Text("Chat List",
                  style: TextStyle(color: Colors.black)),
              centerTitle: true,
            ),
            body: Column(
              children: [
                shops(
                  imgUrl: "https://cdn.dribbble.com/users/2518758/screenshots/12115981/media/3318424483e2a6408b3867df62acb133.jpg?compress=1&resize=1600x1200&vertical=top",
                  rating: 2.0,
                  title: 'Hello'
                ),
              ],
            ),
          ));
        },
        onModelReady: (model) => model.initialise(context),
        viewModelBuilder: () => ChatListViewModel());
  }
}

Widget shops({String? imgUrl, String? title, double? rating = 0.0, int? ratingCount = 1, double? distance}) {
  return Container(
    decoration: BoxDecoration(color: BrandTheme.keyLight, borderRadius: BorderRadius.circular(8.0)),
    height: 90,
    margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
    child: Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Expanded(
          // flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ThemedText.subtitle2Bold(title, BrandTheme.keyDark, 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (rating! > 0 && ratingCount! > 0)
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: BrandTheme.brandColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: ThemedText.subtitle2(
                              double.parse(rating.toStringAsFixed(1)).toString(), BrandTheme.brandColor, 2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: ThemedText.subtitle2(
                              rating > 4.5 ? ' excellent' : '', BrandTheme.brandColor, 2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: ThemedText.subtitle2(
                              ratingCount > 250 ? '(250+)' : '($ratingCount)', BrandTheme.carbonGray, 2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: ThemedText.caption(' • ', BrandTheme.carbonGray, 2),
                        ),
                      ],
                    ),
                 
                ],
              ),
              
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        if (imgUrl != null && imgUrl != "")
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: ComWid.cacheImage(100, imgUrl.toString(), needSqureImage: true),
          ),
      ],
    ),
  );
}
