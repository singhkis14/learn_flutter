import 'package:flutter/material.dart';
import 'package:learn_flutter/models/grocery_item.dart';

class GroceryItemRow extends StatelessWidget {
  final GroceryItem groceryItem;

  final void Function(GroceryItem) onDismisse;

  const GroceryItemRow(this.groceryItem, {super.key, required this.onDismisse});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        onDismisse(groceryItem);
      },
      key: ValueKey(groceryItem),
      child: ListTile(
        title: Text(groceryItem.name),
        leading: DecoratedBox(
          decoration: BoxDecoration(color: groceryItem.category.color),
          child: const SizedBox(height: 30, width: 30),
        ),
        trailing: Text("${groceryItem.quantity}"),
      ),
    );
  }
}
