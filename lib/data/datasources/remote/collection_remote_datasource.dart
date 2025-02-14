// data/datasources/remote/collection_remote_datasource.dart
import 'package:one_cask/core/constants/assets_path.dart';
import 'package:one_cask/core/errors/exceptions.dart';
import 'package:one_cask/data/models/collection_item_model.dart';

abstract class CollectionRemoteDataSource {
  Future<List<CollectionItemModel>> getCollection();
}

class CollectionRemoteDataSourceImpl implements CollectionRemoteDataSource {
  @override
  Future<List<CollectionItemModel>> getCollection() async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock data - replace with actual API call
    try {
      return [
        CollectionItemModel(
            id: "1",
            brand: "Springbank",
            year: 1992,
            bottleNumber: "1234",
            owned: 112,
            total: 158,
            imagePath: AssetsPath.bottle),
        CollectionItemModel(
            id: "2",
            brand: "Macallan",
            year: 1985,
            bottleNumber: "5678",
            owned: 89,
            total: 120,
            imagePath: AssetsPath.bottle),
        CollectionItemModel(
            id: "3",
            brand: "Glenfiddich",
            year: 2001,
            bottleNumber: "9101",
            owned: 76,
            total: 100,
            imagePath: AssetsPath.bottle),
        CollectionItemModel(
            id: "4",
            brand: "Ardbeg",
            year: 1999,
            bottleNumber: "1122",
            owned: 45,
            total: 80,
            imagePath: AssetsPath.bottle),
        CollectionItemModel(
            id: "5",
            brand: "Lagavulin",
            year: 1978,
            bottleNumber: "3344",
            owned: 55,
            total: 90,
            imagePath: AssetsPath.bottle),
        CollectionItemModel(
            id: "6",
            brand: "Laphroaig",
            year: 1982,
            bottleNumber: "5566",
            owned: 65,
            total: 110,
            imagePath: AssetsPath.bottle),
        CollectionItemModel(
            id: "7",
            brand: "Balvenie",
            year: 1995,
            bottleNumber: "7788",
            owned: 80,
            total: 130,
            imagePath: AssetsPath.bottle),
        CollectionItemModel(
            id: "8",
            brand: "Glenlivet",
            year: 2005,
            bottleNumber: "9900",
            owned: 72,
            total: 140,
            imagePath: AssetsPath.bottle),
        CollectionItemModel(
            id: "9",
            brand: "Highland Park",
            year: 1975,
            bottleNumber: "1111",
            owned: 50,
            total: 95,
            imagePath: AssetsPath.bottle),
        CollectionItemModel(
            id: "10",
            brand: "Dalmore",
            year: 1988,
            bottleNumber: "2222",
            owned: 98,
            total: 150,
            imagePath: AssetsPath.bottle),
      ];
    } catch (e) {
      throw ServerException(message: 'Failed to fetch collection: $e');
    }
  }
}
