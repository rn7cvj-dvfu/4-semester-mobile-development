import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';

class EditCategoryDialog extends ConsumerStatefulWidget {
  final String categoryId;
  final String initialCategoryName;

  final _formKey = GlobalKey<FormState>();

  EditCategoryDialog({
    super.key,
    required this.categoryId,
    required this.initialCategoryName,
  });

  @override
  ConsumerState<EditCategoryDialog> createState() => _EditCategoryDialogState();
}

class _EditCategoryDialogState extends ConsumerState<EditCategoryDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialCategoryName);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ref.watch(ProviderBloc.editCategory);

    return AlertDialog(
      title: Text(
        t.categories.editCategory,
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Form(
          key: widget._formKey,
          child: BlocBuilder<EditCategoryBloc, EditCategoryState>(
            bloc: bloc,
            builder: (context, state) => TextFormField(
              controller: _controller,
              maxLength: 20,
              enabled: state.maybeMap(
                waiting: (_) => true,
                error: (_) => true,
                orElse: () => false,
              ),
              decoration: InputDecoration(
                hintText: t.categories.categoryName,
                errorText: state.maybeMap(
                  error: (_) => t.categories.categoryNameExists,
                  orElse: () => null,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return t.categories.categoryNameEmpty;
                }
                return null;
              },
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(t.common.cancel),
        ),
        TextButton(
          onPressed: () async {
            if (!widget._formKey.currentState!.validate()) {
              return;
            }

            final isValid = await bloc.validateCategory(_controller.text);

            if (isValid) {
              await bloc.editCategory(widget.categoryId, _controller.text);
            }

            if (isValid && context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: Text(t.common.apply),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


// class EditCategoryDialog extends HookConsumerWidget {
//   final TextEditingController _controller = TextEditingController();
//   final String categoryId;
//   final String initialCategoryName;

//   EditCategoryDialog({
//     super.key,
//     required this.categoryId,
//     required this.initialCategoryName,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final bloc = ref.watch(ProviderBloc.editCategory);

//     return AlertDialog(
//       title: Text(
//         t.categories.editCategory,
//       ),
//       insetPadding: const EdgeInsets.symmetric(horizontal: 12),
//       content: SizedBox(
//         width: MediaQuery.sizeOf(context).width,
//         child: Form(
//           key: _formKey,
//           child: BlocBuilder<EditCategoryBloc, EditCategoryState>(
//             bloc: bloc,
//             builder: (context, state) {
//               state.maybeMap(
//                 waiting: (data) => _controller.text = data.categoryName,
//                 orElse: () {},
//               );

//               return TextFormField(
//                 controller: _controller,
//                 maxLength: 20,
//                 enabled: state.maybeMap(
//                   waiting: (_) => true,
//                   error: (_) => true,
//                   orElse: () => false,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: t.categories.categoryName,
//                   errorText: state.maybeMap(
//                     error: (_) => t.categories.categoryNameExists,
//                     orElse: () => null,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return t.categories.categoryNameEmpty;
//                   }
//                   return null;
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text(t.common.cancel),
//         ),
//         TextButton(
//           onPressed: () async {
//             if (!_formKey.currentState!.validate()) {
//               return;
//             }
//           },
//           child: Text(t.common.apply),
//         ),
//       ],
//     );
//   }
// }
