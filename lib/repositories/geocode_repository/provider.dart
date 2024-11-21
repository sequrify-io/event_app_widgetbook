import 'package:events_app/repositories/geocode_repository/models/address.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

final reverseGeocodeProvider = FutureProvider.autoDispose.family<Address?, List<num>?>((ref, location) async {
  final placemark = location != null ? await placemarkFromCoordinates(location[1].toDouble(), location[0].toDouble()) : null;
  final address = placemark != null
      ? Address(
          name: placemark[0].name,
          street: placemark[0].street,
          isoCountryCode: placemark[0].isoCountryCode,
          country: placemark[0].country,
          postalCode: placemark[0].postalCode,
          administrativeArea: placemark[0].administrativeArea,
          subAdministrativeArea: placemark[0].subAdministrativeArea,
          locality: placemark[0].locality,
          sublocality: placemark[0].subLocality,
          thoroughfare: placemark[0].thoroughfare,
          subthoroughfare: placemark[0].subThoroughfare,
        )
      : null;
  return address;
});
