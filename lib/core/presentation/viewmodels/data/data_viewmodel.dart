// ignore_for_file: overridden_fields

import 'package:sp_users/core/presentation/presentation.dart';
import 'package:sp_users/core/domain/domain.dart';

abstract class DataViewModel<T> extends StateNotifier<T> {
  DataViewModel(super.state);

  Future<void> reload();
}

abstract class SingleDataViewModel<T> extends DataViewModel<DataState<T>> {
  SingleDataViewModel(this.modelValue) : super(DataState<T>.loading()) {
    reload();
  }

  final ModelValue<T>? modelValue;

  int? get _id {
    if (modelValue?.id != null) {
      return modelValue!.id;
    }

    try {
      return (modelValue?.cachedModel as dynamic)?.id;
    } catch (_) {
      return null;
    }
  }

  T? get _cache => null; //modelValue?.cachedModel;

  Future<void> loadData(
    Future<Either<Failure, T>> Function() method, {
    void Function(T data)? onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    _processData(method(), onSuccess, onFailure);
  }

  Future<void> loadDataById(
    Future<Either<Failure, T>> Function(int id) method, {
    void Function(T data)? onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    assert(_id != null);
    _processData(method(_id!), onSuccess, onFailure);
  }

  void _processData(
    Future<Either<Failure, T>> method,
    void Function(T data)? onSuccess,
    void Function(Failure failure)? onFailure,
  ) async {
    if (_cache != null) {
      state = DataState<T>.slientLoading(data: _cache as T);
    } else {
      state = DataState<T>.loading();
    }

    final response = await method;
    state = response.fold(
      (l) {
        return DataState<T>.loaded(
          data: state.data as T,
          failure: l,
        );
      },
      (r) {
        return DataState<T>.loaded(data: r);
      },
    );

    if (response.isLeft() && onFailure != null) {
      final failure = response.getLeft().toNullable()!;
      onFailure(failure);
    } else if (response.isRight() && onSuccess != null) {
      final data = response.getRight().toNullable() as T;
      onSuccess(data);
    }
  }
}

abstract class MultiDataViewModel<T> extends DataViewModel<DataState<List<T>>> {
  MultiDataViewModel() : super(DataState<List<T>>.loading()) {
    reload();
  }

  Future<void> loadMore();

  Future<void> loadData(
    Future<Either<Failure, List<T>>> Function() method, {
    void Function(List<T> data)? onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    _processData(method(), onSuccess, onFailure);
  }

  Future<void> loadDataMore(
    Future<Either<Failure, List<T>>> Function(Pagination pagination) method, {
    void Function(List<T> data)? onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    if (!state.isLoaded) return Future(() => null);

    final oldState = state as DataStateLoaded<List<T>>;
    if (oldState.pagination == null) return Future(() => null);

    state = DataState<List<T>>.slientLoading(
      data: oldState.data,
      pagination: oldState.pagination!,
    );
    final response = await method(oldState.pagination!.nextPage());

    final paginatedOldState = oldState.copyWith(
      pagination: oldState.pagination!.nextPage(),
    );

    state = response.fold(
      (l) {
        return DataState<List<T>>.loaded(
          data: oldState.data,
          failure: l,
        );
      },
      (r) {
        return DataState<List<T>>.loaded(
          data: paginatedOldState.data..addAll(r),
        );
      },
    );

    if (response.isLeft() && onFailure != null) {
      final failure = response.getLeft().toNullable()!;
      onFailure(failure);
    } else if (response.isRight() && onSuccess != null) {
      final data = response.getRight().toNullable()!;
      onSuccess(data);
    }
  }

  void _processData(
    Future<Either<Failure, List<T>>> method,
    void Function(List<T> data)? onSuccess,
    void Function(Failure failure)? onFailure,
  ) async {
    final response = await method;
    state = response.fold(
      (l) {
        if (state.isLoaded) {
          return DataState<List<T>>.loaded(
            data: state.data!,
            failure: l,
          );
        } else {
          return DataState<List<T>>.loading();
        }
      },
      (r) {
        return DataState<List<T>>.loaded(data: r);
      },
    );

    if (response.isLeft() && onFailure != null) {
      final failure = response.getLeft().toNullable()!;
      onFailure(failure);
    } else if (response.isRight() && onSuccess != null) {
      final data = response.getRight().toNullable()!;
      onSuccess(data);
    }
  }
}
