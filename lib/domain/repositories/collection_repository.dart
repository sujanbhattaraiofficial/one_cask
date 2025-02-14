// domain/repositories/collection_repository.dart
import 'package:one_cask/domain/entities/collection_item.dart';

abstract class CollectionRepository {
  Future<List<CollectionItem>> getCollectionItems();
  Future<void> refreshCollection();
}
