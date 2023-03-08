import 'package:equatable/equatable.dart';

abstract class CustomerStatus extends Equatable {}

class EmptyCustomerStatus extends CustomerStatus {
  @override
  List<Object?> get props => [];
}
