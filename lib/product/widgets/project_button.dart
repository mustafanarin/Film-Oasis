import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProjectButton extends StatelessWidget {
  const ProjectButton({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.03),
      child: ElevatedButton(
        onPressed: onPressed, 
        child: Text(ProjectStrings.buttonName ,
        style: context.textTheme().bodySmall?.copyWith(
          color: ProjectColors.grey,),),),);
  }
}