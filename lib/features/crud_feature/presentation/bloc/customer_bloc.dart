import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/params/edit_customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
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

  // Constructor for the CustomerBloc class, which takes five parameters, instances of
  // InputValidation, GetCustomersUseCase, CreateCustomersUseCase, EditCustomersUseCase, and DeleteCustomerUseCase.
  // The initial state of the Bloc is set to EmptyCustomerStatus().
  CustomerBloc(
    this.inputValidation,
    this.createCustomer,
    this.editCustomer,
    this.deleteCustomer,
    this.getCustomers,
  ) : super(CustomerState(customerStatus: EmptyCustomerStatus())) {
    // Listen to CreateNewCustomerEvent and emit a new state with a new status of CustomerLoadingStatus().
    // Then execute the createCustomer use case with the provided customerParams.
    // If the request status is a SuccessRequest, call the getAllCustomers() method.
    // Otherwise, emit a new state with a new status of CustomerErrorStatus with the error message.
    on<CreateNewCustomerEvent>((event, emit) async {
      var validation = inputValidation.checkValidation(event.customerParams);
      if (validation.status) {
        emit(state.copyWith(newStatus: CustomerLoadingStatus()));
        RequestStatus requestStatus =
            await createCustomer.execute(event.customerParams);
        if (requestStatus is SuccessRequest) {
          getAllCustomers();
        } else {
          emit(state.copyWith(
              newStatus: CustomerErrorStatus(requestStatus.error!)));
        }
      } else {
        emit(state.copyWith(
            newStatus: FieldValidationErrorStatus(validation.error!)));
      }
    });

    // Listen to DeleteCustomerEvent and emit a new state with a new status of CustomerLoadingStatus().
    // Then execute the deleteCustomer use case with the provided customerID.
    // If the request status is a SuccessRequest, call the getAllCustomers() method.
    on<DeleteCustomerEvent>((event, emit) async {
      emit(state.copyWith(newStatus: CustomerLoadingStatus()));
      RequestStatus requestStatus =
          await deleteCustomer.execute(event.customerID);
      if (requestStatus is SuccessRequest) {
        getAllCustomers();
      } else {
        emit(state.copyWith(
            newStatus: CustomerErrorStatus(requestStatus.error!)));
      }
    });

    // Listen to EditCustomerEvent and emit a new state with a new status of CustomerLoadingStatus().
    // Then execute the editCustomer use case with the provided customerID and customerParams.
    // If the request status is a SuccessRequest, call the getAllCustomers() method.
    // Otherwise, emit a new state with a new status of CustomerErrorStatus with the error message.
    on<EditCustomerEvent>((event, emit) async {
      var validation = inputValidation
          .checkValidation(event.editCustomerParams.customerParams);
      if (validation.status) {
        emit(state.copyWith(newStatus: CustomerLoadingStatus()));
        RequestStatus requestStatus =
            await editCustomer.execute(event.editCustomerParams);
        if (requestStatus is SuccessRequest) {
          getAllCustomers();
        } else {
          emit(state.copyWith(
              newStatus: CustomerErrorStatus(requestStatus.error!)));
        }
      } else {
        emit(state.copyWith(
            newStatus: FieldValidationErrorStatus(validation.error!)));
      }
    });

    // Listen to GetAllCustomersEvent and emit a new state with a new status of CustomerLoadingStatus().
    // Then call the getAllCustomers() method.
    on<GetAllCustomersEvent>((event, emit) async {
      emit(state.copyWith(newStatus: CustomerLoadingStatus()));
      getAllCustomers();
    });
  }

  // getAllCustomers is an asynchronous function that fetches the customers using the GetCustomersUseCase.
// The execute method of GetCustomersUseCase returns a RequestStatus object, which can be either a SuccessRequest or an ErrorRequest.
// If the request is successful, the state is updated with a new status of CustomerCompletedStatus along with the response received from the use case.
// If the request fails, the state is updated with a new status of CustomerErrorStatus along with the error message.
  getAllCustomers() async {
    RequestStatus requestStatus = await getCustomers.execute();
    if (requestStatus is SuccessRequest) {
      emit(state.copyWith(
          newStatus: CustomerCompletedStatus(requestStatus.response)));
    } else {
      emit(
          state.copyWith(newStatus: CustomerErrorStatus(requestStatus.error!)));
    }
  }
}
