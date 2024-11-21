# events_app

Process of creating an app from template and adding packages along the way.

App and packages are compatible with Material3.
Instructions for adding every package I mention can be found in README.md file in each package's repository on Github https://github.com/sequrify-io

### Screen right after creation from template

<img src="images/screen_from_template.png" alt="panel" width="200"/>

If we want to add sign up and sign in process, we can easily do so by using nx_firebase_auth package, that uses Firebase UI Auth.

### App screens after adding nx_firebase_auth package

<p>
<img src="images/sign_in.png" alt="panel" width="200"/>
<img src="images/register.png" alt="panel" width="200"/>
<img src="images/forgotten_password.png" alt="panel" width="200"/>
<img src="images/sign_out.png" alt="panel" width="200"/>
</p>

### App screen after adding nx_main_screen package

<img src="images/main_screen.png" alt="panel" width="200"/>

nx_main_screen package provided me with main screen reusable widget that comes with navigation bar and navigation state provider for managing navigation between tabs, when coming from different views. I also get nx_basic_screen widget which is a reusable widget for screens inside tabs.

Now I want to add some nx_ui widgets like drawer, buttons, cards. I import nx_ui package to use pre-made components.

### App screen after adding nx_ui package

<img src="images/drawer.png" alt="panel" width="200"/>

Now I can integrate nx_sequrify package and use Sequrify button inside drawer, to let users know that the app is monitored by Sequrify.

### App screen after adding nx_sequrify package

<img src="images/drawer_sequrify.png" alt="panel" width="200"/>

Now I want to integrate API into my app in order to fetch events in my area. For this I'm using Retrofit, based on example provided in nx_retrofit package. I import nx_retrofit package to project, which automatically provides me with Retrofit library. I'm using PredictHG api.

### Screen after integrating retrofit based on example in nx_retrofit package

<img src="images/api.png" alt="panel" width="200"/>

Here I fetched events that are happening in Poznań during the nearest weekend.

I want to place my response data inside list view.
I can use widgets from nx_ui package. I'm also integrating nx_image_picker package to use image picker.

<p>
<img src="images/no_data.png" alt="panel" width="200"/>
<img src="images/data.png" alt="panel" width="200"/>
</p>

I want to add search button from nx_ui, to let user find events happening during nearest weekend, based on the provided location.

### App screen after adding search bar

<p>
<img src="images/search_poznan.png" alt="panel" width="200"/>
<img src="images/search_chicago.png" alt="panel" width="200"/>
</p>

Now I'll integrate nx_calendar package to be able to select range of dates between which I want to search for events.

### App screen after integrating nx_calendar package

<p>
<img src="images/home_picked_dates.png" alt="panel" width="200"/>
<img src="images/calendar.png" alt="panel" width="200"/>
<img src="images/events_tokyo.png" alt="panel" width="200"/>
</p>

### UI design change

<p>
<img src="images/warsaw_events.png" alt="panel" width="200"/>
<img src="images/details.png" alt="panel" width="200"/>
<img src="images/details2.png" alt="panel" width="200"/>
</p>

Now I'll add filter modal. For this I'll use chips from nx_tab_bar package.

<img src="images/performing-arts.png" alt="panel" width="200"/>
<img src="images/performing_arts_tokyo.png" alt="panel" width="200"/>

<img src="images/concerts.png" alt="panel" width="200"/>
<img src="images/concerts_berlin.png" alt="panel" width="200"/>

### App screen after integrating nx_settings package

<p>
<img src="images/settings_light.png" alt="panel" width="200"/>
<img src="images/settings_dark.png" alt="panel" width="200"/>
</p>

### App screen after integrating nx_profile package

<p>
<img src="images/profile.png" alt="panel" width="200"/>
<img src="images/edit_profile.png" alt="panel" width="200"/>
</p>

Adding events to favorite:

<p>
<img src="images/events_unchecked.png" alt="panel" width="200"/>
<img src="images/favorites_checked.png" alt="panel" width="200"/>
<img src="images/favorite_list.png" alt="panel" width="200"/>
</p>

### App screens with different color pallette

Template and packages are compatible with color system that comes with Material3.
App UI is automatically adjusted to the used color palette:

<p>
<img src="images/color1_home.png" alt="panel" width="200"/>
<img src="images/color1_calendar.png" alt="panel" width="200"/>
<img src="images/color1_filter.png" alt="panel" width="200"/>

<img src="images/color2_home.png" alt="panel" width="200"/>
<img src="images/color2_calendar.png" alt="panel" width="200"/>
<img src="images/color2_filter.png" alt="panel" width="200"/>

<img src="images/color3_home.png" alt="panel" width="200"/>
<img src="images/color3_calendar.png" alt="panel" width="200"/>
<img src="images/color3_filter.png" alt="panel" width="200"/>
</p>
