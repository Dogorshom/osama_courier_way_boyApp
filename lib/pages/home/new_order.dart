import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:courierway_deliveryboy/order/order.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';
import 'package:courierway_deliveryboy/pages/home/active_order.dart';
import 'package:courierway_deliveryboy/pages/home/home_main.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  /*final deliveryList = [
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
  ];*/

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Future getOrders() async {
      final result = await Connectivity().checkConnectivity();
      final hasInternet = result != ConnectivityResult.none;

      print("hi from orders");
      print(hasInternet.toString());
      if (hasInternet) {
        var url = "https://taweela-rest-api-strapi.herokuapp.com/orders";
        /*   Map<String, String> headers = {
          'Context-Type': 'application/json;Charset=UTF-8',
          'Accept': 'application/json',
        };*/
        http.Response receivedData = await http.get(Uri.parse(url));
        print(receivedData.body);
        var jsonData = jsonDecode(receivedData.body);
        List<Order> orders = [];
        for (var v in jsonData) {
          if(v["orderStatus"]=="justOrdered" || v["orderStatus"] ==null ){Order order = Order(
              id: v["_id"],
              title: v["title"],
              description: v["description"],
              height: v["height"],
              width: v["screenWidth"],
              depth: v["depth"],
              weight: v["weight"],
              pickUpLocation: v["pickUpLocation"],
              dropOffLocation: v["dropOffLocation"],
              comment: v["comment"],
              priceWithoutDelivery:v["totalPriceWithoutDelivery"] ,
              deliveryPrice: v["deliveryPrice"] ,
              nameOfOrderUser: v["nameOfOrderUser"]??"null",
              phoneNumberOfOrderUser: v["phoneNumberOfOrderUser"]??"null"

          );
          orders.add(order);}
        }
        return orders;
      } else {
        myErrorDialog(context, "you don't have Internet Access, please connect and refresh your page");
        print("you don't have Internet Access");
      }
    }

/*
    Future rejectReasonDialog() {
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
                      screenWidth: screenWidth,
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
                      screenWidth: screenWidth,
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
                            screenWidth: (screenWidth / 3.5),
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
                            screenWidth: (screenWidth / 3.5),
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
      return null;
    }
*/
    Future confirmOrderAndUpdateItAsActive(String orderID) async {
      final result = await Connectivity().checkConnectivity();
      final hasInternet = result != ConnectivityResult.none;

      if (hasInternet) {
        var url =
            "https://taweela-rest-api-strapi.herokuapp.com/orders/${orderID.toString()}";
        Map<String, String> headers = {
          'Context-Type': 'application/json;Charset=UTF-8',
          'Accept': 'application/json',
        };
        Map<String, String> body = {
          'orderStatus':'active'
        };
        http.Response jsonData =
            await http.put(Uri.parse(url), headers: headers,body: body);
        Map receivedData = jsonDecode(jsonData.body);
        print(receivedData);
        return true;
      }
    }

    isOrderAcceptedDialog(Order order,) {
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
                  width: screenWidth,
                  height: screenHeight / 1.2,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        padding: EdgeInsets.all(fixPadding),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: Container(
                          width: screenWidth,
                          child: Center(
                            child: Text(
                              'ID: ${order.id}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: wbuttonWhiteTextStyle,
                            ),
                          ),
                        ),
                      ),

                      // Order Start
                      Container(
                        margin: EdgeInsets.all(fixPadding),
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
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
                                        'products',
                                        style: listItemTitleStyle,
                                      ),
                                      Text(
                                        '\$${order.priceWithoutDelivery}',
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
                                        'Tax',
                                        style: listItemTitleStyle,
                                      ),
                                      Text(
                                        '\$0.0',
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
                                        '\$${order.deliveryPrice}',
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
                                        '\$${order.priceWithoutDelivery + order.deliveryPrice}',
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
                          color: greyColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
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
                                            ((screenWidth - fixPadding * 13) /
                                                2.0),
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
                                            ((screenWidth - fixPadding * 13) /
                                                2.0),
                                        child: Text(
                                          '${order.pickUpLocation}',
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
                                            ((screenWidth - fixPadding * 13) /
                                                2.0),
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
                                            ((screenWidth - fixPadding * 13) /
                                                2.0),
                                        child: Text(
                                          '${order.dropOffLocation}',
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
                          color: greyColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
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
                                        '${order.nameOfOrderUser}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                        '${order.phoneNumberOfOrderUser}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                          color: greyColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
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
                            onTap: () async {
                              Navigator.pop(context);
                              // await rejectReasonDialog();
                            },
                            child: Container(
                              width: (screenWidth / 3.5),
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
                            onTap: () async {
                              bool confirmOrder =
                                  await confirmOrderAndUpdateItAsActive(order.id) ??
                                      false;
                              if (confirmOrder) {
                                print("order successfully confirmed");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeMain(
                                            initialIndex: 1, order: order)));
                              } else {
                                myErrorDialog(context,
                                    "order canceled or has been selected\n by another driver ");
                              }
                              //Navigator.pop(context);
                              //return true;
                            },
                            child: Container(
                              width: (screenWidth / 3.5),
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
      return false;
    }

    return FutureBuilder(
        future: getOrders(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return (snapshot.data == null)
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "no Items founded press this button to refresh your page",
                          style: headingStyle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: fixPadding * 4,
                        ),
                        getElevatedButton(context, "HomeMain", "Refresh Page"),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: snapshot.data.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Order order = snapshot.data[index];
                    // final item = deliveryList[index];
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
                             /* boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],*/
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(fixPadding),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(Icons.fastfood,
                                                color: primaryColor,
                                                size: 25.0),
                                            widthSpace,
                                            Container(
                                              width: (screenWidth -
                                                      fixPadding * 4.0) /
                                                  1.8,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(order.id,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: headingStyle),
                                                  heightSpace,
                                                  heightSpace,
                                                  Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate(
                                                              'newOrderPage',
                                                              'orderTitle'),
                                                      style: lightGreyStyle),
                                                  Text("${order.title}",
                                                      style: headingStyle),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            (screenWidth - fixPadding * 4.0) /
                                                3.2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: SizedBox(
                                                height: 40.0,
                                                width: 100.0,
                                                child: RaisedButton(
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  onPressed: () async {
                                                    bool isOrderAccepted =
                                                        isOrderAcceptedDialog(
                                                            order);
                                                    if (isOrderAccepted) {
                                                      print(
                                                          "order is Accepted");
                                                    }
                                                  },
                                                  color: primaryColor,
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                            'newOrderPage',
                                                            'acceptString'),
                                                    style:
                                                        wbuttonWhiteTextStyle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            heightSpace,
                                            Text(
                                                AppLocalizations.of(context)
                                                    .translate('newOrderPage',
                                                        'totalPrice'),
                                                style: lightGreyStyle),
                                            Text('${order.priceWithoutDelivery + order.deliveryPrice}', style: headingStyle),
                                          ],
                                        ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            (screenWidth - fixPadding * 4.0) /
                                                3.2,
                                        child: Text(
                                          '${order.pickUpLocation}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: buttonBlackTextStyle,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                        width:
                                            (screenWidth - fixPadding * 4.0) /
                                                3.2,
                                        child: Text(
                                          '${order.dropOffLocation}',
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
        });
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
