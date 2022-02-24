class ExceptionClass implements Exception {
  String? message = "";
  String? start = "";

  ExceptionClass([this.message, this.start]);

  @override
  String toString() {
    return "$start" "$message";
  }
}

class FetchDataException extends ExceptionClass {
  FetchDataException([String? message])
      : super(message, "Error During Fetching data: ");
}

class BadRequestException extends ExceptionClass {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ExceptionClass {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends ExceptionClass {
  InvalidInputException([String? message]) : super(message, "Invalid Input To Api: ");
}
