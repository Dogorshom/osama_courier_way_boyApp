import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final deliveryList = [
    {
      'orderId': 'OID123456789',
      'paymentMode': 'Cash on Delivery',
      'payment': '8.50',
      'restaurantAddress': '28 Mott Stret',
      'deliveryAddress': '56 Andheri East'
    },
    {
      'orderId': 'OID123789654',
      'paymentMode': 'Payed',
      'payment': '12.50',
      'restaurantAddress': '91 Opera Street',
      'deliveryAddress': '231 Abc Circle'
    },
    {
      'orderId': 'OID957546521',
      'paymentMode': 'Payed',
      'payment': '15.00',
      'restaurantAddress': '28 Mott Stret',
      'deliveryAddress': '91 Yogi Circle'
    },
    {
      'orderId': 'OID652347952',
      'paymentMode': 'Cash on Delivery',
      'payment': '7.90',
      'restaurantAddress': '28 Mott Stret',
      'deliveryAddress': '54 Xyz Residency'
    },
    {
      'orderId': 'OID658246972',
      'paymentMode': 'Cash on Delivery',
      'payment': '19.50',
      'restaurantAddress': '29 Bar Street',
      'deliveryAddress': '56 Andheri East'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: deliveryList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = deliveryList[index];
        return Container(
          padding: EdgeInsets.all(fixPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.fastfood,
                                  color: primaryColor, size: 25.0),
                              widthSpace,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(item['orderId'], style: headingStyle),
                                  heightSpace,
                                  heightSpace,
                                  Text(
                                      AppLocalizations.of(context).translate(
                                          'historyPage', 'paymentModeString'),
                                      style: lightGreyStyle),
                                  Text(item['paymentMode'],
                                      style: headingStyle),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: SizedBox(
                                  height: 40.0,
                                  width: 100.0,
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    onPressed: () {},
                                    color: primaryColor,
                                    child: Text(
                                      AppLocalizations.of(context).translate(
                                          'historyPage', 'deliveredString'),
                                      style: wbuttonWhiteTextStyle,
                                    ),
                                  ),
                                ),
                              ),
                              heightSpace,
                              Text(
                                  AppLocalizations.of(context).translate(
                                      'historyPage', 'paymentString'),
                                  style: lightGreyStyle),
                              Text('\$ ${item['payment']}',
                                  style: headingStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(fixPadding),
                      decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: (width - fixPadding * 4.0) / 3.2,
                            child: Text(
                              item['restaurantAddress'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: buttonBlackTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: primaryColor,
                                size: 20.0,
                              ),
                              getDot(),
                              getDot(),
                              getDot(),
                              getDot(),
                              getDot(),
                              Icon(
                                Icons.navigation,
                                color: primaryColor,
                                size: 20.0,
                              ),
                            ],
                          ),
                          Container(
                            width: (width - fixPadding * 4.0) / 3.2,
                            child: Text(
                              item['deliveryAddress'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: buttonBlackTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  getDot() {
    return Container(
      margin: EdgeInsets.only(left: 2.0, right: 2.0),
      width: 4.0,
      height: 4.0,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(2.0),
      ),
    );
  }
}
