import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProjectSearchTextField extends StatelessWidget {
  const ProjectSearchTextField({
    required TextEditingController controller,
    required void Function(String) onChanged,
    required void Function() onClearPressed,
    super.key,
  })  : _searchController = controller,
        _onSearchChanged = onChanged,
        _onClearPressed = onClearPressed;

  final TextEditingController _searchController;
  final void Function(String) _onSearchChanged;
  final void Function() _onClearPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.lowValue1),
      child: TextField(
        style: context.textTheme().bodyMedium,
        controller: _searchController,
        cursorColor: ProjectColors.cobaltBlue,
        decoration: InputDecoration(
          hintText: ProjectStrings.tfHintText,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                  ),
                  onPressed: _onClearPressed,
                )
              : null,
        ),
        onChanged: _onSearchChanged,
      ),
    );
  }
}
