import 'package:sp_users/core/domain/domain.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState {
  const factory DataState.loading({variable}) = DataStateLoading;

  const factory DataState.error({
    required Failure failure,
  }) = DataStateError;

  const factory DataState.loaded({
    required T data,
    Failure? failure,
    Pagination? pagination,
  }) = DataStateLoaded;

  const factory DataState.slientLoading({
    required T data,
    Pagination? pagination,
  }) = DataStateSlientLoading;
}

extension DataStateExtension<T> on DataState<T> {
  T? get data {
    if (isLoaded) {
      return (this as DataStateLoaded).data;
    }

    if (isSlientLoading) {
      return (this as DataStateSlientLoading).data;
    }

    return null;
  }

  bool get isMultipleData => data is List;

  bool get isEmpty {
    if (data != null) return false;

    if (isMultipleData) return (data as List).isEmpty;

    return true;
  }

  bool get isNotEmpty => !isEmpty;

  Failure? get failure {
    if (isError) {
      return (this as DataStateError).failure;
    }

    return null;
  }

  Pagination? get pagination {
    if (isLoaded) {
      return (this as DataStateLoaded).pagination;
    }

    if (isSlientLoading) {
      return (this as DataStateSlientLoading).pagination;
    }

    return null;
  }

  bool get isLoading => this is DataStateLoading;

  bool get isLoaded => this is DataStateLoaded;

  bool get isError => this is DataStateError;

  bool get isSlientLoading => this is DataStateSlientLoading;
}
