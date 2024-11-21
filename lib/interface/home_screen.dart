import 'dart:convert';

import 'package:events_app/interface/widgets/calendar_dialog.dart';
import 'package:events_app/interface/widgets/event_card.dart';
import 'package:events_app/interface/widgets/filter_modal.dart';
import 'package:events_app/providers/json_data_provider.dart';
import 'package:events_app/providers/router_provider.dart';
import 'package:events_app/repositories/event_repository/models/event.dart';

import 'package:events_app/repositories/event_repository/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:nx_ui/nx_ui.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

// List<Event> globalEvents = [];

// Future<void> loadJsonData() async {
//   final jsonString = await rootBundle.loadString('assets/events.json');
//   final jsonData = json.decode(jsonString);
//   globalEvents = List<Event>.from(jsonData.map((e) => Event.fromJson(e)).toList());
// }

// Future<void> loadData() async {
//   await loadJsonData();
// }

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // loadData();
  }

  Future<void> showCalendar(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CalendarDialog();
      },
    );
  }

  void _showFilterModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: FilterModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(locationProvider);
    final startDate = ref.watch(startDateProvider);
    final endDate = ref.watch(endDateProvider);
    return NxBasicScreen(
      title: 'Home Screen',
      rightButtons: [
        IconButton(
          onPressed: () => _showFilterModalBottomSheet(context),
          icon: const Icon(Icons.filter_list),
        ),
      ],
      leftButton: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(
          Icons.more_vert,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NxSearchTextField(
              hintText: "Search event...",
              onChanged: (query) {
                ref.read(locationProvider.notifier).update((_) => query);
                ref.refresh(eventsFromJsonProvider);
              },
              fillColor: MaterialStatePropertyAll<Color>(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Selected Date Range:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    child: Text(DateFormat('dd-MM-yyy').format(startDate)),
                    onPressed: () async {
                      await showCalendar(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    child: Text(DateFormat('dd-MM-yyy').format(endDate)),
                    onPressed: () async {
                      await showCalendar(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  "Events in ${query ?? ""}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const EventsGrid(),
          ],
        ),
      ),
    );
  }
}

class EventsGrid extends ConsumerWidget {
  const EventsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsInfo =
        // ref.watch(eventsFromJsonProvider);
        ref.watch(eventsFromJsonProvider);
    return Expanded(
      child: Center(
        child: eventsInfo.when(
          data: (data) {
            if (data.results.isEmpty) {
              return NxEmptyScreen(
                context: context,
                information: const Text('No data'),
              );
            }
            final sortedEvents = List<Event>.from(data.results);
            sortedEvents.sort((a, b) => a.start.compareTo(b.start));
            return ListView.builder(
              itemCount: data.results.length,
              itemBuilder: (BuildContext context, int index) {
                return EventCard<Event>(
                  event: sortedEvents[index],
                  onTap: () {
                    context.push(Routes.eventDetail, extra: sortedEvents[index]);
                  },
                );
              },
            );
            // return data.fold((success) {
            //   final sortedEvents = List<Event>.from(success.results);
            //   sortedEvents.sort((a, b) => a.start.compareTo(b.start));
            //   return ListView.builder(
            //     itemCount: sortedEvents.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return EventCard<Event>(
            //         event: sortedEvents[index],
            //         onTap: () {
            //           context.push(Routes.eventDetail, extra: sortedEvents[index]);
            //         },
            //       );
            //     },
            //   );
            // }, (failure) {
            //   return NxEmptyScreen(
            //     context: context,
            //     information: const Text('No data'),
            //   );
            // });
          },
          error: (e, s) => Text(
            e.toString(),
          ),
          loading: CircularProgressIndicator.new,
        ),
      ),
    );
  }
}
