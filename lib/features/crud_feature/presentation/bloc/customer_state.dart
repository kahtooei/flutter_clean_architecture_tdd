part of 'customer_bloc.dart';

class CustomerState extends Equatable {
  final CustomerStatus customerStatus;
  const CustomerState({required this.customerStatus});

  CustomerState copyWith({CustomerStatus? newStatus}) {
    return CustomerState(customerStatus: newStatus ?? customerStatus);
  }

  @override
  List<Object> get props => [customerStatus];
}
