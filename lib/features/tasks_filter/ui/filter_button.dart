import 'package:flutter/material.dart';
import 'package:ios/features/tasks_filter/ui/fillter_bottomsheet.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showTopDownDialog(context),
      icon: const Icon(Icons.filter_list),
      tooltip: 'Filter tasks',
    );
  }

  void showTopDownDialog(BuildContext context) => showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context).dialogLabel,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (
          BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation,
        ) =>
            const FilterBottomSheet(),
        transitionBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(
            Tween<Offset>(
              begin: const Offset(0, -1),
              end: const Offset(0, -0.5),
            ),
          ),
          child: child,
        ),
      );
}
