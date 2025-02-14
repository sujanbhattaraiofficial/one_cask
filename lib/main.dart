// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:one_cask/core/constants/route_names.dart';
import 'package:one_cask/core/route/route_config.dart';
import 'package:one_cask/core/themes/app_theme.dart';
import 'package:one_cask/core/utils/network_utils.dart';
import 'package:one_cask/data/datasources/local/collection_local_datasource.dart';
import 'package:one_cask/data/datasources/remote/collection_remote_datasource.dart';
import 'package:one_cask/data/models/collection_item_model.dart';
import 'package:one_cask/domain/repositories/collection_repository.dart';
import 'package:one_cask/domain/repositories/collection_repository_impl.dart';

// // Dependency injection setup
// import 'di.dart' as di;

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(CollectionItemModelAdapter()); // Add this line

  // Close all open boxes first (to avoid duplicates)
  if (Hive.isBoxOpen('collectionbox')) {
    await Hive.box('collectionbox').close();
  }

  // Open the box safely
  await Hive.openBox<List<CollectionItemModel>>('collectionbox');

  // // Initialize dependency injection
  // await di.configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CollectionRepository>(
          create: (context) => CollectionRepositoryImpl(
            networkUtils: NetworkUtils(),
            remoteDataSource: CollectionRemoteDataSourceImpl(),
            localDataSource: CollectionLocalDataSourceImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'One Cask',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,

        // Routing configuration
        initialRoute: RouteNames.splash,
        onGenerateRoute: RouteGenerator.generateRoute,
        routes: RouteGenerator.routes,

        // Optional: Basic error handling
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: child,
          );
        },
      ),
    );
  }
}
