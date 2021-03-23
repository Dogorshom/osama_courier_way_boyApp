import 'package:courierway_deliveryboy/functions/change_language.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:courierway_deliveryboy/constant/constant.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool progress = false;

    var appLanguage = Provider.of<AppLanguage>(context);

    Locale myLocale = Localizations.localeOf(context);

    changeLanguage(String language) {
      setState(() {
        progress = true;
      });
      if (language == 'english') {
        appLanguage.changeLanguage(Locale("en"));
        setState(() {
          progress = false;
          myLocale = Locale("en");
        });
      }

      if (language == 'hindi') {
        appLanguage.changeLanguage(Locale("hi"));
        setState(() {
          progress = false;
          myLocale = Locale("hi");
        });
      }

      if (language == 'arabic') {
        appLanguage.changeLanguage(Locale("ar"));
        setState(() {
          progress = false;
          myLocale = Locale("ar");
        });
      }

      if (language == 'chinese') {
        appLanguage.changeLanguage(Locale("zh"));
        setState(() {
          progress = false;
          myLocale = Locale("zh");
        });
      }
    }

    _nothingHappen() {}

    // Change Language AlertDialog Start Here
    changeLanguageDialogue(String languageToChange) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              // padding: EdgeInsets.all(20.0),
              child: Wrap(
                children: <Widget>[
                  Container(
                    width: width,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0)),
                      image: DecorationImage(
                        image: AssetImage('assets/earth.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          AppLocalizations.of(context).translate(
                              'changeLanguagePage', 'sureDialogueString'),
                          textAlign: TextAlign.center,
                          style: headingStyle,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Row(
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
                                  AppLocalizations.of(context).translate(
                                      'changeLanguagePage', 'closeString'),
                                  style: buttonBlackTextStyle,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                changeLanguage(languageToChange);
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
                                  AppLocalizations.of(context).translate(
                                      'changeLanguagePage', 'yesString'),
                                  style: wbuttonWhiteTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
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

    // Change Language AlertDialog Ends Here
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        titleSpacing: 0.0,
        title: Text(
            AppLocalizations.of(context)
                .translate('changeLanguagePage', 'changeLanguageAppBarTitle'),
            style: bigHeadingStyle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: (progress)
          ? Center(
              child: SpinKitRipple(color: Colors.red),
            )
          : ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context)
                            .translate('changeLanguagePage', 'selectLanguage'),
                        style: headingStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          (myLocale.languageCode == 'en')
                              ? _nothingHappen()
                              : changeLanguageDialogue('english');
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: (width - 20.0),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/country_flag/english.png',
                                height: 40.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                  AppLocalizations.of(context).translate(
                                      'changeLanguagePage', 'englishString'),
                                  style: listItemTitleStyle),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          (myLocale.languageCode == 'hi')
                              ? _nothingHappen()
                              : changeLanguageDialogue('hindi');
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: (width - 20.0),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/country_flag/hindi.png',
                                height: 40.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                  AppLocalizations.of(context).translate(
                                      'changeLanguagePage', 'hindiString'),
                                  style: listItemTitleStyle),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          (myLocale.languageCode == 'ar')
                              ? _nothingHappen()
                              : changeLanguageDialogue('arabic');
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: (width - 20.0),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/country_flag/arabic.png',
                                height: 40.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                  AppLocalizations.of(context).translate(
                                      'changeLanguagePage', 'arabicString'),
                                  style: listItemTitleStyle),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          (myLocale.languageCode == 'zh')
                              ? _nothingHappen()
                              : changeLanguageDialogue('chinese');
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: (width - 20.0),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/country_flag/chinese.png',
                                height: 40.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                  AppLocalizations.of(context).translate(
                                      'changeLanguagePage', 'chineseString'),
                                  style: listItemTitleStyle),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
