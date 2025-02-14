// presentation/blocs/collection_bloc/collection_state.dart
import 'package:equatable/equatable.dart';
import 'package:one_cask/domain/entities/collection_item.dart';

abstract class CollectionState extends Equatable {
  const CollectionState();

  @override
  List<Object> get props => [];
}

class CollectionInitial extends CollectionState {}

class CollectionLoading extends CollectionState {}

class CollectionLoadedState extends CollectionState {
  final List<CollectionItem> items;

  const CollectionLoadedState(this.items);

  @override
  List<Object> get props => [items];
}

class CollectionError extends CollectionState {
  final String message;

  const CollectionError(this.message);

  @override
  List<Object> get props => [message];
}
