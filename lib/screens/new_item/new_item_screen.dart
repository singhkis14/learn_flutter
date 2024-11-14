import 'package:flutter/material.dart';
import 'package:learn_flutter/data/categories.dart';
import 'package:learn_flutter/models/category.dart';
import 'package:learn_flutter/models/grocery_item.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  late Category _selectedCategory;

  void _saveItem() {
    final formState = _formKey.currentState!;
    if (formState.validate()) {
      formState.save();
      var item = GroceryItem(id: '_enteredName', name: _enteredName, quantity: _enteredQuantity, category: _selectedCategory);
      Navigator.of(context).pop(item);
    }
  }

  void _reset() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                validator: (value) {
                  if (value == null || value.trim().isEmpty || value.trim().length <= 1 || value.trim().length > 50) {
                    return 'Enter a valid name';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _enteredName = newValue!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty || int.tryParse(value.trim()) == null || int.tryParse(value.trim())! <= 0) {
                          return 'Enter a valid name';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _enteredQuantity = int.tryParse(newValue!)!;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.name),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          _selectedCategory = value;
                        }
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _reset,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text('Save'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
