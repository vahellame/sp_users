class Pagination {
  const Pagination({
    this.start = 0,
    this.limit = 50,
  });

  final int start;
  final int limit;

  Pagination nextPage() {
    return Pagination(start: start + limit, limit: limit);
  }
}
