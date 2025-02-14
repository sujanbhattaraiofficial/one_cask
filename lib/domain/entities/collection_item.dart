// domain/entities/collection_item.dart
abstract class CollectionItem {
  String get id;
  String get brand;
  int get year;
  String get bottleNumber;
  int get owned;
  int get total;
  String get imagePath;
}
