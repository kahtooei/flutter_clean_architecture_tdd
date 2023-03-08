import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';

abstract class CustomerStatus extends Equatable {}

class EmptyCustomerStatus extends CustomerStatus {
  @override
  List<Object?> get props => [];
}

//status for loading time. waiting to do CRUD in database
class CustomerLoadingStatus extends CustomerStatus {
  @override
  List<Object?> get props => [];
}

//status after CRUD done
class CustomerCompletedStatus extends CustomerStatus {
  final List<CustomerEntity> customerList;
  CustomerCompletedStatus(this.customerList);
  @override
  List<Object?> get props => [customerList];
}

//status for when an error happened
class CustomerErrorStatus extends CustomerStatus {
  final String error;
  CustomerErrorStatus(this.error);
  @override
  List<Object?> get props => [error];
}

//status for when an field validation error happened
class FieldValidationErrorStatus extends CustomerStatus {
  final String error;
  FieldValidationErrorStatus(this.error);
  @override
  List<Object?> get props => [error];
}
