import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_meals/providers/filters_provider.dart';

Widget getTitle(BuildContext context, String title) {
  return Text(
    title,
    style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
  );
}

Widget getSubTitle(BuildContext context, String subTitle) {
  return Text(
    subTitle,
    style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
  );
}

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  void onChange(WidgetRef ref, Filter filter, bool isChecked) {
    ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) =>
                onChange(ref, Filter.glutenFree, isChecked),
            title: getTitle(context, 'Gluten-Free'),
            subtitle: getSubTitle(context, 'Only include gluten-free meals.'),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) =>
                onChange(ref, Filter.lactoseFree, isChecked),
            title: getTitle(context, 'Lactose-free'),
            subtitle: getSubTitle(context, 'Only include lactose-free meals.'),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) =>
                onChange(ref, Filter.vegetarian, isChecked),
            title: getTitle(context, 'Vegetarian'),
            subtitle: getSubTitle(context, 'Only include vegetarian meals.'),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) => onChange(ref, Filter.vegan, isChecked),
            title: getTitle(context, 'Vegan'),
            subtitle: getSubTitle(context, 'Only include vegan meals.'),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
