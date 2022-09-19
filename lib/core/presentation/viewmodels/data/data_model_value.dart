class ModelValue<T> {
  ModelValue({
    this.id,
    this.cachedModel,
  }) : assert(id != null || cachedModel != null);

  final int? id;
  final T? cachedModel;

  bool get isCached => cachedModel != null;
}
