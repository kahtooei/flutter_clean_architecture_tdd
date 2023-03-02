import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';

//base usecase class
//P is Parameters and have to be put into a container object
//T is return type
abstract class UseCase<T, P> {
  Future<RequestStatus<T>> execute(P params);
}

//base class for usecases that doesn't accept any parameters
abstract class UseCaseNoParams<T> {
  Future<RequestStatus<T>> execute();
}
