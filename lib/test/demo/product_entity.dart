import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity {
  int? id;
  String? name;
  String? description;
  String? sku;
  String? price;

  ProductEntity(
    this.id,
    this.name,
    this.description,
    this.sku,
    this.price,
  );

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}
