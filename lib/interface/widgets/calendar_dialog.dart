import 'package:events_app/repositories/event_repository/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nx_calendar/nx_calendar.dart';

class CalendarDialog extends ConsumerWidget {
  const CalendarDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = ref.watch(startDateProvider);
    final endDate = ref.watch(endDateProvider);

    return Dialog(
      child: SizedBox(
        height: 500,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              AppCalendar(
                rangeSelect: true,
                currentDate: DateTime.now(),
                rangeHighlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                rangeStart: startDate,
                rangeEnd: endDate,
                onSelected: (DateTime rangeFrom, DateTime rangeTo) {
                  debugPrint(
                    'CPS: onSelected: { from: $rangeFrom, to: $rangeTo }',
                  );
                  // selectedDates.value = [];
                  // enabled.value = false;

                  // from.value = rangeFrom;
                  // to.value = rangeTo;

                  ref.read(startDateProvider.notifier).update((_) => rangeFrom);
                  ref.read(endDateProvider.notifier).update((_) => rangeTo);

                  // selectedDates.value = result;
                },
                onClear: () {
                  // selectedDates.value = [];
                  ref.read(startDateProvider.notifier).update((_) => DateTime.now());
                  ref.read(endDateProvider.notifier).update((_) => DateTime.now());
                },
                clearText: 'clear',
              ),
              FilledButton(
                onPressed: () {
                  ref.refresh(eventsFromJsonProvider);
                  context.pop();
                },
                child: Text("Save"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
