// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as int,
      slug: json['slug'] as String,
      url: json['url'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String,
      thumbnail: json['thumbnail'] as String,
      userId: json['userId'] as int,
      primaryId: json['primaryId'] as int?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'primaryId': instance.primaryId,
      'slug': instance.slug,
      'url': instance.url,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'thumbnail': instance.thumbnail,
      'userId': instance.userId,
    };
