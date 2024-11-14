import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/models/grocery_item.dart';
import 'package:learn_flutter/providers/grocery_provider.dart';
import 'package:learn_flutter/screens/grocery_list/widgets/grocery_item.dart';
import 'package:learn_flutter/screens/new_item/new_item_screen.dart';

class GroceryList extends ConsumerWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var groceryItems = ref.watch(groceryProvider);
    final Widget content;
    if (groceryItems.isNotEmpty) {
      content = ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            return GroceryItemRow(item);
          });
    } else {
      content = const Center(child: Text('Try adding some groceries!!!'));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
                  builder: (context) {
                    return const NewItemScreen();
                  },
                ));
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: content);
  }
}
