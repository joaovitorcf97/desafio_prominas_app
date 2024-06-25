abstract class Resource<T> {}

class Loading extends Resource {}

class Success<T> extends Resource<T> {
  final T data;

  Success({required this.data});
}

class ErrorResponse<T> extends Resource<T> {
  final String message;

  ErrorResponse({required this.message});
}

class ErrorData<T> extends Resource<T> {
  final String message;

  ErrorData({required this.message});
}
