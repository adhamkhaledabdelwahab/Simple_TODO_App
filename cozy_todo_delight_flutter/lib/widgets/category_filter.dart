import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../i18n/i18n.dart';
import '../constants/task_constants.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer2<TaskProvider, I18n>(
        builder: (context, taskProvider, i18n, _) {
          final selectedCategory = taskProvider.currentCategory;
          final categories = TaskCategory.values;

          return Row(
            children: categories.map((category) {
              final isSelected = category == selectedCategory;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: FilterChip(
                  label: Text(i18n.get('categories.${category.name.toLowerCase()}')),
                  selected: isSelected,
                  onSelected: (bool selected) {
                    taskProvider.setCategory(category);
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
