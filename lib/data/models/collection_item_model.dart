// data/models/collection_item_model.dart
import 'package:hive/hive.dart';
import 'package:one_cask/domain/entities/collection_item.dart';
part 'collection_item_model.g.dart'; // Add this line

@HiveType(typeId: 0)
class CollectionItemModel extends HiveObject implements CollectionItem {
  @HiveField(0)
  @override
  final String id;

  @HiveField(1)
  @override
  final String brand;

  @HiveField(2)
  @override
  final int year;

  @HiveField(3)
  @override
  final String bottleNumber;

  @HiveField(4)
  @override
  final int owned;

  @HiveField(5)
  @override
  final int total;

  @HiveField(6)
  @override
  final String imagePath;

  CollectionItemModel({
    required this.id,
    required this.brand,
    required this.year,
    required this.bottleNumber,
    required this.owned,
    required this.total,
    required this.imagePath,
  });

  factory CollectionItemModel.fromEntity(CollectionItem entity) {
    return CollectionItemModel(
      id: entity.id,
      brand: entity.brand,
      year: entity.year,
      bottleNumber: entity.bottleNumber,
      owned: entity.owned,
      total: entity.total,
      imagePath: entity.imagePath,
    );
  }

  factory CollectionItemModel.fromJson(Map<String, dynamic> json) {
    return CollectionItemModel(
      id: json['id'],
      brand: json['brand'],
      year: json['year'],
      bottleNumber: json['bottle_number'].toString(),
      owned: json['owned'],
      total: json['total'],
      imagePath: json['image_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'year': year,
      'bottle_number': bottleNumber,
      'owned': owned,
      'total': total,
      'image_path': imagePath,
    };
  }
}
