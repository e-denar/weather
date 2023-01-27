enum Status {
  loading,
  init,
  success,
  error;

  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
}
