class Order {
  String id;
  String title;
  String description;
  String height;
  String width;
  String depth;
  String weight;
  String pickUpLocation;
  String dropOffLocation;
  String comment;
  String nameOfOrderUser;
  int    priceWithoutDelivery;
  int    deliveryPrice;
  String phoneNumberOfOrderUser;

  Order(
      {
      this.id,
      this.title,
      this.description,
      this.height,
      this.width,
      this.depth,
      this.weight,
      this.pickUpLocation,
      this.dropOffLocation,
      this.comment,
      this.priceWithoutDelivery,
      this.deliveryPrice,
      this.nameOfOrderUser,
      this.phoneNumberOfOrderUser});
}
/*
class OrderUser{
  String name;
  String phoneNumber;
}*/
