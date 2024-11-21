import 'package:events_app/providers/router_provider.dart';
import 'package:events_app/repositories/event_repository/provider.dart';
import 'package:events_app/repositories/geocode_repository/provider.dart';
import 'package:events_app/utils/enum_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:nx_ui/widgets/nx_background_card.dart';
import 'package:nx_ui/widgets/nx_background_layer.dart';

class EventDetailScreen extends ConsumerWidget {
  const EventDetailScreen({
    required this.event,
    super.key,
  });

  final dynamic event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = ref.read(eventRepositoryProvider).convertToTimeZone(
          event.start,
          event.timezone ?? "",
          format: 'EEEE, MMMM d',
        );

    final endDate = ref.read(eventRepositoryProvider).convertToTimeZone(
          event.end,
          event.timezone ?? "",
          format: 'EEEE, MMMM d',
        );

    final time = ref.read(eventRepositoryProvider).convertToTimeZone(
          event.start,
          event.timezone ?? "",
          format: 'h:mm a',
        );

    final address = ref.watch(reverseGeocodeProvider(event.location));
    return NxBasicScreen(
      appBarBackgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      title: "",
      body: Center(
        child: Stack(
          children: [
            NxBackgroundLayer(
              fromAssets: false,
              imageShift: 150,
              imagePath: EventImages.getImageUrl(event.category ?? ''),
            ),
            Positioned(
              bottom: 0,
              child: NxBackgroundCard(
                height: 0.55,
                elevation: 20,
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            const SizedBox(width: 10),
                            Expanded(
                              child: startDate == endDate
                                  ? Text(
                                      startDate,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    )
                                  : Text(
                                      startDate + ' - ' + endDate,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            const Icon(Icons.timer_outlined),
                            const SizedBox(width: 10),
                            Text(
                              "START: " + time,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: address.when(
                          data: (data) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on_outlined),
                                const SizedBox(width: 10),
                                if (data != null)
                                  Expanded(
                                    child: Wrap(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${data.name} ',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                        Text(
                                          '${data.street} ',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                        Text(
                                          '${data.locality} ',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                        Text(
                                          '${data.postalCode} ',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                        Text(
                                          '${data.country} ',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  Text(
                                    event.cityName ?? '',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                              ],
                            );
                          },
                          error: (error, stackTrace) => Text(
                            error.toString(),
                          ),
                          loading: () => const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
