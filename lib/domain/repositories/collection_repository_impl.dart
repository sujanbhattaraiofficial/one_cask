import 'package:one_cask/core/errors/exceptions.dart';
import 'package:one_cask/core/utils/network_utils.dart';
import 'package:one_cask/data/datasources/local/collection_local_datasource.dart';
import 'package:one_cask/data/datasources/remote/collection_remote_datasource.dart';
import 'package:one_cask/domain/entities/collection_item.dart';
import 'package:one_cask/domain/repositories/collection_repository.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionRemoteDataSource remoteDataSource;
  final CollectionLocalDataSource localDataSource;
  final NetworkUtils networkUtils;

  CollectionRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkUtils,
  });

  @override
  Future<List<CollectionItem>> getCollectionItems() async {
    final isInternetWorking = await networkUtils.isInternetWorking();

    if (isInternetWorking) {
      try {
        // Fetch data from remote data source
        final remoteItems = await remoteDataSource.getCollection();
        // Cache the fetched data locally
        await localDataSource.cacheCollection(remoteItems);
        return remoteItems;
      } on ServerException catch (e) {
        // If remote fetch fails, try to get cached data
        try {
          final localItems = await localDataSource.getCachedCollection();
          return localItems;
        } on CacheException {
          throw ServerException(
              message: 'Failed to fetch remote data: ${e.message}');
        }
      }
    } else {
      try {
        // Fetch data from local data source
        return await localDataSource.getCachedCollection();
      } on CacheException catch (e) {
        throw CacheException(
            message: 'Failed to fetch local data: ${e.message}');
      }
    }
  }

  @override
  Future<void> refreshCollection() async {
    final isInternetWorking = await networkUtils.isInternetWorking();

    if (isInternetWorking) {
      try {
        // Fetch data from remote data source
        final remoteItems = await remoteDataSource.getCollection();
        // Cache the fetched data locally
        await localDataSource.cacheCollection(remoteItems);
      } on ServerException catch (e) {
        throw ServerException(message: 'Failed to refresh data: ${e.message}');
      }
    } else {
      throw CacheException(message: 'No internet connection');
    }
  }
}
