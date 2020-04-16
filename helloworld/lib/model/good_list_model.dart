class GoodListModel {
  int code;
  String message;
  List<GoodModel> data;

  GoodListModel(this.data);

  GoodListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<GoodModel>();
      json['data'].forEach((v) {
        data.add(GoodModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class GoodModel {
  String image;
  double oriPrice;
  double presentPrice;
  String name;
  int goodsId;

  GoodModel(
      this.image, this.oriPrice, this.presentPrice, this.name, this.goodsId);

  GoodModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = double.parse(json['oriPrice'].toString());
    presentPrice = double.parse(json['presentPrice'].toString());
    name = json['name'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['name'] = this.name;
    data['goodsId'] = this.goodsId;
    return data;
  }
}
