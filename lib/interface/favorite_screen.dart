import 'package:events_app/interface/widgets/event_card.dart';
import 'package:events_app/providers/router_provider.dart';
import 'package:events_app/repositories/event_repository/models/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:nx_ui/widgets/nx_empty_screen.dart';
import 'package:events_app/repositories/event_repository/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NxBasicScreen(
      title: 'Favorite events',
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  "Favorite events",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FavoriteEventsGrid(),
          ],
        ),
      ),
    );
  }
}

class FavoriteEventsGrid extends ConsumerWidget {
  const FavoriteEventsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteEvents = ref.watch(favoriteEventsProvider);
    return Expanded(
      child: Center(
        child: favoriteEvents.when(
          data: (data) {
            if (data.isEmpty) {
              return NxEmptyScreen(
                context: context,
                information: const Text('No favorite events'),
              );
            }
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: EventCard<Favorite?>(
                    event: data[index],
                    onTap: () {
                      context.push(Routes.eventDetail, extra: data[index]);
                    },
                  ),
                );
              },
            );
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
