import 'package:flutter/material.dart';
import 'package:flutter_api_contacts_app/controller/contacts_provider.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactsProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
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
                provider.addContacts(context);
              },
              child: Text('ADD'),
            )
          ],
        ),
      ),
    );
  }
}
