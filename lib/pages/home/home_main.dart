import 'package:courierway_deliveryboy/functions/localizations.dart';
import 'package:flutter/material.dart';
import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:courierway_deliveryboy/pages/home/new_order.dart';
import 'package:courierway_deliveryboy/pages/home/active_order.dart';
import 'package:courierway_deliveryboy/pages/home/history.dart';
import 'package:page_transition/page_transition.dart';
import 'package:courierway_deliveryboy/pages/notification.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: secondaryColor,
          title: Text(
            AppLocalizations.of(context)
                .translate('homeMainPage', 'ordersString'),
            style: bigHeadingStyle,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications, color: blackColor),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: Notifications()));
              },
            ),
          ],
          bottom: TabBar(
           // unselectedLabelColor: Colors.grey.withOpacity(0.3),
            unselectedLabelColor: Colors.white38,
            labelColor: whiteColor,
            indicatorColor: whiteColor,
            tabs: [
              Tab(
                  text: AppLocalizations.of(context)
                      .translate('homeMainPage', 'newString')),
              Tab(
                  text: AppLocalizations.of(context)
                      .translate('homeMainPage', 'activeString')),
              Tab(
                  text: AppLocalizations.of(context)
                      .translate('homeMainPage', 'historyString')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NewOrder(),
            ActiveOrder(),
            History(),
          ],
        ),
      ),
    );
  }
}
