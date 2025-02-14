// presentation/blocs/collection_bloc/collection_event.dart
import 'package:equatable/equatable.dart';

abstract class CollectionEvent extends Equatable {
  const CollectionEvent();

  @override
  List<Object> get props => [];
}

class CollectionLoaded extends CollectionEvent {}

class CollectionRefreshed extends CollectionEvent {}
