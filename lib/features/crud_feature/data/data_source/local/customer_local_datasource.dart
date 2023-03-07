import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/models/customer_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class CustomerLocalDataSource {
  //insert new customer to database
  Future<CustomerModel> insertCustomer(CustomerParams customer);
  //get list of all customers
  Future<List<CustomerModel>> selectAllCustomers();
  //update customer info
  Future<CustomerModel> updateCustomer(CustomerModel customer);
  //delete customer from database
  Future<bool> deleteCustomer(int customerID);
}

class CustomerSqliteDB extends CustomerLocalDataSource {
  late Database db;
  Database? _db;
  CustomerSqliteDB({Database? database}) : _db = database;

  late String _path;
  final String _createCustomerTable = '''
                  create table customer ( 
                      id integer primary key autoincrement,
                      firstName text not null,
                      lastName text not null,
                      dateOfBirth,
                      phoneNumber text not null,
                      email text UNIQUE not null,
                      bankAccountNumber text not null,

                      UNIQUE(firstName,lastName,dateOfBirth)
                      )
                  ''';

  Future open({String dbname: "customer.db"}) async {
    if (_db != null) {
      db = _db!;
    } else {
      var dbpath = await getDatabasesPath();
      _path = join(dbpath, dbname);
      db = await openDatabase(_path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(_createCustomerTable);
      });
    }
  }

  // Close the database connection
  Future close() async {
    db.close();
  }

  @override
  Future<bool> deleteCustomer(int customerID) async {
    await open();
    await db.delete("customer", where: "id = $customerID");
    await close();

    return true;
  }

// Insert data into the database
  @override
  Future<CustomerModel> insertCustomer(CustomerParams customer) async {
    await open();
    Map<String, dynamic> customerMap = customer.toMap();
    int id = await db.insert("customer", customerMap);
    customerMap['id'] = id;
    await close();
    return CustomerModel.fromMap(customerMap);
  }

  @override
  Future<List<CustomerModel>> selectAllCustomers() async {
    List<CustomerModel> customerList = [];
    await open();
    List<Map<String, dynamic>> customers =
        await db.rawQuery("select * from customer where 1=1");
    await close();
    for (Map<String, dynamic> customer in customers) {
      customerList.add(CustomerModel.fromMap(customer));
    }
    return customerList;
  }

  @override
  Future<CustomerModel> updateCustomer(CustomerModel customer) async {
    await open();
    Map<String, dynamic> customerMap = customer.toMap();
    await db.update("customer", customerMap, where: "id= ${customer.id}");
    await close();
    return customer;
  }
}
