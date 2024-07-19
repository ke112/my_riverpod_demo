import 'package:json_annotation/json_annotation.dart';

part 'product_info.g.dart';

@JsonSerializable()
class ProductInfo {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "sku")
  String? sku;
  @JsonKey(name: "price")
  String? price;

  //业务逻辑
  @JsonKey(name: 'isBrowsered', defaultValue: false)
  bool isBrowsered;

  ProductInfo(this.id, this.name, this.description, this.sku, this.price,
      this.isBrowsered);

  factory ProductInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInfoToJson(this);

  //业务逻辑
  setUserBrowsered(bool browsered) {
    isBrowsered = browsered;
  }

  bool isUserBrowser() {
    return isBrowsered;
  }
}
