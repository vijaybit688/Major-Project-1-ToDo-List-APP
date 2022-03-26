

import 'package:flutter/material.dart';
import 'package:todolist/components/constents/colors.dart';
import 'package:url_launcher/url_launcher.dart';
class Setting extends StatelessWidget {
  _launchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.skytechnohub.todolist';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DEEP_PURPLE,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 30, bottom: 10),
            child: Text(
              "Settings",
              style: TextStyle(color: WHITE_COLOR, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 10, bottom: 10),
            child: TextButton(
              onPressed: () {
                _launchURL();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: WHITE_COLOR,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Please Rate our app We will be waiting for your review ",
                      style: TextStyle(color: WHITE_COLOR, fontSize:24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
            ),
            child: TextButton(
              onPressed: () {
                _launchURL();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.rate_review,
                    color: WHITE_COLOR,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Give Your Review",
                    style: TextStyle(color: WHITE_COLOR, fontSize: 24),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
