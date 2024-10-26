class OrderModel {
  OrderModel({
    this.id,
    this.orderId,
    this.price,
    this.name,
    this.nameAr,
    this.nameFr,
    this.desc,
    this.descAr,
    this.descFr,
    this.count,
    this.discount,
    this.hidden,
    this.image,
    this.date,
    required this.orderCount,
  });
  String? id;
  int? orderId;
  double? price;
  String? name;
  String? nameAr;
  String? nameFr;
  String? desc;
  String? descAr;
  String? descFr;
  int? count;
  double? discount;
  bool? hidden;
  String? image;
  String? date;
  late int orderCount;

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['item_id'].toString();
    price = json['item_price'];
    name = json['item_name'];
    nameAr = json['item_name_ar'];
    nameFr = json['item_name_fr'];
    desc = json['item_desc'];
    descAr = json['item_desc_ar'];
    descFr = json['item_desc_fr'];
    count = json['item_count'];
    discount = double.parse(json['item_discount'].toString());
    hidden = json['item_hidden'] == 1 ? true : false;
    image = json['item_image'];
    date = json['item_date'];
    orderCount = json['order_count'];
    orderId = json['order_id'];
  }
}