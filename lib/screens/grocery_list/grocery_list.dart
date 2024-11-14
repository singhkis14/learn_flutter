import 'package:flutter/material.dart';
import 'package:learn_flutter/models/grocery_item.dart';
import 'package:learn_flutter/screens/grocery_list/widgets/grocery_item.dart';
import 'package:learn_flutter/screens/new_item/new_item_screen.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final item = await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
      builder: (context) {
        return const NewItemScreen();
      },
    ));

    if (item == null) {
      return;
    }
    setState(() {
      _groceryItems.add(item);
    });
  }

  void _removeItem(GroceryItem item) {
    if (_groceryItems.contains(item)) {
      _groceryItems.remove(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget content;
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (context, index) {
            final item = _groceryItems[index];
            return GroceryItemRow(
              item,
              onDismisse: _removeItem,
            );
          });
    } else {
      content = const Center(child: Text('Try adding some groceries!!!'));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: content);
  }
}
