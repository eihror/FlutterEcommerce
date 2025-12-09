abstract class UiError {
  UiError({required this.title, required this.text});

  final String title;
  final String text;
}

final class ScreenUiError extends UiError {
  ScreenUiError({
    required super.text,
    super.title = '',
  });
}
