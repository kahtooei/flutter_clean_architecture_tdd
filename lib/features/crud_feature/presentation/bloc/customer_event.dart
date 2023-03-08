part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
}

//Event to add new customer to database
class CreateNewCustomerEvent extends CustomerEvent {
  final CustomerParams customerParams;
  const CreateNewCustomerEvent({required this.customerParams});

  @override
  List<Object?> get props => [customerParams];
}

//Event to delete customer from database
class DeleteCustomerEvent extends CustomerEvent {
  final int customerID;
  const DeleteCustomerEvent({required this.customerID});
  @override
  List<Object?> get props => [customerID];
}
