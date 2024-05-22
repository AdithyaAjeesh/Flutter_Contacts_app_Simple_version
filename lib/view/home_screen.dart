import 'package:flutter/material.dart';
import 'package:flutter_api_contacts_app/controller/contacts_provider.dart';
import 'package:flutter_api_contacts_app/view/add_screen.dart';
import 'package:flutter_api_contacts_app/view/edit_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactsProvider>(context);
    provider.getAll();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Api Contacts App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: provider.contacts.length,
        itemBuilder: (context, index) {
          final person = provider.contacts[index];
          final name = person.name.toString();
          final phone = person.phone.toString();
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditScreen(
                        contactId: person.id,
                      )));
            },
            title: Text(name),
            subtitle: Text(phone),
            trailing: ElevatedButton(
              onPressed: () {
                provider.deleteContacts(person.id);
              },
              child: const Text('Delete'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        child: const Text('ADD'),
      ),
    );
  }
}
