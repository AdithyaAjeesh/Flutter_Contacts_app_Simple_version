import 'package:flutter/material.dart';
import 'package:flutter_api_contacts_app/controller/contacts_provider.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  final contactId;
  const EditScreen({super.key, this.contactId});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactsProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: provider.nameController,
          ),
          TextField(
            controller: provider.phoneController,
          ),
          TextField(
            controller: provider.emailController,
          ),
          TextField(
            controller: provider.addressController,
          ),
          ElevatedButton(
            onPressed: () {
              provider.updateContact(contactId, context);
            },
            child: Text('EDIT'),
          ),
        ],
      ),
    );
  }
}
