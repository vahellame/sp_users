import 'package:sp_users/core/presentation/presentation.dart';
import 'package:sp_users/modules/user/domain/domain.dart';

class UProvidedStateDecorator<T> extends ConsumerWidget {
  const UProvidedStateDecorator({
    Key? key,
    required this.provider,
    required this.builder,
    this.sliver = false,
  }) : super(key: key);

  factory UProvidedStateDecorator.sliver({
    Key? key,
    required ProviderListenable<DataState<T>> provider,
    required Widget Function(T data, Failure? failure, WidgetRef ref) builder,
  }) {
    return UProvidedStateDecorator(
      key: key,
      provider: provider,
      builder: builder,
      sliver: true,
    );
  }

  final ProviderListenable<DataState<T>> provider;
  final Widget Function(T data, Failure? failure, WidgetRef ref) builder;
  final bool sliver;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UStateDecorator<T>(
      state: ref.watch(provider),
      builder: (data, failure) => builder(data, failure, ref),
      sliver: sliver,
    );
  }
}

class UProvidedBuilder<T> extends ConsumerWidget {
  const UProvidedBuilder({
    Key? key,
    required this.provider,
    required this.builder,
  }) : super(key: key);

  final ProviderListenable<DataState<T>> provider;
  final Widget Function(DataState<T> data, WidgetRef ref) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return builder(ref.watch(provider), ref);
  }
}

class UStateDecorator<T> extends StatelessWidget {
  const UStateDecorator({
    Key? key,
    required this.state,
    required this.builder,
    this.sliver = false,
  }) : super(key: key);

  factory UStateDecorator.sliver({
    Key? key,
    required DataState<T> state,
    required Widget Function(T data, Failure? failure) builder,
  }) {
    return UStateDecorator(
      key: key,
      state: state,
      builder: builder,
      sliver: true,
    );
  }

  final DataState<T> state;
  final Widget Function(T data, Failure? failure) builder;
  final bool sliver;

  @override
  Widget build(BuildContext context) {
    Widget result;

    if (state.isLoading) {
      result = _ChildWithLoader<T>(state, builder);
    } else if (state.isEmpty) {
      result = _Empty(state);
    } else {
      return builder(state.data as T, state.failure);
    }

    if (!sliver) {
      return result;
    } else {
      return SliverToBoxAdapter(child: result);
    }
  }
}

class _Empty<T> extends StatelessWidget {
  const _Empty(
    this.state, {
    Key? key,
  }) : super(key: key);

  final DataState<T> state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: DesignConstants.padding,
        child: Text('empty (${state.failure})'),
      ),
    );
  }
}

class _ChildWithLoader<T> extends StatelessWidget {
  const _ChildWithLoader(
    this.state,
    this.builder, {
    Key? key,
  }) : super(key: key);

  final DataState<T> state;
  final Widget Function(T data, Failure? failure) builder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (state.data != null) builder(state.data as T, null),
        const Center(
          child: Padding(
            padding: DesignConstants.padding,
            child: UPreloader(),
          ),
        ),
      ],
    );
  }
}
