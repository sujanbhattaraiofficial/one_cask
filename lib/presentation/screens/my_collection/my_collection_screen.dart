import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/domain/entities/collection_item.dart';
import 'package:one_cask/presentation/blocs/collection_bloc/collection_bloc.dart';
import 'package:one_cask/presentation/blocs/collection_bloc/collection_event.dart';
import 'package:one_cask/presentation/blocs/collection_bloc/collection_state.dart';
import 'package:one_cask/presentation/screens/bottle_details/bottle_details_screen.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionBloc(
        repository: context.read(),
      )..add(CollectionLoaded()),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
        // floatingActionButton: _buildRefreshButton(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('My Collection'),
      actions: [
        _buildNotificationIcon(context),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<CollectionBloc, CollectionState>(
      listener: (context, state) {
        if (state is CollectionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is CollectionLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CollectionLoadedState) {
          return _buildCollectionGrid(state.items);
        }
        return const Center(child: Text('No items in collection'));
      },
    );
  }

  Widget _buildCollectionGrid(List<CollectionItem> items) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.5, // Adjust aspect ratio for card height
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => _CollectionItemCard(item: items[index]),
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () {},
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRefreshButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CollectionBloc>().add(CollectionRefreshed());
      },
      child: const Icon(Icons.refresh),
    );
  }
}

class _CollectionItemCard extends StatelessWidget {
  final CollectionItem item;

  const _CollectionItemCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border.all(color: Colors.transparent, width: 0),
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return BottleDetailScreen();
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImageSection(context),
            Flexible(
              // ✅ Allows details to adjust dynamically without overflow
              child: _buildItemDetails(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4, // Enforcing 3:4 image aspect ratio
      child: ClipRRect(
        // borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.asset(
          item.imagePath,
          fit: BoxFit.cover, // ✅ Ensures full image display
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey.shade200,
            child: const Icon(Icons.image_not_supported_outlined),
          ),
        ),
      ),
    );
  }

  Widget _buildItemDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize:
            MainAxisSize.min, // ✅ Prevents unnecessary height restriction
        children: [
          Text(
            item.brand,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '${item.year} • #${item.bottleNumber}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
          ),
          const SizedBox(height: 4),
          _buildCollectionStatus(context),
        ],
      ),
    );
  }

  Widget _buildCollectionStatus(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '${item.owned}',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
        children: [
          TextSpan(
            text: '/${item.total}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
        ],
      ),
    );
  }
}
