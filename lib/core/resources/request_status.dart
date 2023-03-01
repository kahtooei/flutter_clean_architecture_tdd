// Abstract class to handle the status of a request
import 'package:equatable/equatable.dart';

abstract class RequestStatus<T> extends Equatable {
  final T? response; // holds the response data when the request is successful
  final String? error; // holds the error message when the request fails

  // Constructor to set the response and error properties
  const RequestStatus(this.response, this.error);

  List<Object?> get props => [response, error];
}

// Class to handle successful request status
class SuccessRequest<T> extends RequestStatus<T> {
  // Constructor to set the response property and set the error property to null
  const SuccessRequest(T? response) : super(response, null);

  @override
  List<Object?> get props => [response];
}

// Class to handle failed request status
class FailedRequest<T> extends RequestStatus<T> {
  // Constructor to set the error property and set the response property to null
  const FailedRequest(String error) : super(null, error);

  List<Object?> get props => [error];
}
