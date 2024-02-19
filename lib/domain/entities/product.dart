import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final int? primaryId;
  final String slug;
  final String url;
  final String title;
  final String content;
  final String image;
  final String thumbnail;
  final int userId;

  const ProductEntity({
    required this.id,
    required this.slug,
    required this.url,
    required this.title,
    required this.content,
    required this.image,
    required this.thumbnail,
    required this.userId,
    this.primaryId,
  });

  @override
  List<Object?> get props => [
        id,
        slug,
        url,
        title,
        content,
        image,
        thumbnail,
        userId,
      ];
}
