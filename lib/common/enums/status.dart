enum Status {
  loading,
  init,
  success,
  error;

  bool get isLoading => this == Status.loading;
}
