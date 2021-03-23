import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:courierway_deliveryboy/invite_friend/invite_friend.dart';
import 'package:courierway_deliveryboy/pages/login_signup/login.dart';
import 'package:courierway_deliveryboy/pages/profile/change_language.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:courierway_deliveryboy/pages/profile/edit_profile.dart';
import 'package:courierway_deliveryboy/pages/notification.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    logoutDialogue() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Wrap(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)
                            .translate('profilePage', 'sureLogoutString'),
                        style: blackHeadingTextStyle,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: (width / 3.5),
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('profilePage', 'cancelString'),
                                style: blackBottonTextStyle,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Container(
                              width: (width / 3.5),
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('profilePage', 'logoutString'),
                                style: whiteBottonTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      // backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: myFirstColor,
        elevation: 0.0,
        title: Text(
          AppLocalizations.of(context)
              .translate('profilePage', 'profileString'),
          style: blackExtraLargeTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/corner_logo.png"),
            fit: BoxFit.cover,
            // image: Image.asset("name")
          ),
          // color: Colors.orange,
          gradient: LinearGradient(colors: [
            mySecondColor,
            myFirstColor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: ListView(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: EditProfile()));
              },
              child: Container(
                width: width,
                padding: EdgeInsets.all(fixPadding),
                // color: whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            // image: DecorationImage(
                            //   image: AssetImage('assets/user.jpg'),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          child: Icon(
                            Icons.person_outline,size: 50,
                          ),
                        ),
                        widthSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Ahmed Khalid',
                              style: blackHeadingTextStyle,
                            ),
                            heightSpace,
                            Text(
                              '123456789',
                              style: lightGreySmallTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: Divider(
                color: Colors.white,
              ),
            ),
            Container(
              // margin: EdgeInsets.all(width*0.1),
              padding: EdgeInsets.all(width*0.05),
              // decoration: BoxDecoration(
              //   color: whiteColor,
              //   borderRadius: BorderRadius.circular(5.0),
              //   boxShadow: <BoxShadow>[
              //     BoxShadow(
              //       blurRadius: 1.5,
              //       spreadRadius: 1.5,
              //       color: Colors.grey[200],
              //     ),
              //   ],
              // ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Notifications()));
                    },
                    child:  Padding(
                      padding: EdgeInsets.symmetric(vertical:fixPadding-5),
                      child: getTile(
                          Icon(Icons.notifications,
                              color: Colors.white70),
                          AppLocalizations.of(context)
                              .translate('profilePage', 'notificationsString'),width),
                    ),),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: ChangeLanguage()));
                    },
                    child:Padding(
                      padding: EdgeInsets.symmetric(vertical:fixPadding-5),
                      child:getTile(
                          Icon(Icons.language,
                              color:Colors.white70),
                          AppLocalizations.of(context)
                              .translate('profilePage', 'languageString'),width),
                    ),),
                  InkWell(
                    onTap: () {},
                    child:Padding(
                      padding: EdgeInsets.symmetric(vertical:fixPadding-5),
                      child: getTile(
                          Icon(Icons.settings,
                              color: Colors.white70),
                          AppLocalizations.of(context)
                              .translate('profilePage', 'settingsString'),width),
                    ),),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: InviteFriend()));
                    },
                    child:Padding(
                      padding: EdgeInsets.symmetric(vertical:fixPadding-5),
                      child: getTile(
                          Icon(Icons.group_add,
                              color: Colors.white70),
                          AppLocalizations.of(context)
                              .translate('profilePage', 'inviteFriendsString'),width),
                    ),),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical:fixPadding-5),
                      child:getTile(
                          Icon(Icons.headset_mic,
                              color: Colors.white70),
                          AppLocalizations.of(context)
                              .translate('profilePage', 'supportString'),width),
                    ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Divider(
                color: Colors.white54,
              ),
            ),
            Container(
              // margin: EdgeInsets.all(fixPadding),
              padding: EdgeInsets.all(width*0.05),
              decoration: BoxDecoration(
                // color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
                // boxShadow: <BoxShadow>[
                //   BoxShadow(
                //     blurRadius: 1.5,
                //     spreadRadius: 1.5,
                //     color: Colors.grey[200],
                //   ),
                // ],
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: logoutDialogue,
                    child: getTile(
                        Icon(Icons.exit_to_app,
                            color: Colors.white70),
                        'Logout',width),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTile(Icon icon, String title,double width) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.black,

                //  color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            width: width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: 40.0,
                  alignment: Alignment.center,
                  child: icon,
                ),
                widthSpace,
                Text(
                  title,
                  style: whiteColorTextStyle,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            height: 40.0,
            width: width*0.35,
            // color: Colors.white54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: myFirstColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
