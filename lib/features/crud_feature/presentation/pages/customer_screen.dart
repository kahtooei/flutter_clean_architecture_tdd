import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/params/edit_customer_params.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/bloc/customer_bloc.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/bloc/customer_status.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/widgets/customer_list_item.dart';

class CustomerScreen extends StatelessWidget {
  CustomerScreen({Key? key}) : super(key: key);

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bankAccountNumberController =
      TextEditingController();
  late BuildContext _context;
  bool isFormVisible = false;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("CRUD TDD & Clean Architecture"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocConsumer<CustomerBloc, CustomerState>(
          listener: (context, state) {
            if (state.customerStatus is FieldValidationErrorStatus) {
              showDialog(
                  context: _context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Invalid Data"),
                      content: Text(
                          (state.customerStatus as FieldValidationErrorStatus)
                              .error),
                    );
                  });
            } else {
              if (isFormVisible) {
                Navigator.pop(context);
                isFormVisible = false;
              }
            }
          },
          buildWhen: (previous, current) {
            if (current.customerStatus is FieldValidationErrorStatus) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            switch (state.customerStatus.runtimeType) {
              case CustomerLoadingStatus:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black87,
                  ),
                );
              case CustomerErrorStatus:
                return Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        Text(
                          "ERROR!!!",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CustomerBloc>(context)
                              .add(GetAllCustomersEvent());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            foregroundColor: Colors.white),
                        child: const Text("Retry")),
                    Text((state.customerStatus as CustomerErrorStatus).error)
                  ],
                );
              case CustomerCompletedStatus:
                List<CustomerEntity> customerList =
                    (state.customerStatus as CustomerCompletedStatus)
                        .customerList;
                if (customerList.isNotEmpty) {
                  return ListView.builder(
                    itemCount: customerList.length,
                    itemBuilder: (context, index) {
                      return CustomerListItem(customerList[index], showForm);
                    },
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.no_accounts,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "There Is No Customer",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "For Creating a Customer Tap on  +  button👇",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: const Icon(Icons.add),
        onPressed: () {
          showForm(null);
        },
      ),
    );
  }

  void showForm(CustomerEntity? customer) async {
    late DateTime selectedDate;
    if (customer != null) {
      _firstnameController.text = customer.firstName;
      _lastnameController.text = customer.lastName;
      _phoneNumberController.text = customer.phoneNumber;
      _emailController.text = customer.email;
      _bankAccountNumberController.text = customer.bankAccountNumber;
      selectedDate = customer.dateOfBirth;
      _birthDayController.text =
          "${selectedDate.year}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}";
    } else {
      _firstnameController.text = "";
      _lastnameController.text = "";
      _phoneNumberController.text = "";
      _emailController.text = "";
      _bankAccountNumberController.text = "";
      selectedDate = DateTime.now();
      _birthDayController.text =
          "${selectedDate.year}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}";
    }
    showModalBottomSheet(
      context: _context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(_context).viewInsets.bottom + 200,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _firstnameController,
                decoration: const InputDecoration(hintText: 'FirstName'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _lastnameController,
                decoration: const InputDecoration(hintText: 'LastName'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: _phoneNumberController,
                decoration: const InputDecoration(hintText: 'Phone'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _bankAccountNumberController,
                decoration:
                    const InputDecoration(hintText: 'BankAccountNumber'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  controller: _birthDayController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), labelText: "BirthDay"),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: _context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2025));
                    if (pickedDate != null) {
                      selectedDate = pickedDate;
                      _birthDayController.text =
                          "${selectedDate.year}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}";
                    } else {
                      _birthDayController.text = "";
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black87),
                ),
                onPressed: () async {
                  isFormVisible = true;
                  CustomerParams params = CustomerParams(
                      firstName: _firstnameController.text,
                      lastName: _lastnameController.text,
                      dateOfBirth: selectedDate,
                      phoneNumber: _phoneNumberController.text,
                      email: _emailController.text,
                      bankAccountNumber: _bankAccountNumberController.text);
                  if (customer == null) {
                    BlocProvider.of<CustomerBloc>(_context)
                        .add(CreateNewCustomerEvent(customerParams: params));
                  } else {
                    BlocProvider.of<CustomerBloc>(_context).add(
                        EditCustomerEvent(
                            editCustomerParams: EditCustomerParams(
                                customerID: customer.id,
                                customerParams: params)));
                  }

                  // Navigator.pop(_context);
                },
                child: Text(customer == null ? 'Create New' : 'Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
