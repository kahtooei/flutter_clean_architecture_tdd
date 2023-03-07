import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/models/customer_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class CustomerLocalDataSource {
  //insert new customer to database
  Future<CustomerModel> insertCustomer(CustomerParams customer);
  //get list of all customers
  Future<List<CustomerModel>> selectAllCustomers();
  //update customer info
  Future<void> updateCustomer(CustomerModel customer);
  //delete customer from database
  Future<void> deleteCustomer(int customerID);
}

class CustomerSqliteDB extends CustomerLocalDataSource {
  late Database db;
  Database? _db;
  CustomerSqliteDB({Database? database}) : _db = database;
  @override
  Future<void> deleteCustomer(int customerID) {
    // TODO: implement deleteCustomer
    throw UnimplementedError();
  }

  @override
  Future<CustomerModel> insertCustomer(CustomerParams customer) {
    // TODO: implement insertCustomer
    throw UnimplementedError();
  }

  @override
  Future<List<CustomerModel>> selectAllCustomers() {
    // TODO: implement selectAllCustomers
    throw UnimplementedError();
  }

  @override
  Future<void> updateCustomer(CustomerModel customer) {
    // TODO: implement updateCustomer
    throw UnimplementedError();
  }
}
