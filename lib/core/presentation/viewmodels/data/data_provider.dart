import 'package:sp_users/core/presentation/presentation.dart';

// ignore_for_file: subtype_of_sealed_class, prefer-correct-type-name

class SingleDataViewModelProvider<S extends SingleDataViewModel<T>, T> extends StateNotifierProvider<S, DataState<T>> {
  SingleDataViewModelProvider(super.create);
}

class MultiDataViewModelProvider<S extends MultiDataViewModel<T>, T> extends StateNotifierProvider<S, DataState<List<T>>> {
  MultiDataViewModelProvider(super.create);
}

class SingleDataViewModelProviderFamily<S extends SingleDataViewModel<A>, A, B> extends StateNotifierProviderFamily<S, DataState<A>, B> {
  SingleDataViewModelProviderFamily(
    FamilyCreate<S, StateNotifierProviderRef<S, DataState<A>>, B> create,
  ) : super(create);
}

class MultiDataViewModelProviderFamily<S extends MultiDataViewModel<A>, A, B> extends StateNotifierProviderFamily<S, DataState<List<A>>, B> {
  MultiDataViewModelProviderFamily(
    FamilyCreate<S, StateNotifierProviderRef<S, DataState<List<A>>>, B> create,
  ) : super(create);
}

class SingleDataViewModelProviderWithModelValue<S extends SingleDataViewModel<T>, T> extends StateNotifierProviderFamily<S, DataState<T>, ModelValue<T>> {
  SingleDataViewModelProviderWithModelValue(
    FamilyCreate<S, StateNotifierProviderRef<S, DataState<T>>, ModelValue<T>> create,
  ) : super(create);
}
