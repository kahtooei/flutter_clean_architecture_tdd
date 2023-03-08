import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_tdd/core/utils/presentation/fields_validation.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/create_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/delete_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/edit_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/get_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/bloc/customer_status.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  // Instance of GetCustomersUseCase to get all customers
  final GetCustomersUseCase getCustomers;
  // Instance of CreateCustomersUseCase to create a new customer
  final CreateCustomerUseCase createCustomer;
  // Instance of EditCustomersUseCase to edit a customer
  final EditCustomersUseCase editCustomer;
  // Instance of DeleteCustomerUseCase to delete a customer
  final DeleteCustomerUseCase deleteCustomer;
  // Instance of InputValidator to validate customer params
  final InputValidation inputValidation;
  // Constructor for the CustomerBloc class, which takes four parameters, instances of
  // GetCustomersUseCase, CreateCustomersUseCase, EditCustomersUseCase, and DeleteCustomerUseCase.
  // The initial state of the Bloc is set to CustomerLoadingStatus().
  CustomerBloc(
    this.inputValidation,
    this.createCustomer,
    this.editCustomer,
    this.deleteCustomer,
    this.getCustomers,
  ) : super(CustomerState(customerStatus: EmptyCustomerStatus()));
}
