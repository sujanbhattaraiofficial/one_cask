import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/core/errors/exceptions.dart';
import 'package:one_cask/domain/repositories/collection_repository.dart';
import 'collection_event.dart';
import 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionRepository repository;

  CollectionBloc({required this.repository}) : super(CollectionInitial()) {
    on<CollectionLoaded>(_onCollectionLoaded);
    on<CollectionRefreshed>(_onCollectionRefreshed);
  }

  Future<void> _onCollectionLoaded(
    CollectionLoaded event,
    Emitter<CollectionState> emit,
  ) async {
    emit(CollectionLoading());

    try {
      final items = await repository.getCollectionItems();
      emit(CollectionLoadedState(items));
    } on ServerException catch (e) {
      emit(CollectionError(e.message));
    } on CacheException catch (e) {
      emit(CollectionError(e.message));
    } catch (e) {
      emit(CollectionError('An unexpected error occurred: $e'));
    }
  }

  Future<void> _onCollectionRefreshed(
    CollectionRefreshed event,
    Emitter<CollectionState> emit,
  ) async {
    emit(CollectionLoading());

    try {
      await repository.refreshCollection();
      final items = await repository.getCollectionItems();
      emit(CollectionLoadedState(items));
    } on ServerException catch (e) {
      emit(CollectionError(e.message));
    } on CacheException catch (e) {
      emit(CollectionError(e.message));
    } catch (e) {
      emit(CollectionError('An unexpected error occurred: $e'));
    }
  }
}
