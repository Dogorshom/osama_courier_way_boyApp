import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final earningList = [
    {'type': 'Food Delivered', 'earning': '3.50'},
    {'type': 'Food Delivered', 'earning': '5.70'},
    {'type': 'Food Delivered', 'earning': '3.90'},
    {'type': 'Food Delivered', 'earning': '8.75'},
    {'type': 'Food Delivered', 'earning': '9.0'},
    {'type': 'Food Delivered', 'earning': '7.30'},
    {'type': 'Food Delivered', 'earning': '5.10'},
    {'type': 'Food Delivered', 'earning': '7.50'},
    {'type': 'Food Delivered', 'earning': '8.50'},
    {'type': 'Food Delivered', 'earning': '10.0'}
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Container(
          height: height,
          child: Column(
            children: [
              Container(
                height: 170.0,
                width: double.infinity,
                color: primaryColor,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)
                          .translate('walletPage', 'earningString'),
                      style: bigWhiteHeadingStyle,
                    ),
                    heightSpace,
                    Text(
                      '\$190.8',
                      style: whiteHeadingStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: width,
                  height: height,
                  color: primaryColor,
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                      color: scaffoldBgColor,
                    ),
                    child: ListView.builder(
                      itemCount: earningList.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = earningList[index];
                        return Container(
                          padding: (index == 0)
                              ? EdgeInsets.only(
                                  right: fixPadding,
                                  left: fixPadding,
                                  bottom: fixPadding,
                                  top: fixPadding)
                              : EdgeInsets.only(
                                  right: fixPadding,
                                  left: fixPadding,
                                  bottom: fixPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(fixPadding),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 1.5,
                                      spreadRadius: 1.5,
                                      color: Colors.grey[200],
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.fastfood,
                                          size: 25.0,
                                          color: primaryColor,
                                        ),
                                        widthSpace,
                                        Text(item['type'], style: headingStyle),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(item['earning'],
                                            style: greyHeadingStyle),
                                        SizedBox(height: 5.0),
                                        Text(
                                            AppLocalizations.of(context)
                                                .translate('walletPage',
                                                    'earningString'),
                                            style: appbarHeadingStyle),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
