import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';
import 'package:flutter/material.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
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
    double height = MediaQuery.of(context).size.height;
    rejectreasonDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Wrap(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: width,
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('newOrderPage', 'reasonToRejectString'),
                        style: wbuttonWhiteTextStyle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      child: Text(AppLocalizations.of(context).translate(
                          'newOrderPage', 'writeSpecificReasonString')),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.all(fixPadding),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context).translate(
                              'newOrderPage', 'enterReasonHereString'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          fillColor: Colors.grey.withOpacity(0.1),
                          filled: true,
                        ),
                      ),
                    ),
                    heightSpace,
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
                                  .translate('newOrderPage', 'cancelString'),
                              style: buttonBlackTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
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
                                  .translate('newOrderPage', 'sendString'),
                              style: wbuttonWhiteTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    heightSpace,
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    orderAcceptDialog(index) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Wrap(
              children: <Widget>[
                Container(
                  width: width,
                  height: height / 1.2,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        width: width,
                        padding: EdgeInsets.all(fixPadding),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'OID123456789',
                          style: wbuttonWhiteTextStyle,
                        ),
                      ),

                      // Order Start
                      Container(
                        margin: EdgeInsets.all(fixPadding),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    topLeft: Radius.circular(5.0),
                                  )),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('newOrderPage', 'orderString'),
                                style: buttonBlackTextStyle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(fixPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Deal 1',
                                        style: listItemTitleStyle,
                                      ),
                                      Text(
                                        '\$430',
                                        style: listItemTitleStyle,
                                      ),
                                    ],
                                  ),
                                  heightSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '7up Regular 250ml',
                                        style: listItemTitleStyle,
                                      ),
                                      Text(
                                        '\$80',
                                        style: listItemTitleStyle,
                                      ),
                                    ],
                                  ),
                                  heightSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Delivery Charges',
                                        style: listItemTitleStyle,
                                      ),
                                      Text(
                                        '\$10',
                                        style: listItemTitleStyle,
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        AppLocalizations.of(context).translate(
                                            'newOrderPage', 'totalString'),
                                        style: headingStyle,
                                      ),
                                      Text(
                                        '\$520',
                                        style: priceStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Order End
                      // Location Start
                      Container(
                        margin: EdgeInsets.all(fixPadding),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    topLeft: Radius.circular(5.0),
                                  )),
                              child: Text(
                                AppLocalizations.of(context).translate(
                                    'newOrderPage', 'locationString'),
                                style: buttonBlackTextStyle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(fixPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            ((width - fixPadding * 13) / 2.0),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .translate('newOrderPage',
                                                  'pickupLocationString'),
                                          style: listItemTitleStyle,
                                        ),
                                      ),
                                      widthSpace,
                                      Container(
                                        width:
                                            ((width - fixPadding * 13) / 2.0),
                                        child: Text(
                                          '28 Mott Stret',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: listItemTitleStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  heightSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            ((width - fixPadding * 13) / 2.0),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .translate('newOrderPage',
                                                  'deliveryLocationString'),
                                          style: listItemTitleStyle,
                                        ),
                                      ),
                                      widthSpace,
                                      Container(
                                        width:
                                            ((width - fixPadding * 13) / 2.0),
                                        child: Text(
                                          '56 Andheri East',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: listItemTitleStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Location End

                      // Customer Start
                      Container(
                        margin: EdgeInsets.all(fixPadding),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    topLeft: Radius.circular(5.0),
                                  )),
                              child: Text(
                                AppLocalizations.of(context).translate(
                                    'newOrderPage', 'customerString'),
                                style: buttonBlackTextStyle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(fixPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        AppLocalizations.of(context).translate(
                                            'newOrderPage', 'nameString'),
                                        style: listItemTitleStyle,
                                      ),
                                      Text(
                                        'Allison Perry',
                                        style: listItemTitleStyle,
                                      ),
                                    ],
                                  ),
                                  heightSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        AppLocalizations.of(context).translate(
                                            'newOrderPage', 'phoneString'),
                                        style: listItemTitleStyle,
                                      ),
                                      Text(
                                        '123456789',
                                        style: listItemTitleStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Customer End

                      // Payment Start
                      Container(
                        margin: EdgeInsets.all(fixPadding),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    topLeft: Radius.circular(5.0),
                                  )),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('newOrderPage', 'paymentString'),
                                style: buttonBlackTextStyle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(fixPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .translate('newOrderPage',
                                                  'paymentString'),
                                          style: listItemTitleStyle,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Pay on Delivery',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: listItemTitleStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Payment End
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                deliveryList.removeAt(index);
                              });
                              Navigator.pop(context);
                              rejectreasonDialog();
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
                                    .translate('newOrderPage', 'rejectString'),
                                style: buttonBlackTextStyle,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                deliveryList.removeAt(index);
                              });
                              Navigator.pop(context);
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
                                    .translate('newOrderPage', 'acceptString'),
                                style: wbuttonWhiteTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return (deliveryList.length == 0)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.local_mall,
                  color: Colors.grey,
                  size: 60.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  AppLocalizations.of(context)
                      .translate('newOrderPage', 'noNewOrdersString'),
                  style: greyHeadingStyle,
                ),
              ],
            ),
          )
        : ListView.builder(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(item['orderId'],
                                            style: headingStyle),
                                        heightSpace,
                                        heightSpace,
                                        Text(
                                            AppLocalizations.of(context)
                                                .translate('newOrderPage',
                                                    'paymentModeString'),
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
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          onPressed: () {
                                            orderAcceptDialog(index);
                                          },
                                          color: primaryColor,
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .translate('newOrderPage',
                                                    'acceptString'),
                                            style: wbuttonWhiteTextStyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    heightSpace,
                                    Text(
                                        AppLocalizations.of(context).translate(
                                            'newOrderPage', 'paymentString'),
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