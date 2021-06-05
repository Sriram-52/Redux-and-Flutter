class AppState {
  List<dynamic> people;
  bool isLoading;
  String error;
  int page = 1;

  AppState({this.people, this.isLoading, this.error});

  AppState.fromAppState(AppState another) {
    people = another.people ?? [];
    isLoading = another.isLoading ?? false;
    error = another.error ?? "";
    page = another.page ?? this.page;
  }
}
