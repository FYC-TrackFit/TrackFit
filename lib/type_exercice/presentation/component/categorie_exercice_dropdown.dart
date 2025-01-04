import 'package:flutter/material.dart';
import 'package:flutter_project_app/categorie_exercice/data/dto/categorie_exercice_dto.dart';

class CategorieExerciceDropdown extends StatefulWidget {
  final List<CategorieExerciceDTO> categories;
  final ValueChanged<CategorieExerciceDTO> onCategorySelected;

  const CategorieExerciceDropdown({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  _CategorieExerciceDropdownState createState() =>
      _CategorieExerciceDropdownState();
}

class _CategorieExerciceDropdownState extends State<CategorieExerciceDropdown> {
  CategorieExerciceDTO? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CategorieExerciceDTO>(
      value: _selectedCategory,
      hint: const Text("Sélectionnez une catégorie"),
      isExpanded: true,
      items: widget.categories.map((category) {
        return DropdownMenuItem<CategorieExerciceDTO>(
          value: category,
          child: Text(category.libelle),
        );
      }).toList(),
      onChanged: (CategorieExerciceDTO? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedCategory = newValue;
          });
          widget.onCategorySelected(newValue);
        }
      },
    );
  }
}
