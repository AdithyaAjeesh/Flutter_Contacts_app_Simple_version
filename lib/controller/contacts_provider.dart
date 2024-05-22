import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_contacts_app/model/contacts_model.dart';

class ContactsProvider extends ChangeNotifier {
  Dio dio = Dio();
  List<ContactsModel> contacts = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<List<ContactsModel>> getAll() async {
    try {
      final response = await dio
          .get('https://contacts-management-server.onrender.com/api/contacts');
      if (response.statusCode == 200) {
        notifyListeners();
        List<dynamic> jsonData = response.data;
        List<ContactsModel> cntxt =
            jsonData.map((item) => ContactsModel.fromJson(item)).toList();
        return contacts = cntxt;
      } else {
        throw Exception('ERROR');
      }
    } catch (e) {
      throw Exception('ERROR $e');
    }
  }

  Future<void> addContacts(context) async {
    ContactsModel contactsModel = ContactsModel(
      name: nameController.text.trim(),
      phone: int.tryParse(phoneController.text.trim()),
      address: addressController.text.trim(),
      email: emailController.text.trim(),
    );
    try {
      final response = await dio.post(
        'https://contacts-management-server.onrender.com/api/contacts',
        data: contactsModel.toJson(),
      );
      if (response.statusCode == 201) {
        notifyListeners();
        print('Contact ADDED');
        Navigator.of(context).pop();
      } else {
        throw Exception('ERROR');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteContacts(contactId) async {
    try {
      final response = await dio.delete(
        "https://contacts-management-server.onrender.com/api/contacts/$contactId",
      );
      if (response.statusCode == 200) {
        notifyListeners();
        print('DELETED');
      } else {
        throw Exception('ERROR');
      }
    } catch (e) {
      throw Exception('ERROR $e');
    }
  }

  Future<void> updateContact(contactId, context) async {
    ContactsModel contactsModel = ContactsModel(
      name: nameController.text.trim(),
      phone: int.tryParse(phoneController.text.trim()),
      address: addressController.text.trim(),
      email: emailController.text.trim(),
    );
    try {
      final response = await dio.put(
        'https://contacts-management-server.onrender.com/api/contacts/$contactId',
        data: contactsModel.toJson(),
      );
      if (response.statusCode == 200) {
        notifyListeners();
        print('Contact UPDATED');
        Navigator.of(context).pop();
      } else {}
    } catch (e) {
      throw Exception('ERROR $e');
    }
  }
}
