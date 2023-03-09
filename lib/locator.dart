import 'package:flutter_clean_architecture_tdd/core/utils/presentation/fields_validation.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/data_source/local/customer_local_datasource.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/repository/customer_repository_impl.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/create_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/delete_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/edit_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/get_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/bloc/customer_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setUp() {
  //call local data-source
  getIt.registerSingleton<CustomerLocalDataSource>(CustomerSqliteDB());

  //repository
  getIt.registerSingleton<CustomerRepository>(CustomerRepositoryImpl(getIt()));

  //use case
  getIt.registerSingleton<GetCustomersUseCase>(GetCustomersUseCase(getIt()));
  getIt
      .registerSingleton<CreateCustomerUseCase>(CreateCustomerUseCase(getIt()));
  getIt.registerSingleton<EditCustomersUseCase>(EditCustomersUseCase(getIt()));
  getIt
      .registerSingleton<DeleteCustomerUseCase>(DeleteCustomerUseCase(getIt()));

  getIt.registerSingleton<InputValidation>(ParamsValidation());

  //bloc
  getIt.registerSingleton<CustomerBloc>(
      CustomerBloc(getIt(), getIt(), getIt(), getIt(), getIt()));
}
