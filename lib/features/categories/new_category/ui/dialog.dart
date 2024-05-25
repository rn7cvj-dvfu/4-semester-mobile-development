import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';

final _formKey = GlobalKey<FormState>();

class NewCategoryDialog extends HookConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  NewCategoryDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.newCategory);

    useEffect(() {
      bloc.reset();
      return null;
    });

    return AlertDialog(
      title: Text(
        t.categories.newCategory,
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Form(
          key: _formKey,
          child: BlocBuilder<NewCategoryBloc, NewCategoryState>(
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
            if (!_formKey.currentState!.validate()) {
              return;
            }

            final isValid = await bloc.validateCategory(_controller.text);

            if (isValid) {
              await bloc.createCategory(_controller.text);
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
}
