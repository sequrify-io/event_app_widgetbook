extension EnumToString on Enum {
  String get value => name.toString();
}

enum EventCategory {
  schoolHolidays,
  publicHolidays,
  observances,
  politics,
  conferences,
  expos,
  concerts,
  festivals,
  performingArts,
  sports,
  community,
  daylightSavings,
  airportDelays,
  severeWeather,
  disasters,
  terror,
  healthWarnings,
  academic,
}

class EventImages {
  static Map<String, EventCategory> categoryFromString = {
    'school-holidays': EventCategory.schoolHolidays,
    'public-holidays': EventCategory.publicHolidays,
    'observances': EventCategory.observances,
    'politics': EventCategory.politics,
    'conferences': EventCategory.conferences,
    'expos': EventCategory.expos,
    'concerts': EventCategory.concerts,
    'festivals': EventCategory.festivals,
    'performing-arts': EventCategory.performingArts,
    'sports': EventCategory.sports,
    'community': EventCategory.community,
    'daylight-savings': EventCategory.daylightSavings,
    'airport-delays': EventCategory.airportDelays,
    'severe-weather': EventCategory.severeWeather,
    'disasters': EventCategory.disasters,
    'terror': EventCategory.terror,
    'health-warnings': EventCategory.healthWarnings,
    'academic': EventCategory.academic,
  };

  static Map<EventCategory, String> stringFromCategory = {
    EventCategory.schoolHolidays: 'school-holidays',
    EventCategory.publicHolidays: 'public-holidays',
    EventCategory.observances: 'observances',
    EventCategory.politics: 'politics',
    EventCategory.conferences: 'conferences',
    EventCategory.expos: 'expos',
    EventCategory.concerts: 'concerts',
    EventCategory.festivals: 'festivals',
    EventCategory.performingArts: 'performing-arts',
    EventCategory.sports: 'sports',
    EventCategory.community: 'community',
    EventCategory.daylightSavings: 'daylight-savings',
    EventCategory.airportDelays: 'airport-delays',
    EventCategory.severeWeather: 'severe-weather',
    EventCategory.disasters: 'disasters',
    EventCategory.terror: 'terror',
    EventCategory.healthWarnings: 'health-warnings',
    EventCategory.academic: 'academic',
  };

  static final Map<EventCategory, String> _imageUrls = {
    EventCategory.schoolHolidays: 'https://images.pexels.com/photos/939702/pexels-photo-939702.jpeg',
    EventCategory.publicHolidays: 'https://images.pexels.com/photos/3930883/pexels-photo-3930883.jpeg',
    EventCategory.observances: 'https://images.pexels.com/photos/17795746/pexels-photo-17795746/free-photo-of-znane-miejsce-podroz-podrozowac-miejski.jpeg',
    EventCategory.politics: 'https://images.pexels.com/photos/12541596/pexels-photo-12541596.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.conferences: 'https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.expos: 'https://st4.depositphotos.com/2712843/24007/i/600/depositphotos_240071564-stock-photo-abstract-blurred-photo-financial-exhibition.jpg',
    EventCategory.concerts: 'https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.festivals: 'https://images.pexels.com/photos/1540338/pexels-photo-1540338.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.performingArts: 'https://images.pexels.com/photos/690598/pexels-photo-690598.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.sports: 'https://images.pexels.com/photos/248547/pexels-photo-248547.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.community: 'https://images.pexels.com/photos/325521/pexels-photo-325521.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.daylightSavings: 'https://images.pexels.com/photos/2914796/pexels-photo-2914796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.airportDelays: 'https://images.pexels.com/photos/912050/pexels-photo-912050.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.severeWeather: 'https://images.pexels.com/photos/3343581/pexels-photo-3343581.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.disasters: 'https://images.pexels.com/photos/942560/pexels-photo-942560.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.terror: 'https://images.pexels.com/photos/4874503/pexels-photo-4874503.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.healthWarnings: 'https://images.pexels.com/photos/5436336/pexels-photo-5436336.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    EventCategory.academic: 'https://images.pexels.com/photos/8199659/pexels-photo-8199659.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  };

  static String getImageUrl(String category) {
    return _imageUrls[getEventCategory(category)] ?? 'https://images.pexels.com/photos/2247678/pexels-photo-2247678.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
  }

  static EventCategory? getEventCategory(String category) {
    return EventImages.categoryFromString[category];
  }
}
