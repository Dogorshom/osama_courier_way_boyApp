import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';
import 'package:courierway_deliveryboy/order/order.dart';
import 'package:courierway_deliveryboy/pages/home.dart';
import 'package:courierway_deliveryboy/pages/home/home_main.dart';
import 'package:flutter/material.dart';
import 'package:courierway_deliveryboy/pages/map.dart';

class ActiveOrder extends StatefulWidget {
  final Order order;

  ActiveOrder(
      {this.order});

  @override
  _ActiveOrderState createState() => _ActiveOrderState();
}

class _ActiveOrderState extends State<ActiveOrder> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return widget.order==null? Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("you didn't have active orders press this button to view orders",style: headingStyle,textAlign: TextAlign.center,),
            SizedBox(height: fixPadding*4,),
            Container(
              child:getElevatedButton(context, "Home", "View Orders")
            ),
          ],
        ),
      )):
    Scaffold(
      body: Container(
        width: width,
        height: height,
        child: ListView(
          children: <Widget>[
            Container(
              width: width,
              padding: EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                // borderRadius: BorderRadius.only(
                //   topRight: Radius.circular(10.0),
                //   topLeft: Radius.circular(10.0),
                // ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('username: ',style: wbuttonWhiteTextStyle,),
                      Text(widget.order.nameOfOrderUser ?? "user prefer not to say his name",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: wbuttonWhiteTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text('ID: ',style: wbuttonWhiteTextStyle,),
                      Text(widget.order.id??'OID123456789',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: wbuttonWhiteTextStyle,
                      ),
                    ],
                  ),

                ],
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
                          .translate('activeOrderPage', 'orderString'),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'subTotal',
                              style: listItemTitleStyle,
                            ),
                            Text(
                              '\$${widget.order.priceWithoutDelivery}',
                              style: listItemTitleStyle,
                            ),
                          ],
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Tax',
                              style: listItemTitleStyle,
                            ),
                            Text(
                              '\$0',
                              style: listItemTitleStyle,
                            ),
                          ],
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Delivery Charges',
                              style: listItemTitleStyle,
                            ),
                            Text(
                              '\$${widget.order.deliveryPrice}',
                              style: listItemTitleStyle,
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('activeOrderPage', 'totalString'),
                              style: headingStyle,
                            ),
                            Text(
                              '\$${widget.order.priceWithoutDelivery + widget.order.deliveryPrice}',
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
                      AppLocalizations.of(context)
                          .translate('activeOrderPage', 'locationString'),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: ((width - fixPadding * 13) / 2.0),
                              child: Text(
                                AppLocalizations.of(context).translate(
                                    'activeOrderPage', 'pickupLocationString'),
                                style: listItemTitleStyle,
                              ),
                            ),
                            widthSpace,
                            Container(
                              width: ((width - fixPadding * 13) / 2.0),
                              child: Text(
                                '${widget.order.pickUpLocation}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: listItemTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: ((width - fixPadding * 13) / 2.0),
                              child: Text(
                                AppLocalizations.of(context).translate(
                                    'activeOrderPage',
                                    'deliveryLocationString'),
                                style: listItemTitleStyle,
                              ),
                            ),
                            widthSpace,
                            Container(
                              width: ((width - fixPadding * 13) / 2.0),
                              child: Text(
                                '${widget.order.dropOffLocation}',
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
                      AppLocalizations.of(context)
                          .translate('activeOrderPage', 'customerString'),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('activeOrderPage', 'nameString'),
                              style: listItemTitleStyle,
                            ),
                            Text(
                              '${widget.order.nameOfOrderUser}',
                              style: listItemTitleStyle,
                            ),
                          ],
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('activeOrderPage', 'phoneString'),
                              style: listItemTitleStyle,
                            ),
                            Text(
                              '${widget.order.phoneNumberOfOrderUser}',
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
                          .translate('activeOrderPage', 'paymentString'),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                AppLocalizations.of(context).translate(
                                    'activeOrderPage', 'paymentString'),
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
          /*  InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Map()));
              },
              child: Container(
                width: width,
                alignment: Alignment.center,
                margin: EdgeInsets.all(fixPadding),
                padding: EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  AppLocalizations.of(context)
                      .translate('activeOrderPage', 'startString'),
                  style: wbuttonWhiteTextStyle,
                ),
              ),
            ),*/
            heightSpace,
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Map()));
          print("order started");
        },
        child: Container(
          color: primaryColor,
          height: 45,
          child: Center(
            child: Text(
                AppLocalizations.of(context)
                    .translate('activeOrderPage', 'startString'),
                style: wbuttonWhiteTextStyle
            ),
          ),
        ),
      ),
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
