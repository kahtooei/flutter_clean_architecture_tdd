import 'package:flutter_clean_architecture_tdd/core/utils/presentation/fields_validation.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/create_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/delete_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/edit_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/get_customer_usecase.dart';
import 'package:mockito/annotations.dart';

// Annotation to generate mock objects
@GenerateMocks([
  InputValidation,
  CreateCustomerUseCase,
  EditCustomersUseCase,
  DeleteCustomerUseCase,
  GetCustomersUseCase
])
void main() {}
