import 'package:json_annotation/json_annotation.dart';
import 'package:tr_store/domain/entities/product.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.slug,
    required super.url,
    required super.title,
    required super.content,
    required super.image,
    required super.thumbnail,
    required super.userId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity() => ProductEntity(
        id: id,
        slug: slug,
        url: url,
        title: title,
        content: content,
        image: image,
        thumbnail: thumbnail,
        userId: userId,
      );
}
