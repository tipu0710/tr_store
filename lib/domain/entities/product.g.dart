// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      url: json['url'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      image: json['image'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'url': instance.url,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'thumbnail': instance.thumbnail,
    };
