import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @commonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get commonSkip;

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get commonConfirm;

  /// No description provided for @commonConfirmSelection.
  ///
  /// In en, this message translates to:
  /// **'Confirm Selection'**
  String get commonConfirmSelection;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done!'**
  String get commonDone;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonPost.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get commonPost;

  /// No description provided for @commonFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get commonFollow;

  /// No description provided for @commonFollowing.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get commonFollowing;

  /// No description provided for @commonManage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get commonManage;

  /// No description provided for @commonShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get commonShare;

  /// No description provided for @commonReadMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get commonReadMore;

  /// No description provided for @commonViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get commonViewAll;

  /// No description provided for @commonSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get commonSeeAll;

  /// No description provided for @commonLoadMoreReviews.
  ///
  /// In en, this message translates to:
  /// **'Load More Reviews'**
  String get commonLoadMoreReviews;

  /// No description provided for @commonBackToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get commonBackToHome;

  /// No description provided for @commonOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get commonOr;

  /// No description provided for @commonBookNow.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get commonBookNow;

  /// No description provided for @commonSoldOut.
  ///
  /// In en, this message translates to:
  /// **'Sold Out'**
  String get commonSoldOut;

  /// No description provided for @commonWaitlist.
  ///
  /// In en, this message translates to:
  /// **'WAITLIST'**
  String get commonWaitlist;

  /// No description provided for @commonFromPrice.
  ///
  /// In en, this message translates to:
  /// **'From \${price}'**
  String commonFromPrice(String price);

  /// No description provided for @onboardingAppName.
  ///
  /// In en, this message translates to:
  /// **'EveTick'**
  String get onboardingAppName;

  /// No description provided for @onboardingSlide1Title.
  ///
  /// In en, this message translates to:
  /// **'Discover Local \n Events'**
  String get onboardingSlide1Title;

  /// No description provided for @onboardingSlide1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Find and book tickets for concerts, cinema, and more happening right in your city'**
  String get onboardingSlide1Subtitle;

  /// No description provided for @onboardingSlide2Title.
  ///
  /// In en, this message translates to:
  /// **'Seamless Booking'**
  String get onboardingSlide2Title;

  /// No description provided for @onboardingSlide2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Secure your spot in seconds with our fast and easy checkout process'**
  String get onboardingSlide2Subtitle;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover Events\nYou '**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeTitleRemain.
  ///
  /// In en, this message translates to:
  /// **'Love'**
  String get onboardingWelcomeTitleRemain;

  /// No description provided for @onboardingWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join the community of event seekers'**
  String get onboardingWelcomeSubtitle;

  /// No description provided for @locationSetLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Where are You?'**
  String get locationSetLocationTitle;

  /// No description provided for @onboardingLocationPermissionNotice.
  ///
  /// In en, this message translates to:
  /// **'To show you events near you, we need your location permission.'**
  String get onboardingLocationPermissionNotice;

  /// No description provided for @locationSelectLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get locationSelectLocationTitle;

  /// No description provided for @locationSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search for city, street, or venue'**
  String get locationSearchPlaceholder;

  /// No description provided for @locationUseCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Use Current Location'**
  String get locationUseCurrentLocation;

  /// No description provided for @locationCurrentCity.
  ///
  /// In en, this message translates to:
  /// **'London, United Kingdom'**
  String get locationCurrentCity;

  /// No description provided for @locationPopularCities.
  ///
  /// In en, this message translates to:
  /// **'Popular Cities'**
  String get locationPopularCities;

  /// No description provided for @locationSelectGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Select Governorate'**
  String get locationSelectGovernorate;

  /// No description provided for @locationChooseGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Choose Governorate'**
  String get locationChooseGovernorate;

  /// No description provided for @locationNearbyLocations.
  ///
  /// In en, this message translates to:
  /// **'Nearby Locations'**
  String get locationNearbyLocations;

  /// No description provided for @locationSelectManually.
  ///
  /// In en, this message translates to:
  /// **'Select Manually'**
  String get locationSelectManually;

  /// No description provided for @locationDistanceAway.
  ///
  /// In en, this message translates to:
  /// **'{distance} miles away'**
  String locationDistanceAway(String distance);

  /// No description provided for @locationRecentSearch.
  ///
  /// In en, this message translates to:
  /// **'Recent Search, {city}'**
  String locationRecentSearch(String city);

  /// No description provided for @locationCitiesLondon.
  ///
  /// In en, this message translates to:
  /// **'London'**
  String get locationCitiesLondon;

  /// No description provided for @locationCitiesNewYork.
  ///
  /// In en, this message translates to:
  /// **'New York'**
  String get locationCitiesNewYork;

  /// No description provided for @locationCitiesSanFrancisco.
  ///
  /// In en, this message translates to:
  /// **'San Francisco'**
  String get locationCitiesSanFrancisco;

  /// No description provided for @locationCitiesDubai.
  ///
  /// In en, this message translates to:
  /// **'Dubai'**
  String get locationCitiesDubai;

  /// No description provided for @locationVenueWestminster.
  ///
  /// In en, this message translates to:
  /// **'Westminster, London'**
  String get locationVenueWestminster;

  /// No description provided for @locationVenueMadisonSquareGarden.
  ///
  /// In en, this message translates to:
  /// **'Madison Square Garden'**
  String get locationVenueMadisonSquareGarden;

  /// No description provided for @authSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authSignIn;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get authSignUp;

  /// No description provided for @authContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueWithGoogle;

  /// No description provided for @authContinueWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get authContinueWithFacebook;

  /// No description provided for @authContinueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get authContinueAsGuest;

  /// No description provided for @authNoAccountPrompt.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get authNoAccountPrompt;

  /// No description provided for @authNoAccountPromptRemain.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get authNoAccountPromptRemain;

  /// No description provided for @authHasAccountPrompt.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get authHasAccountPrompt;

  /// No description provided for @authHasAccountPromptRemain.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authHasAccountPromptRemain;

  /// No description provided for @authEmailAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get authEmailAddressLabel;

  /// No description provided for @authEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get authEmailPlaceholder;

  /// No description provided for @authEmailPlaceholderContinue.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to continue'**
  String get authEmailPlaceholderContinue;

  /// No description provided for @authFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get authFullNameLabel;

  /// No description provided for @authFullNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter your Name'**
  String get authFullNamePlaceholder;

  /// No description provided for @authPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordLabel;

  /// No description provided for @authPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get authPasswordPlaceholder;

  /// No description provided for @authVerifyTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get authVerifyTitle;

  /// No description provided for @authVerificationCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get authVerificationCodeLabel;

  /// No description provided for @authVerificationSentNotice.
  ///
  /// In en, this message translates to:
  /// **'Check your email for the code sent to {email}'**
  String authVerificationSentNotice(String email);

  /// No description provided for @authResendCodePrompt.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code? Resend'**
  String get authResendCodePrompt;

  /// No description provided for @authRegistrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Successfully registered to EveTick'**
  String get authRegistrationSuccess;

  /// No description provided for @authStartExploring.
  ///
  /// In en, this message translates to:
  /// **'Start Exploring'**
  String get authStartExploring;

  /// No description provided for @homeSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search for concerts, cinema...'**
  String get homeSearchPlaceholder;

  /// No description provided for @homeSearchSuggestionExample.
  ///
  /// In en, this message translates to:
  /// **'Jazz concerts in London'**
  String get homeSearchSuggestionExample;

  /// No description provided for @homeFiltersAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get homeFiltersAll;

  /// No description provided for @homeFiltersEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get homeFiltersEvents;

  /// No description provided for @homeFiltersTickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get homeFiltersTickets;

  /// No description provided for @homeFiltersConcerts.
  ///
  /// In en, this message translates to:
  /// **'Concerts'**
  String get homeFiltersConcerts;

  /// No description provided for @homeFiltersCinema.
  ///
  /// In en, this message translates to:
  /// **'Cinema'**
  String get homeFiltersCinema;

  /// No description provided for @homeFiltersTrips.
  ///
  /// In en, this message translates to:
  /// **'Trips'**
  String get homeFiltersTrips;

  /// No description provided for @homeFiltersSports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get homeFiltersSports;

  /// No description provided for @homeFiltersWorkshops.
  ///
  /// In en, this message translates to:
  /// **'Workshops'**
  String get homeFiltersWorkshops;

  /// No description provided for @homeFiltersNightlife.
  ///
  /// In en, this message translates to:
  /// **'Nightlife'**
  String get homeFiltersNightlife;

  /// No description provided for @homeFiltersFreeEvents.
  ///
  /// In en, this message translates to:
  /// **'Free Events'**
  String get homeFiltersFreeEvents;

  /// No description provided for @homeSortOptionsTrendingNow.
  ///
  /// In en, this message translates to:
  /// **'Trending Now'**
  String get homeSortOptionsTrendingNow;

  /// No description provided for @homeSortOptionsUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get homeSortOptionsUpcoming;

  /// No description provided for @homeSortOptionsThisWeekend.
  ///
  /// In en, this message translates to:
  /// **'This weekend'**
  String get homeSortOptionsThisWeekend;

  /// No description provided for @homeSortOptionsPriceLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Price: Low to High'**
  String get homeSortOptionsPriceLowToHigh;

  /// No description provided for @homeResultsFound.
  ///
  /// In en, this message translates to:
  /// **'{count} results found'**
  String homeResultsFound(String count);

  /// No description provided for @homeFeaturedEvents.
  ///
  /// In en, this message translates to:
  /// **'Featured Events'**
  String get homeFeaturedEvents;

  /// No description provided for @homePopularEvents.
  ///
  /// In en, this message translates to:
  /// **'Popular Events'**
  String get homePopularEvents;

  /// No description provided for @homeBadgesTopSelling.
  ///
  /// In en, this message translates to:
  /// **'TOP SELLING'**
  String get homeBadgesTopSelling;

  /// No description provided for @homeBadgesBestValue.
  ///
  /// In en, this message translates to:
  /// **'BEST VALUE'**
  String get homeBadgesBestValue;

  /// No description provided for @homeBadgesTrending.
  ///
  /// In en, this message translates to:
  /// **'TRENDING'**
  String get homeBadgesTrending;

  /// No description provided for @homeBadgesHighDemand.
  ///
  /// In en, this message translates to:
  /// **'HIGH DEMAND'**
  String get homeBadgesHighDemand;

  /// No description provided for @homeBadgesBestPrice.
  ///
  /// In en, this message translates to:
  /// **'BEST PRICE'**
  String get homeBadgesBestPrice;

  /// No description provided for @homeBadgesEarlyBird.
  ///
  /// In en, this message translates to:
  /// **'Early Bird'**
  String get homeBadgesEarlyBird;

  /// No description provided for @homeEventPrice.
  ///
  /// In en, this message translates to:
  /// **'\${price}'**
  String homeEventPrice(String price);

  /// No description provided for @searchRecentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get searchRecentSearches;

  /// No description provided for @searchClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get searchClearAll;

  /// No description provided for @searchSortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get searchSortBy;

  /// No description provided for @searchSortOptionsPopularity.
  ///
  /// In en, this message translates to:
  /// **'Popularity'**
  String get searchSortOptionsPopularity;

  /// No description provided for @searchSortOptionsDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get searchSortOptionsDate;

  /// No description provided for @searchSortOptionsDistance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get searchSortOptionsDistance;

  /// No description provided for @searchFilterAndRefine.
  ///
  /// In en, this message translates to:
  /// **'Filter & Refine'**
  String get searchFilterAndRefine;

  /// No description provided for @searchApplyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get searchApplyFilters;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsTimeAgoJustNow.
  ///
  /// In en, this message translates to:
  /// **'{minutes}M AGO'**
  String notificationsTimeAgoJustNow(String minutes);

  /// No description provided for @notificationsTimeAgoHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}H AGO'**
  String notificationsTimeAgoHoursAgo(String hours);

  /// No description provided for @notificationsTimeAgoDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} DAYS AGO'**
  String notificationsTimeAgoDaysAgo(String days);

  /// No description provided for @notificationsTimeAgoYesterday.
  ///
  /// In en, this message translates to:
  /// **'YESTERDAY'**
  String get notificationsTimeAgoYesterday;

  /// No description provided for @notificationsTimeAgoEarlier.
  ///
  /// In en, this message translates to:
  /// **'EARLIER'**
  String get notificationsTimeAgoEarlier;

  /// No description provided for @notificationsHotDealTitle.
  ///
  /// In en, this message translates to:
  /// **'Hot Deal: Summer Fest 2024'**
  String get notificationsHotDealTitle;

  /// No description provided for @notificationsHotDealBody.
  ///
  /// In en, this message translates to:
  /// **'Get 20% off on Early Bird tickets for the biggest summer music festival....'**
  String get notificationsHotDealBody;

  /// No description provided for @notificationsNewEventTitle.
  ///
  /// In en, this message translates to:
  /// **'New Event Near You!'**
  String get notificationsNewEventTitle;

  /// No description provided for @notificationsNewEventBody.
  ///
  /// In en, this message translates to:
  /// **'Techno Night with DJ Spark is happening this Friday at The...'**
  String get notificationsNewEventBody;

  /// No description provided for @notificationsTicketConfirmedTitle.
  ///
  /// In en, this message translates to:
  /// **'Ticket Confirmed'**
  String get notificationsTicketConfirmedTitle;

  /// No description provided for @notificationsTicketConfirmedBody.
  ///
  /// In en, this message translates to:
  /// **'Your booking for \"Jazz Under Stars\" is confirmed. See you there!'**
  String get notificationsTicketConfirmedBody;

  /// No description provided for @notificationsArtistFollowedTitle.
  ///
  /// In en, this message translates to:
  /// **'Artist You Follow'**
  String get notificationsArtistFollowedTitle;

  /// No description provided for @notificationsArtistFollowedBody.
  ///
  /// In en, this message translates to:
  /// **'Coldplay just announced a new world tour dates. Stay tuned for tickets!'**
  String get notificationsArtistFollowedBody;

  /// No description provided for @notificationsProfileUpdatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile Updated'**
  String get notificationsProfileUpdatedTitle;

  /// No description provided for @notificationsProfileUpdatedBody.
  ///
  /// In en, this message translates to:
  /// **'You have successfully updated your payment method.'**
  String get notificationsProfileUpdatedBody;

  /// No description provided for @eventDetailsEventLocation.
  ///
  /// In en, this message translates to:
  /// **'Event Location'**
  String get eventDetailsEventLocation;

  /// No description provided for @eventDetailsVenueExamplesExcelCentre.
  ///
  /// In en, this message translates to:
  /// **'Excel Centre, London'**
  String get eventDetailsVenueExamplesExcelCentre;

  /// No description provided for @eventDetailsVenueExamplesWembleyStadium.
  ///
  /// In en, this message translates to:
  /// **'Wembley Stadium'**
  String get eventDetailsVenueExamplesWembleyStadium;

  /// No description provided for @eventDetailsVenueExamplesGrandEgyptianMuseum.
  ///
  /// In en, this message translates to:
  /// **'Grand Egyptian Museum'**
  String get eventDetailsVenueExamplesGrandEgyptianMuseum;

  /// No description provided for @eventDetailsVenueExamplesTheGrandArena.
  ///
  /// In en, this message translates to:
  /// **'The Grand Arena, Downtown'**
  String get eventDetailsVenueExamplesTheGrandArena;

  /// No description provided for @eventDetailsVenueExamplesSiliconValleyCenter.
  ///
  /// In en, this message translates to:
  /// **'Silicon Valley Center, CA'**
  String get eventDetailsVenueExamplesSiliconValleyCenter;

  /// No description provided for @eventDetailsDescriptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get eventDetailsDescriptionTitle;

  /// No description provided for @eventDetailsDescriptionExample.
  ///
  /// In en, this message translates to:
  /// **'Experience the ultimate summer music festival featuring top global artists, immersive art installations, and a diverse culinary selection. This year\'s lineup includes headliners that will keep you dancing under the stars... Read More'**
  String get eventDetailsDescriptionExample;

  /// No description provided for @eventDetailsDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get eventDetailsDateLabel;

  /// No description provided for @eventDetailsTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get eventDetailsTimeLabel;

  /// No description provided for @eventDetailsPriceFrom.
  ///
  /// In en, this message translates to:
  /// **'From \${price}'**
  String eventDetailsPriceFrom(String price);

  /// No description provided for @eventDetailsPerksVipAccess.
  ///
  /// In en, this message translates to:
  /// **'VIP Access'**
  String get eventDetailsPerksVipAccess;

  /// No description provided for @eventDetailsPerksBackstageLounge.
  ///
  /// In en, this message translates to:
  /// **'Backstage lounge access.'**
  String get eventDetailsPerksBackstageLounge;

  /// No description provided for @eventDetailsPerksComplimentaryDrinks.
  ///
  /// In en, this message translates to:
  /// **'2 Complimentary drink vouchers.'**
  String get eventDetailsPerksComplimentaryDrinks;

  /// No description provided for @eventDetailsPerksPremiumViewing.
  ///
  /// In en, this message translates to:
  /// **'Premium viewing area.'**
  String get eventDetailsPerksPremiumViewing;

  /// No description provided for @eventDetailsPerksMeetAndGreet.
  ///
  /// In en, this message translates to:
  /// **'Meet and Greet with performers.'**
  String get eventDetailsPerksMeetAndGreet;

  /// No description provided for @eventDetailsPerksIncludesVipPerks.
  ///
  /// In en, this message translates to:
  /// **'Includes all VIP perks.'**
  String get eventDetailsPerksIncludesVipPerks;

  /// No description provided for @eventDetailsPerksStandardEntry.
  ///
  /// In en, this message translates to:
  /// **'Includes standard entry.'**
  String get eventDetailsPerksStandardEntry;

  /// No description provided for @eventDetailsPerksLimitedQuantities.
  ///
  /// In en, this message translates to:
  /// **'Limited quantities for our early supporters.'**
  String get eventDetailsPerksLimitedQuantities;

  /// No description provided for @ticketsSelectTicketsTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Tickets'**
  String get ticketsSelectTicketsTitle;

  /// No description provided for @ticketsVenueName.
  ///
  /// In en, this message translates to:
  /// **'Main Arena Hall'**
  String get ticketsVenueName;

  /// No description provided for @ticketsStepIndicator.
  ///
  /// In en, this message translates to:
  /// **'Step {step} OF {total}'**
  String ticketsStepIndicator(String step, String total);

  /// No description provided for @ticketsStepTicketSelection.
  ///
  /// In en, this message translates to:
  /// **'Ticket Selection'**
  String get ticketsStepTicketSelection;

  /// No description provided for @ticketsStepCheckout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get ticketsStepCheckout;

  /// No description provided for @ticketsStepPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get ticketsStepPayment;

  /// No description provided for @ticketsAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get ticketsAvailable;

  /// No description provided for @ticketsReserved.
  ///
  /// In en, this message translates to:
  /// **'Reserved'**
  String get ticketsReserved;

  /// No description provided for @ticketsSelected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get ticketsSelected;

  /// No description provided for @ticketsTicketTypesGeneralAdmission.
  ///
  /// In en, this message translates to:
  /// **'General Admission'**
  String get ticketsTicketTypesGeneralAdmission;

  /// No description provided for @ticketsTicketTypesVipAccess.
  ///
  /// In en, this message translates to:
  /// **'VIP Access'**
  String get ticketsTicketTypesVipAccess;

  /// No description provided for @ticketsTicketTypesBackstagePass.
  ///
  /// In en, this message translates to:
  /// **'Backstage Pass'**
  String get ticketsTicketTypesBackstagePass;

  /// No description provided for @ticketsTicketCountSelected.
  ///
  /// In en, this message translates to:
  /// **'{count} ticket selected'**
  String ticketsTicketCountSelected(String count);

  /// No description provided for @ticketsTotalPrice.
  ///
  /// In en, this message translates to:
  /// **'TOTAL PRICE'**
  String get ticketsTotalPrice;

  /// No description provided for @ticketsPlusServiceFee.
  ///
  /// In en, this message translates to:
  /// **'+ Service fee'**
  String get ticketsPlusServiceFee;

  /// No description provided for @ticketsSelectedSeats.
  ///
  /// In en, this message translates to:
  /// **'Selected Seats'**
  String get ticketsSelectedSeats;

  /// No description provided for @ticketsPricePerTicket.
  ///
  /// In en, this message translates to:
  /// **'Price per ticket'**
  String get ticketsPricePerTicket;

  /// No description provided for @ticketsContinueToCheckout.
  ///
  /// In en, this message translates to:
  /// **'Continue to Checkout'**
  String get ticketsContinueToCheckout;

  /// No description provided for @checkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutTitle;

  /// No description provided for @checkoutBookingSummary.
  ///
  /// In en, this message translates to:
  /// **'Booking Summary'**
  String get checkoutBookingSummary;

  /// No description provided for @checkoutTicketQuantityTypeExample.
  ///
  /// In en, this message translates to:
  /// **'{count}X {ticket_type}'**
  String checkoutTicketQuantityTypeExample(String count, String ticket_type);

  /// No description provided for @checkoutTicketTypeGeneralAdmission.
  ///
  /// In en, this message translates to:
  /// **'GENERAL ADMISSION'**
  String get checkoutTicketTypeGeneralAdmission;

  /// No description provided for @checkoutAttendeeLabel.
  ///
  /// In en, this message translates to:
  /// **'Attendee'**
  String get checkoutAttendeeLabel;

  /// No description provided for @checkoutSeatLabel.
  ///
  /// In en, this message translates to:
  /// **'Seat'**
  String get checkoutSeatLabel;

  /// No description provided for @checkoutCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get checkoutCategoryLabel;

  /// No description provided for @checkoutCardholderNamePlaceholderExample.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Mohamed'**
  String get checkoutCardholderNamePlaceholderExample;

  /// No description provided for @checkoutExpiryDatePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'MM/YY'**
  String get checkoutExpiryDatePlaceholder;

  /// No description provided for @checkoutCvvPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'***'**
  String get checkoutCvvPlaceholder;

  /// No description provided for @checkoutProceedToPayment.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Payment'**
  String get checkoutProceedToPayment;

  /// No description provided for @paymentPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentPaymentMethod;

  /// No description provided for @paymentMethodsCreditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get paymentMethodsCreditCard;

  /// No description provided for @paymentMethodsApplePay.
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get paymentMethodsApplePay;

  /// No description provided for @paymentMethodsPaypal.
  ///
  /// In en, this message translates to:
  /// **'PayPal'**
  String get paymentMethodsPaypal;

  /// No description provided for @paymentCardNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get paymentCardNumberLabel;

  /// No description provided for @paymentCardNumberPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'0000 0000 0000 0000'**
  String get paymentCardNumberPlaceholder;

  /// No description provided for @paymentCardholderNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Cardholder Name'**
  String get paymentCardholderNameLabel;

  /// No description provided for @paymentExpiryDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get paymentExpiryDateLabel;

  /// No description provided for @paymentCvvLabel.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get paymentCvvLabel;

  /// No description provided for @paymentSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get paymentSubtotal;

  /// No description provided for @paymentServiceFee.
  ///
  /// In en, this message translates to:
  /// **'Service Fee'**
  String get paymentServiceFee;

  /// No description provided for @paymentTaxes.
  ///
  /// In en, this message translates to:
  /// **'Taxes'**
  String get paymentTaxes;

  /// No description provided for @paymentTotalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get paymentTotalPrice;

  /// No description provided for @paymentSecurePaymentNotice.
  ///
  /// In en, this message translates to:
  /// **'SECURE SSL ENCRYPTED PAYMENT'**
  String get paymentSecurePaymentNotice;

  /// No description provided for @paymentPayNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get paymentPayNow;

  /// No description provided for @confirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirmationTitle;

  /// No description provided for @confirmationPaymentSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful!'**
  String get confirmationPaymentSuccessful;

  /// No description provided for @confirmationTicketConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Ticket Confirmed'**
  String get confirmationTicketConfirmed;

  /// No description provided for @confirmationOrderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID #{id}'**
  String confirmationOrderId(String id);

  /// No description provided for @confirmationBookingId.
  ///
  /// In en, this message translates to:
  /// **'Booking ID'**
  String get confirmationBookingId;

  /// No description provided for @confirmationTotalPaid.
  ///
  /// In en, this message translates to:
  /// **'Total Paid'**
  String get confirmationTotalPaid;

  /// No description provided for @confirmationViewTicket.
  ///
  /// In en, this message translates to:
  /// **'View Ticket'**
  String get confirmationViewTicket;

  /// No description provided for @confirmationScanAtEntrance.
  ///
  /// In en, this message translates to:
  /// **'SCAN AT ENTRANCE'**
  String get confirmationScanAtEntrance;

  /// No description provided for @confirmationTicketId.
  ///
  /// In en, this message translates to:
  /// **'Ticket ID: #{id}'**
  String confirmationTicketId(String id);

  /// No description provided for @confirmationViewOnMap.
  ///
  /// In en, this message translates to:
  /// **'View on Map'**
  String get confirmationViewOnMap;

  /// No description provided for @profileMyProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get profileMyProfile;

  /// No description provided for @profilePremiumAttendee.
  ///
  /// In en, this message translates to:
  /// **'Premium Attendee'**
  String get profilePremiumAttendee;

  /// No description provided for @profilePremiumMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Premium Member since {year}'**
  String profilePremiumMemberSince(String year);

  /// No description provided for @profilePersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get profilePersonalInfo;

  /// No description provided for @profilePersonalInfoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Email, phone, Address'**
  String get profilePersonalInfoSubtitle;

  /// No description provided for @profileEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEditProfile;

  /// No description provided for @profileFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get profileFullNameLabel;

  /// No description provided for @profileEmailAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get profileEmailAddressLabel;

  /// No description provided for @profilePhoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get profilePhoneNumberLabel;

  /// No description provided for @profilePhysicalAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Physical Address'**
  String get profilePhysicalAddressLabel;

  /// No description provided for @profileAddressExample.
  ///
  /// In en, this message translates to:
  /// **'7 Posta Street, Eldekhila, Alexandria'**
  String get profileAddressExample;

  /// No description provided for @profilePhoneExample.
  ///
  /// In en, this message translates to:
  /// **'+20 127 1734 638'**
  String get profilePhoneExample;

  /// No description provided for @profileAddPhotosOptional.
  ///
  /// In en, this message translates to:
  /// **'Add Photos (optional)'**
  String get profileAddPhotosOptional;

  /// No description provided for @profileUpload.
  ///
  /// In en, this message translates to:
  /// **'UPLOAD'**
  String get profileUpload;

  /// No description provided for @profileAccountSection.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profileAccountSection;

  /// No description provided for @profilePreferencesSection.
  ///
  /// In en, this message translates to:
  /// **'Perferences'**
  String get profilePreferencesSection;

  /// No description provided for @profilePreferencesRowsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profilePreferencesRowsLanguage;

  /// No description provided for @profilePreferencesRowsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get profilePreferencesRowsAppearance;

  /// No description provided for @profilePreferencesRowsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profilePreferencesRowsNotifications;

  /// No description provided for @profileAppearanceValuesDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get profileAppearanceValuesDarkMode;

  /// No description provided for @profileAppearanceValuesLightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get profileAppearanceValuesLightMode;

  /// No description provided for @profileLanguageValueExample.
  ///
  /// In en, this message translates to:
  /// **'English (US)'**
  String get profileLanguageValueExample;

  /// No description provided for @profileTabsMyTickets.
  ///
  /// In en, this message translates to:
  /// **'My Tickets'**
  String get profileTabsMyTickets;

  /// No description provided for @profileTabsFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get profileTabsFavorites;

  /// No description provided for @profileTabsReviewsAndRatings.
  ///
  /// In en, this message translates to:
  /// **'Reviews & Ratings'**
  String get profileTabsReviewsAndRatings;

  /// No description provided for @profileTabsFollowingArtists.
  ///
  /// In en, this message translates to:
  /// **'Following Artists'**
  String get profileTabsFollowingArtists;

  /// No description provided for @profileTabsFollowingOrganizers.
  ///
  /// In en, this message translates to:
  /// **'Following Organizers'**
  String get profileTabsFollowingOrganizers;

  /// No description provided for @profileTicketStatusUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get profileTicketStatusUpcoming;

  /// No description provided for @profileTicketStatusPast.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get profileTicketStatusPast;

  /// No description provided for @profileTicketStatusConfirmed.
  ///
  /// In en, this message translates to:
  /// **'CONFIRMED'**
  String get profileTicketStatusConfirmed;

  /// No description provided for @profileTicketStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'COMPLETED'**
  String get profileTicketStatusCompleted;

  /// No description provided for @profileTicketStatusActive.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get profileTicketStatusActive;

  /// No description provided for @profileSearchOrganizersPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search organizers'**
  String get profileSearchOrganizersPlaceholder;

  /// No description provided for @profileSearchArtistsPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search artists...'**
  String get profileSearchArtistsPlaceholder;

  /// No description provided for @profileOrganizersCount.
  ///
  /// In en, this message translates to:
  /// **'Organizers ({count})'**
  String profileOrganizersCount(String count);

  /// No description provided for @profileFollowersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Followers'**
  String profileFollowersCount(String count);

  /// No description provided for @profileSupportSection.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get profileSupportSection;

  /// No description provided for @profileAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profileAccount;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettings;

  /// No description provided for @profileHelpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get profileHelpCenter;

  /// No description provided for @profileTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get profileTermsOfService;

  /// No description provided for @profileLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get profileLogOut;

  /// No description provided for @myTicketsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Tickets'**
  String get myTicketsTitle;

  /// No description provided for @myTicketsTabsUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get myTicketsTabsUpcoming;

  /// No description provided for @myTicketsTabsPast.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get myTicketsTabsPast;

  /// No description provided for @myTicketsTicketIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Ticket ID: #{id}'**
  String myTicketsTicketIdLabel(String id);

  /// No description provided for @myTicketsSampleEventsAiFutureTech.
  ///
  /// In en, this message translates to:
  /// **'AI & Future Technology'**
  String get myTicketsSampleEventsAiFutureTech;

  /// No description provided for @myTicketsSampleEventsNeonNights.
  ///
  /// In en, this message translates to:
  /// **'Neon Nights'**
  String get myTicketsSampleEventsNeonNights;

  /// No description provided for @myTicketsSampleEventsIndieFolkFestival.
  ///
  /// In en, this message translates to:
  /// **'Indie Folk Festival'**
  String get myTicketsSampleEventsIndieFolkFestival;

  /// No description provided for @myTicketsSampleEventsWomenCooking.
  ///
  /// In en, this message translates to:
  /// **'Women Cooking'**
  String get myTicketsSampleEventsWomenCooking;

  /// No description provided for @myTicketsSampleEventsSummerJazzNight.
  ///
  /// In en, this message translates to:
  /// **'Summer Jazz Night'**
  String get myTicketsSampleEventsSummerJazzNight;

  /// No description provided for @myTicketsSampleEventsDigitalArtExpo.
  ///
  /// In en, this message translates to:
  /// **'Digital Art Expo'**
  String get myTicketsSampleEventsDigitalArtExpo;

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// No description provided for @favoritesCategoryMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get favoritesCategoryMusic;

  /// No description provided for @favoritesSampleEventsSummerSoundwave.
  ///
  /// In en, this message translates to:
  /// **'Summer Soundwave 2024'**
  String get favoritesSampleEventsSummerSoundwave;

  /// No description provided for @favoritesSampleEventsGlobalInnovationSummit.
  ///
  /// In en, this message translates to:
  /// **'Global Innovation Summit'**
  String get favoritesSampleEventsGlobalInnovationSummit;

  /// No description provided for @artistOrganizerViewProfile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get artistOrganizerViewProfile;

  /// No description provided for @artistOrganizerFollowers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get artistOrganizerFollowers;

  /// No description provided for @artistOrganizerUpcomingEvents.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Events'**
  String get artistOrganizerUpcomingEvents;

  /// No description provided for @artistOrganizerEventsHosted.
  ///
  /// In en, this message translates to:
  /// **'Events Hosted'**
  String get artistOrganizerEventsHosted;

  /// No description provided for @artistOrganizerShowsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Shows'**
  String artistOrganizerShowsCount(String count);

  /// No description provided for @artistOrganizerAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get artistOrganizerAbout;

  /// No description provided for @artistOrganizerGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get artistOrganizerGallery;

  /// No description provided for @artistOrganizerUpcomingTours.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Tours'**
  String get artistOrganizerUpcomingTours;

  /// No description provided for @artistOrganizerUpcomingEventsViewAll.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Events (View All)'**
  String get artistOrganizerUpcomingEventsViewAll;

  /// No description provided for @artistOrganizerShowsCountFull.
  ///
  /// In en, this message translates to:
  /// **'{count} Shows'**
  String artistOrganizerShowsCountFull(String count);

  /// No description provided for @artistOrganizerEventsHostedCount.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String artistOrganizerEventsHostedCount(String count);

  /// No description provided for @artistOrganizerFollowersCountShort.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String artistOrganizerFollowersCountShort(String count);

  /// No description provided for @artistOrganizerFindMoreArtists.
  ///
  /// In en, this message translates to:
  /// **'Find More Artists'**
  String get artistOrganizerFindMoreArtists;

  /// No description provided for @artistOrganizerTabsUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get artistOrganizerTabsUpcoming;

  /// No description provided for @artistOrganizerTabsPastEvents.
  ///
  /// In en, this message translates to:
  /// **'Past Events'**
  String get artistOrganizerTabsPastEvents;

  /// No description provided for @artistOrganizerTabsReviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get artistOrganizerTabsReviews;

  /// No description provided for @artistOrganizerArtistBioExample.
  ///
  /// In en, this message translates to:
  /// **'Abel Makkonen Tesfaye, known professionally as The Weeknd, is a Canadian singer-songwriter and record producer. Known for his sonic versatility and dark lyricism... Read More'**
  String get artistOrganizerArtistBioExample;

  /// No description provided for @artistOrganizerOrganizerBioExample.
  ///
  /// In en, this message translates to:
  /// **'Global Concerts Inc. is a premier event organizer specializing in international music festivals and live stadium performances. Bringing the world\'s best talent to your city.'**
  String get artistOrganizerOrganizerBioExample;

  /// No description provided for @artistOrganizerBandLabel.
  ///
  /// In en, this message translates to:
  /// **'Band'**
  String get artistOrganizerBandLabel;

  /// No description provided for @artistOrganizerArtistLabel.
  ///
  /// In en, this message translates to:
  /// **'Artist'**
  String get artistOrganizerArtistLabel;

  /// No description provided for @reviewsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reviews & Ratings'**
  String get reviewsTitle;

  /// No description provided for @reviewsOverallRating.
  ///
  /// In en, this message translates to:
  /// **'{rating}'**
  String reviewsOverallRating(String rating);

  /// No description provided for @reviewsReviewsCountTotal.
  ///
  /// In en, this message translates to:
  /// **'{count} Reviews'**
  String reviewsReviewsCountTotal(String count);

  /// No description provided for @reviewsRatingBarLabel.
  ///
  /// In en, this message translates to:
  /// **'{stars}'**
  String reviewsRatingBarLabel(String stars);

  /// No description provided for @reviewsWriteAReview.
  ///
  /// In en, this message translates to:
  /// **'Write a Review'**
  String get reviewsWriteAReview;

  /// No description provided for @reviewsHowWasYourExperience.
  ///
  /// In en, this message translates to:
  /// **'HOW WAS YOUR EXPERIENCE?'**
  String get reviewsHowWasYourExperience;

  /// No description provided for @reviewsShareExperiencePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Share your experience with others...'**
  String get reviewsShareExperiencePlaceholder;

  /// No description provided for @reviewsPostAnonymously.
  ///
  /// In en, this message translates to:
  /// **'Post Anonymously'**
  String get reviewsPostAnonymously;

  /// No description provided for @reviewsAnonymousNote.
  ///
  /// In en, this message translates to:
  /// **'Your name won\'t be visible to others'**
  String get reviewsAnonymousNote;

  /// No description provided for @reviewsReviewsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Reviews'**
  String reviewsReviewsCount(String count);

  /// No description provided for @reviewsVerifiedAttendee.
  ///
  /// In en, this message translates to:
  /// **'Verified Attendee • {time} ago'**
  String reviewsVerifiedAttendee(String time);

  /// No description provided for @reviewsHelpfulCount.
  ///
  /// In en, this message translates to:
  /// **'Helpful ({count})'**
  String reviewsHelpfulCount(String count);

  /// No description provided for @reviewsReply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reviewsReply;

  /// No description provided for @reviewsReviewExample1.
  ///
  /// In en, this message translates to:
  /// **'The atmosphere was electric! Sound quality was 10/10. Definitely worth the price. The staff was super helpful when we couldn\'t find our seats.'**
  String get reviewsReviewExample1;

  /// No description provided for @reviewsReviewExample2.
  ///
  /// In en, this message translates to:
  /// **'Overall great experience! Only downside was the long queue for beverages. I recommend arriving early if you want to grab drinks before the show starts.'**
  String get reviewsReviewExample2;

  /// No description provided for @reviewsReviewExample3.
  ///
  /// In en, this message translates to:
  /// **'Unbelievable night! The light show was synchronized perfectly with the bass. I\'ve been to many events, but EveTick always makes booking so seamless.'**
  String get reviewsReviewExample3;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsAppearanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how EveTick looks on your device.'**
  String get settingsAppearanceSubtitle;

  /// No description provided for @settingsLightMode.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsLightMode;

  /// No description provided for @settingsLightModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Always bright and clear'**
  String get settingsLightModeSubtitle;

  /// No description provided for @settingsDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsDarkMode;

  /// No description provided for @settingsDarkModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Easier on the eyes in low light'**
  String get settingsDarkModeSubtitle;

  /// No description provided for @settingsSelectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get settingsSelectLanguage;

  /// No description provided for @settingsDefaultLanguage.
  ///
  /// In en, this message translates to:
  /// **'Default language'**
  String get settingsDefaultLanguage;

  /// No description provided for @settingsArabicLanguage.
  ///
  /// In en, this message translates to:
  /// **'Arabic language'**
  String get settingsArabicLanguage;

  /// No description provided for @settingsLanguageOptionsEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageOptionsEnglish;

  /// No description provided for @settingsLanguageOptionsArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get settingsLanguageOptionsArabic;

  /// No description provided for @settingsApplyChanges.
  ///
  /// In en, this message translates to:
  /// **'Apply Changes'**
  String get settingsApplyChanges;

  /// No description provided for @settingsApplySelection.
  ///
  /// In en, this message translates to:
  /// **'Apply Selection'**
  String get settingsApplySelection;

  /// No description provided for @helpSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupportTitle;

  /// No description provided for @helpSupportHowCanWeHelp.
  ///
  /// In en, this message translates to:
  /// **'How can we help?'**
  String get helpSupportHowCanWeHelp;

  /// No description provided for @helpSupportWhatCanWeHelpWith.
  ///
  /// In en, this message translates to:
  /// **'WHAT CAN WE HELP WITH?'**
  String get helpSupportWhatCanWeHelpWith;

  /// No description provided for @helpSupportSelectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get helpSupportSelectCategory;

  /// No description provided for @helpSupportCategoriesAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get helpSupportCategoriesAccount;

  /// No description provided for @helpSupportCategoriesBooking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get helpSupportCategoriesBooking;

  /// No description provided for @helpSupportCategoriesPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get helpSupportCategoriesPayment;

  /// No description provided for @helpSupportCategoriesOrganizerHelp.
  ///
  /// In en, this message translates to:
  /// **'Organizer Help'**
  String get helpSupportCategoriesOrganizerHelp;

  /// No description provided for @helpSupportFrequentQuestions.
  ///
  /// In en, this message translates to:
  /// **'Frequent Questions'**
  String get helpSupportFrequentQuestions;

  /// No description provided for @helpSupportFaqRefundQuestion.
  ///
  /// In en, this message translates to:
  /// **'How do I refund a ticket?'**
  String get helpSupportFaqRefundQuestion;

  /// No description provided for @helpSupportFaqRefundAnswer.
  ///
  /// In en, this message translates to:
  /// **'You can request a refund directly through the \'My Tickets\' section if the event organizer allows it. Usually, refunds are processed within 5-7 business days to your original payment method.'**
  String get helpSupportFaqRefundAnswer;

  /// No description provided for @helpSupportFaqQrCodeQuestion.
  ///
  /// In en, this message translates to:
  /// **'Where can I find my QR code?'**
  String get helpSupportFaqQrCodeQuestion;

  /// No description provided for @helpSupportFaqTransferQuestion.
  ///
  /// In en, this message translates to:
  /// **'Can I transfer my tickets to a friend?'**
  String get helpSupportFaqTransferQuestion;

  /// No description provided for @helpSupportFaqProfilePhotoQuestion.
  ///
  /// In en, this message translates to:
  /// **'How do I change my profile photo?'**
  String get helpSupportFaqProfilePhotoQuestion;

  /// No description provided for @helpSupportStillNeedHelp.
  ///
  /// In en, this message translates to:
  /// **'Still need help?'**
  String get helpSupportStillNeedHelp;

  /// No description provided for @helpSupportSupportAvailabilityNotice.
  ///
  /// In en, this message translates to:
  /// **'Our support team is available 24/7 to assist you with any issues.'**
  String get helpSupportSupportAvailabilityNotice;

  /// No description provided for @helpSupportContactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get helpSupportContactSupport;

  /// No description provided for @helpSupportSendMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Send Us a Message'**
  String get helpSupportSendMessageTitle;

  /// No description provided for @helpSupportYourMessageLabel.
  ///
  /// In en, this message translates to:
  /// **'Your Message'**
  String get helpSupportYourMessageLabel;

  /// No description provided for @helpSupportMessagePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Describe your issue or feedback in detail here...'**
  String get helpSupportMessagePlaceholder;

  /// No description provided for @helpSupportAttachmentsOptional.
  ///
  /// In en, this message translates to:
  /// **'ATTACHMENTS (OPTIONAL)'**
  String get helpSupportAttachmentsOptional;

  /// No description provided for @helpSupportUploadScreenshot.
  ///
  /// In en, this message translates to:
  /// **'Upload Screenshot'**
  String get helpSupportUploadScreenshot;

  /// No description provided for @helpSupportSupportedFormatsNotice.
  ///
  /// In en, this message translates to:
  /// **'Supported formats: PNG, JPG (Max 5MB)'**
  String get helpSupportSupportedFormatsNotice;

  /// No description provided for @helpSupportResponseTimeNotice.
  ///
  /// In en, this message translates to:
  /// **'Our support team typically responds within 24 hours. For urgent ticket issues, please check our FAQ section.'**
  String get helpSupportResponseTimeNotice;

  /// No description provided for @helpSupportSendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get helpSupportSendMessage;

  /// No description provided for @termsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsTitle;

  /// No description provided for @termsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Terms and Services'**
  String get termsSubtitle;

  /// No description provided for @termsLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: {date}'**
  String termsLastUpdated(String date);

  /// No description provided for @termsSectionsAcceptanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Acceptance of Terms'**
  String get termsSectionsAcceptanceTitle;

  /// No description provided for @termsSectionsAcceptanceBody1.
  ///
  /// In en, this message translates to:
  /// **'By accessing or using the EveTick platform, you agree to be bound by these Terms and Services. These terms constitute a legally binding agreement between you and EveTick Inc.'**
  String get termsSectionsAcceptanceBody1;

  /// No description provided for @termsSectionsAcceptanceBody2.
  ///
  /// In en, this message translates to:
  /// **'If you do not agree to all of these terms, please do not use our services. We reserve the right to change or modify these terms at any time.'**
  String get termsSectionsAcceptanceBody2;

  /// No description provided for @termsSectionsEligibilityTitle.
  ///
  /// In en, this message translates to:
  /// **'User Eligibility'**
  String get termsSectionsEligibilityTitle;

  /// No description provided for @termsSectionsEligibilityBody.
  ///
  /// In en, this message translates to:
  /// **'You must be at least 18 years of age to use the Services. By creating an account, you represent and warrant that you have the right, authority, and capacity to enter into this agreement.'**
  String get termsSectionsEligibilityBody;

  /// No description provided for @termsSectionsEligibilityListItem1.
  ///
  /// In en, this message translates to:
  /// **'Provide accurate registration information'**
  String get termsSectionsEligibilityListItem1;

  /// No description provided for @termsSectionsEligibilityListItem2.
  ///
  /// In en, this message translates to:
  /// **'Maintain the security of your password.'**
  String get termsSectionsEligibilityListItem2;

  /// No description provided for @termsSectionsEligibilityListItem3.
  ///
  /// In en, this message translates to:
  /// **'Promptly update any information changes.'**
  String get termsSectionsEligibilityListItem3;

  /// No description provided for @termsSectionsTicketPurchaseTitle.
  ///
  /// In en, this message translates to:
  /// **'Ticket Purchase & Refunds'**
  String get termsSectionsTicketPurchaseTitle;

  /// No description provided for @termsSectionsTicketPurchaseBody.
  ///
  /// In en, this message translates to:
  /// **'All sales are final unless an event is cancelled or rescheduled. EveTick acts as an intermediary between event organizers and attendees. Please review our Refund Policy for specific details regarding venue-specific cancellations.'**
  String get termsSectionsTicketPurchaseBody;

  /// No description provided for @termsSectionsProhibitedConductTitle.
  ///
  /// In en, this message translates to:
  /// **'Prohibited Conduct'**
  String get termsSectionsProhibitedConductTitle;

  /// No description provided for @termsSectionsProhibitedConductIntro.
  ///
  /// In en, this message translates to:
  /// **'Users are strictly prohibited from:'**
  String get termsSectionsProhibitedConductIntro;

  /// No description provided for @termsSectionsProhibitedConductListItem1.
  ///
  /// In en, this message translates to:
  /// **'Reselling tickets at a price higher than the original face value on third-party platforms.'**
  String get termsSectionsProhibitedConductListItem1;

  /// No description provided for @termsSectionsProhibitedConductListItem2.
  ///
  /// In en, this message translates to:
  /// **'Attempting to circumvent security features or API limitations.'**
  String get termsSectionsProhibitedConductListItem2;

  /// No description provided for @termsSectionsProhibitedConductListItem3.
  ///
  /// In en, this message translates to:
  /// **'Impersonating any person or entity or misrepresenting your affiliation.'**
  String get termsSectionsProhibitedConductListItem3;

  /// No description provided for @termsSectionsIpTitle.
  ///
  /// In en, this message translates to:
  /// **'Intellectual Property'**
  String get termsSectionsIpTitle;

  /// No description provided for @termsSectionsIpBody.
  ///
  /// In en, this message translates to:
  /// **'The EveTick name, logo, and all related designs are trademarks of EveTick Inc. You may not use these without prior written permission.'**
  String get termsSectionsIpBody;

  /// No description provided for @termsSectionsLiabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Limitation of Liability'**
  String get termsSectionsLiabilityTitle;

  /// No description provided for @termsSectionsLiabilityBody.
  ///
  /// In en, this message translates to:
  /// **'To the maximum extent permitted by law, EveTick shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your access to or use of the services.'**
  String get termsSectionsLiabilityBody;

  /// No description provided for @termsDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get termsDecline;

  /// No description provided for @termsAgreeAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Agree & Continue'**
  String get termsAgreeAndContinue;

  /// No description provided for @profilePersonalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get profilePersonalInfoTitle;

  /// No description provided for @profileFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get profileFullName;

  /// No description provided for @profileFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get profileFullNameHint;

  /// No description provided for @profileFullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get profileFullNameRequired;

  /// No description provided for @profileEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmail;

  /// No description provided for @profileEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get profileEmailHint;

  /// No description provided for @profilePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get profilePhone;

  /// No description provided for @profilePhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get profilePhoneHint;

  /// No description provided for @profilePhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get profilePhoneInvalid;

  /// No description provided for @profileAddress.
  ///
  /// In en, this message translates to:
  /// **'Physical Address'**
  String get profileAddress;

  /// No description provided for @profileAddressHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your address'**
  String get profileAddressHint;

  /// No description provided for @profileAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get profileAddressRequired;

  /// No description provided for @profileSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get profileSave;

  /// No description provided for @profileUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully.'**
  String get profileUpdatedSuccess;

  /// No description provided for @profileTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get profileTheme;

  /// No description provided for @profileThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get profileThemeSystem;

  /// No description provided for @profileThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get profileThemeLight;

  /// No description provided for @profileThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get profileThemeDark;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
