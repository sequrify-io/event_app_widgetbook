import 'package:events_app/repositories/event_repository/models/favorite.dart';
import 'package:events_app/repositories/event_repository/provider.dart';
import 'package:events_app/utils/enum_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventCard<T> extends ConsumerStatefulWidget {
  EventCard({
    required this.event,
    required this.onTap,
    super.key,
  });
  T event;
  final void Function() onTap;

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends ConsumerState<EventCard> {
  @override
  Widget build(BuildContext context) {
    final date = widget.event.start != null && widget.event.timezone != null
        ? ref.read(eventRepositoryProvider).convertToTimeZone(
              widget.event.start,
              widget.event.timezone,
              format: 'EEE, MMM dd, hh:mm a',
            )
        : '';

    return SizedBox(
      height: 150,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    EventImages.getImageUrl(widget.event.category ?? ''),
                    fit: BoxFit.cover,
                    width: 120,
                    height: 150,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4, top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.title,
                        style: widget.event.title.length > 50 ? Theme.of(context).textTheme.titleSmall : Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          date,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: ref.read(eventRepositoryProvider).checkIfFavorite(widget.event.id!) == true
                      ? () {
                          ref
                            ..watch(deleteFavoriteProvider(widget.event.id!))
                            ..refresh(favoriteEventsProvider)
                            ..refresh(eventsFromJsonProvider);
                        }
                      : () {
                          final favorite = Favorite(
                            id: widget.event.id!,
                            title: widget.event.title,
                            start: widget.event.start,
                            end: widget.event.end,
                            cityName: widget.event.cityName,
                            location: widget.event.location,
                            country: widget.event.country,
                            category: widget.event.category,
                            timezone: widget.event.timezone,
                            isFavorite: true,
                          );
                          ref.watch(saveFavoriteProvider(favorite));
                        },
                  icon: ref.read(eventRepositoryProvider).checkIfFavorite(widget.event.id!) == true
                      ? const Icon(
                          Icons.favorite,
                          size: 32,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          size: 28,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
