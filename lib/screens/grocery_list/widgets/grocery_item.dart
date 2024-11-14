import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/models/grocery_item.dart';
import 'package:learn_flutter/providers/grocery_provider.dart';

class GroceryItemRow extends ConsumerWidget {
  final GroceryItem groceryItem;

  const GroceryItemRow(this.groceryItem, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      onDismissed: (direction) {
        ref.read(groceryProvider.notifier).removeItem(groceryItem);
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
