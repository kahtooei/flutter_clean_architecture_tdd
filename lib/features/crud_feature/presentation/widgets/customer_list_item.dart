import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/bloc/customer_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomerListItem extends StatelessWidget {
  final Function(CustomerEntity) showForm;
  final CustomerEntity customer;
  const CustomerListItem(this.customer, this.showForm, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (_) => showForm(customer),
            backgroundColor: Colors.grey.shade400,
            foregroundColor: Colors.black87,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            flex: 2,
            onPressed: (_) => BlocProvider.of<CustomerBloc>(context)
                .add(DeleteCustomerEvent(customerID: customer.id)),
            backgroundColor: Colors.grey.shade400,
            foregroundColor: Colors.black87,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        color: Colors.black87,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Customer Info",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Text(
                          "FirstName",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(customer.firstName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Text("LastName",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(customer.lastName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Text("DateOfBirth",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(
                            "${customer.dateOfBirth.year}/${customer.dateOfBirth.month.toString().padLeft(2, "0")}/${customer.dateOfBirth.day.toString().padLeft(2, "0")}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Text("PhoneNumber",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(customer.phoneNumber,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Text("Email",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(customer.email,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Text("AccountNumber",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(customer.bankAccountNumber,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
