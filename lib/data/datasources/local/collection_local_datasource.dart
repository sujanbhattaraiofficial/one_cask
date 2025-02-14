import 'package:one_cask/core/errors/exceptions.dart';
import 'package:hive/hive.dart';
import 'package:one_cask/data/models/collection_item_model.dart';

abstract class CollectionLocalDataSource {
  Future<List<CollectionItemModel>> getCachedCollection();
  Future<void> cacheCollection(List<CollectionItemModel> items);
}

class CollectionLocalDataSourceImpl implements CollectionLocalDataSource {
  static const String _boxName = 'collectionbox';

  // Reuse the opened box
  Box<List<CollectionItemModel>> get _box =>
      Hive.box<List<CollectionItemModel>>(_boxName);

  @override
  Future<List<CollectionItemModel>> getCachedCollection() async {
    try {
      final data = _box.get('collection') ?? [];
      return data.cast<CollectionItemModel>();
    } catch (e) {
      throw CacheException(message: 'Failed to load cached collection: $e');
    }
  }

  @override
  Future<void> cacheCollection(List<CollectionItemModel> items) async {
    try {
      await _box.put('collection', items);
    } catch (e) {
      print(e);
      throw CacheException(message: 'Failed to cache collection: $e');
    }
  }
}
