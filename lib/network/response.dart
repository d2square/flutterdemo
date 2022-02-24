class ResponseData<T> {
  Status? status;
  T? data;
  String? message;

  ResponseData.loading(this.message) : status = Status.loading;

  ResponseData.completed(this.data) : status = Status.completed;

  ResponseData.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { loading, completed, error }
