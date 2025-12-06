abstract class AppRoute {
  AppRoute({required this.path});

  final String path;

  @override
  String toString() {
    return path;
  }
}
