import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';
import 'package:courierway_deliveryboy/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:courierway_deliveryboy/pages/home/home_main.dart';
import 'package:courierway_deliveryboy/pages/wallet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex;
  DateTime currentBackPressTime;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    // print("currIndex = " );
    print(currentIndex);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        //backgroundColor: Theme.of(context).appBarTheme.color,
        backgroundColor: secondaryColor,
        hasNotch: false,
        opacity: 0.2,
        currentIndex: currentIndex,
        onTap: changePage,
        /*borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), *///border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: whiteColor,
            icon: Icon(
              Icons.local_mall,
              color: whiteColor,
            ),
            activeIcon: Icon(
              Icons.local_mall,
              color: whiteColor,
            ),
            title: Text(
              AppLocalizations.of(context).translate('homePage', 'orderString'),
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: whiteColor,
            icon: Icon(
              Icons.account_balance_wallet,
              color: whiteColor,
            ),
            activeIcon: Icon(
              Icons.account_balance_wallet,
              color: whiteColor,
            ),
            title: Text(
              AppLocalizations.of(context)
                  .translate('homePage', 'walletString'),
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: whiteColor,
            icon: Icon(
              Icons.person,
              color: whiteColor,
            ),
            activeIcon: Icon(
              Icons.person,
              color: whiteColor,
            ),
            title: Text(
              AppLocalizations.of(context)
                  .translate('homePage', 'profileString'),
              style: bottomBarItemStyle,
            ),
          ),
        ],
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? HomeMain(initialIndex: 0,)
            : (currentIndex == 1)
                ? Wallet()
                : Profile(),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)
            .translate('homePage', 'pressBackOnceAgainString'),
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
