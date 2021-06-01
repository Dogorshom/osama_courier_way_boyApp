import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';
import 'package:courierway_deliveryboy/order/order.dart';
import 'package:flutter/material.dart';
import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:courierway_deliveryboy/pages/home/new_order.dart';
import 'package:courierway_deliveryboy/pages/home/active_order.dart';
import 'package:courierway_deliveryboy/pages/home/history.dart';
import 'package:page_transition/page_transition.dart';
import 'package:courierway_deliveryboy/pages/notification.dart';

class HomeMain extends StatefulWidget {
  final Order order;
  final int initialIndex;
  HomeMain(
      {Key key, this.initialIndex, this.order}): super(key: key);
  // HomeMain({Key key, this.initialIndex}) : super(key: key);
  @override
  _HomeMainState createState() => _HomeMainState(initialIndex:initialIndex);
}

class _HomeMainState extends State<HomeMain> {
  final int initialIndex;
  _HomeMainState({this.initialIndex});
  int currentIndex;
  DateTime currentBackPressTime;
  @override
 /* void initState() {
    super.initState();
    currentIndex = 0;
  }*/

  /*void changePage(int index) {
    print(currentIndex);
    setState(() {
      currentIndex = index;
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: initialIndex??0,
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
        // bottomNavigationBar: BubbleBottomBar(
        //   //backgroundColor: Theme.of(context).appBarTheme.color,
        //   backgroundColor: secondaryColor,
        //   hasNotch: false,
        //   opacity: 0.2,
        //   currentIndex: currentIndex,
        //   onTap: changePage,
        //   /*borderRadius: BorderRadius.vertical(
        //     top: Radius.circular(
        //         16)), *///border radius doesn't work when the notch is enabled.
        //   elevation: 8,
        //   items: <BubbleBottomBarItem>[
        //     BubbleBottomBarItem(
        //       backgroundColor: whiteColor,
        //       icon: Icon(
        //         Icons.local_mall,
        //         color: whiteColor,
        //       ),
        //       activeIcon: Icon(
        //         Icons.local_mall,
        //         color: whiteColor,
        //       ),
        //       title: Text(
        //         AppLocalizations.of(context).translate('homePage', 'orderString'),
        //         style: bottomBarItemStyle,
        //       ),
        //     ),
        //     BubbleBottomBarItem(
        //       backgroundColor: whiteColor,
        //       icon: Icon(
        //         Icons.account_balance_wallet,
        //         color: whiteColor,
        //       ),
        //       activeIcon: Icon(
        //         Icons.account_balance_wallet,
        //         color: whiteColor,
        //       ),
        //       title: Text(
        //         AppLocalizations.of(context)
        //             .translate('homePage', 'walletString'),
        //         style: bottomBarItemStyle,
        //       ),
        //     ),
        //     BubbleBottomBarItem(
        //       backgroundColor: whiteColor,
        //       icon: Icon(
        //         Icons.person,
        //         color: whiteColor,
        //       ),
        //       activeIcon: Icon(
        //         Icons.person,
        //         color: whiteColor,
        //       ),
        //       title: Text(
        //         AppLocalizations.of(context)
        //             .translate('homePage', 'profileString'),
        //         style: bottomBarItemStyle,
        //       ),
        //     ),
        //   ],
        // ),
        body: TabBarView(
          children: [
            NewOrder(),
            ActiveOrder(order: widget.order),
            History(),
          ],
        ),
      ),
    );
  }
}
