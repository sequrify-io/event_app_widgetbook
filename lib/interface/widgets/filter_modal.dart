import 'package:events_app/config.dart';
import 'package:events_app/repositories/event_repository/provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nx_tab_bar/nx_tab_bar.dart';

class FilterModal extends ConsumerWidget {
  const FilterModal({super.key});

  String? checkIfSingleValueSelected(String value) {
    if (value == '') return 'Error message';
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var val = ref.watch(categoryProvider);
    return Column(
      // alignment: WrapAlignment.center,
      children: [
        Text(
          "Filter",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).orientation == Orientation.landscape ? 0 : 10,
        // ),
        const Divider(),
        // SizedBox(
        //   height: MediaQuery.of(context).orientation == Orientation.landscape ? 0 : 10,
        // ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(
              "Categories",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.centerLeft,
              child: NxSingleSelectChipsFormField(
                initialValue: val ?? '',
                validator: (value) => checkIfSingleValueSelected(value!),
                onSaved: (value) => val = value,
                chipsList: Config.categoryList,
                onSelect: (FormFieldState<String> state, String listElement, bool selected) {
                  state.didChange(selected ? listElement : '');
                  selected ? val = listElement : val = null;
                },
              ),
            ),
          ),
        ),
        const Spacer(),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 30),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  ref.read(categoryProvider.notifier).update((_) => null);
                  ref.refresh(eventsFromJsonProvider);
                  context.pop();
                },
                child: Text("Reset"),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  ref.read(categoryProvider.notifier).update((_) => val);
                  ref.refresh(eventsFromJsonProvider);
                  context.pop();
                },
                child: Text("Apply"),
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
