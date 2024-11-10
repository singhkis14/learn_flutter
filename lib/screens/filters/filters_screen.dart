import 'package:flutter/material.dart';
import 'package:learn_flutter/models/filter.dart';

class FilterScreen extends StatefulWidget {
  final Map<Filter, bool> _filterValues;

  const FilterScreen(this._filterValues, {super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yours Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            return;
          }
          Navigator.of(context).pop({
            Filter.glutenFree: widget._filterValues[Filter.glutenFree]!,
            Filter.lactoseFree: widget._filterValues[Filter.lactoseFree]!,
            Filter.vegetarian: widget._filterValues[Filter.vegetarian]!,
            Filter.vegans: widget._filterValues[Filter.vegans]!,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: widget._filterValues[Filter.glutenFree]!,
              onChanged: (value) {
                setState(() {
                  widget._filterValues[Filter.glutenFree] = value;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: widget._filterValues[Filter.lactoseFree]!,
              onChanged: (value) {
                setState(() {
                  widget._filterValues[Filter.lactoseFree] = value;
                });
              },
              title: Text(
                'Lactos-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only include lacctos-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: widget._filterValues[Filter.vegetarian]!,
              onChanged: (value) {
                setState(() {
                  widget._filterValues[Filter.vegetarian] = value;
                });
              },
              title: Text(
                'Veg only',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only include veg meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: widget._filterValues[Filter.vegans]!,
              onChanged: (value) {
                setState(() {
                  widget._filterValues[Filter.vegans] = value;
                });
              },
              title: Text(
                'Vegan only',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
