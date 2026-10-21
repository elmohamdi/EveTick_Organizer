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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
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
  /// **'Manage Your Events\nLike '**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeTitleRemain.
  ///
  /// In en, this message translates to:
  /// **'a Pro'**
  String get onboardingWelcomeTitleRemain;

  /// No description provided for @onboardingWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create, manage, and grow your events with ease.'**
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

  /// No description provided for @onboardingCreateCustomize.
  ///
  /// In en, this message translates to:
  /// **'Create & Customize'**
  String get onboardingCreateCustomize;

  /// No description provided for @onboardingCreateCustomizeDescription.
  ///
  /// In en, this message translates to:
  /// **'Create stunning event pages, add ticket types, and your preferences.'**
  String get onboardingCreateCustomizeDescription;

  /// No description provided for @onboardingScanAndManage.
  ///
  /// In en, this message translates to:
  /// **'Scan & Manage'**
  String get onboardingScanAndManage;

  /// No description provided for @onboardingScanningDescription.
  ///
  /// In en, this message translates to:
  /// **'Use our powerful scanning tools to validate tickets and manage entry'**
  String get onboardingScanningDescription;

  /// No description provided for @onboardingDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'All-in-One Dashboard'**
  String get onboardingDashboardTitle;

  /// No description provided for @onboardingDashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get a real-time overview of your events,tickets, sales, and staff performance.'**
  String get onboardingDashboardSubtitle;

  /// No description provided for @supportHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get supportHelpTitle;

  /// No description provided for @supportSearchHint.
  ///
  /// In en, this message translates to:
  /// **'How can we help?'**
  String get supportSearchHint;

  /// No description provided for @supportClearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get supportClearSearch;

  /// No description provided for @supportCategoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get supportCategoriesTitle;

  /// No description provided for @supportFrequentQuestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequent Questions'**
  String get supportFrequentQuestionsTitle;

  /// No description provided for @supportCategoryAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get supportCategoryAccount;

  /// No description provided for @supportCategoryEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get supportCategoryEvents;

  /// No description provided for @supportCategoryTicketing.
  ///
  /// In en, this message translates to:
  /// **'Tickets & Scanning'**
  String get supportCategoryTicketing;

  /// No description provided for @supportCategoryPayouts.
  ///
  /// In en, this message translates to:
  /// **'Payouts'**
  String get supportCategoryPayouts;

  /// No description provided for @supportCategoryTechnical.
  ///
  /// In en, this message translates to:
  /// **'Technical Issue'**
  String get supportCategoryTechnical;

  /// No description provided for @supportCategoryFeedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback & Suggestions'**
  String get supportCategoryFeedback;

  /// No description provided for @supportNoResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get supportNoResultsTitle;

  /// No description provided for @supportNoResultsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try different keywords or send a message to our support team.'**
  String get supportNoResultsSubtitle;

  /// No description provided for @supportRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get supportRetry;

  /// No description provided for @supportStillNeedHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Still need help?'**
  String get supportStillNeedHelpTitle;

  /// No description provided for @supportStillNeedHelpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Our support team is available 24/7 to assist you with any issues.'**
  String get supportStillNeedHelpSubtitle;

  /// No description provided for @supportContactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get supportContactSupport;

  /// No description provided for @supportSendMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Send Us a Message'**
  String get supportSendMessageTitle;

  /// No description provided for @supportWhatCanWeHelpWith.
  ///
  /// In en, this message translates to:
  /// **'What can we help with?'**
  String get supportWhatCanWeHelpWith;

  /// No description provided for @supportSelectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get supportSelectCategory;

  /// No description provided for @supportCategoryRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get supportCategoryRequired;

  /// No description provided for @supportYourMessage.
  ///
  /// In en, this message translates to:
  /// **'Your Message'**
  String get supportYourMessage;

  /// No description provided for @supportMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Describe your issue or feedback in detail here...'**
  String get supportMessageHint;

  /// No description provided for @supportMessageRequired.
  ///
  /// In en, this message translates to:
  /// **'Please write your message'**
  String get supportMessageRequired;

  /// No description provided for @supportMessageTooShort.
  ///
  /// In en, this message translates to:
  /// **'Your message must be at least 10 characters'**
  String get supportMessageTooShort;

  /// No description provided for @supportAttachmentsOptional.
  ///
  /// In en, this message translates to:
  /// **'Attachments (optional)'**
  String get supportAttachmentsOptional;

  /// No description provided for @supportUploadScreenshot.
  ///
  /// In en, this message translates to:
  /// **'Upload Screenshot'**
  String get supportUploadScreenshot;

  /// No description provided for @supportAttachmentHint.
  ///
  /// In en, this message translates to:
  /// **'Supported formats: PNG, JPG (Max 5MB)'**
  String get supportAttachmentHint;

  /// No description provided for @supportAttachmentRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get supportAttachmentRemove;

  /// No description provided for @supportAttachmentUnsupported.
  ///
  /// In en, this message translates to:
  /// **'Only PNG and JPG images are supported'**
  String get supportAttachmentUnsupported;

  /// No description provided for @supportAttachmentTooLarge.
  ///
  /// In en, this message translates to:
  /// **'This image is larger than 5MB'**
  String get supportAttachmentTooLarge;

  /// No description provided for @supportAttachmentLimit.
  ///
  /// In en, this message translates to:
  /// **'You can attach up to 3 screenshots'**
  String get supportAttachmentLimit;

  /// No description provided for @supportAttachmentPickFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open that image, please try again'**
  String get supportAttachmentPickFailed;

  /// No description provided for @supportNoticePrefix.
  ///
  /// In en, this message translates to:
  /// **'Our support team typically responds within 24 hours. For urgent issues during a live event, please check our '**
  String get supportNoticePrefix;

  /// No description provided for @supportNoticeLink.
  ///
  /// In en, this message translates to:
  /// **'FAQ section'**
  String get supportNoticeLink;

  /// No description provided for @supportNoticeSuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get supportNoticeSuffix;

  /// No description provided for @supportSendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get supportSendMessage;

  /// No description provided for @supportMessageSent.
  ///
  /// In en, this message translates to:
  /// **'Message sent! We will get back to you within 24 hours.'**
  String get supportMessageSent;

  /// No description provided for @staffInvitationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Staff invitations ({count})'**
  String staffInvitationsTitle(int count);

  /// No description provided for @staffInvitationsCheckFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t check your invitations'**
  String get staffInvitationsCheckFailed;

  /// No description provided for @staffInvitationsRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get staffInvitationsRetry;

  /// No description provided for @staffInvitationAccepted.
  ///
  /// In en, this message translates to:
  /// **'You joined \"{eventTitle}\"'**
  String staffInvitationAccepted(String eventTitle);

  /// No description provided for @staffInvitationDeclined.
  ///
  /// In en, this message translates to:
  /// **'Invitation declined'**
  String get staffInvitationDeclined;

  /// No description provided for @staffInvitationInvitedAs.
  ///
  /// In en, this message translates to:
  /// **'{name} invited you as {role}'**
  String staffInvitationInvitedAs(String name, String role);

  /// No description provided for @staffAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get staffAccept;

  /// No description provided for @staffDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get staffDecline;

  /// No description provided for @staffSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Staff'**
  String get staffSectionTitle;

  /// No description provided for @staffAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get staffAdd;

  /// No description provided for @staffLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load staff'**
  String get staffLoadFailed;

  /// No description provided for @staffTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get staffTryAgain;

  /// No description provided for @staffEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'No staff yet. Invite a co-organizer or gate staff by email and choose what they can do.'**
  String get staffEmptyMessage;

  /// No description provided for @staffAddMember.
  ///
  /// In en, this message translates to:
  /// **'Add staff member'**
  String get staffAddMember;

  /// No description provided for @staffCancelInvitationQuestion.
  ///
  /// In en, this message translates to:
  /// **'Cancel invitation?'**
  String get staffCancelInvitationQuestion;

  /// No description provided for @staffRemoveMemberQuestion.
  ///
  /// In en, this message translates to:
  /// **'Remove staff member?'**
  String get staffRemoveMemberQuestion;

  /// No description provided for @staffCancelInvitationMessage.
  ///
  /// In en, this message translates to:
  /// **'The invitation sent to {email} will be cancelled.'**
  String staffCancelInvitationMessage(String email);

  /// No description provided for @staffRemoveMemberMessage.
  ///
  /// In en, this message translates to:
  /// **'{name} will lose access to this event.'**
  String staffRemoveMemberMessage(String name);

  /// No description provided for @staffKeep.
  ///
  /// In en, this message translates to:
  /// **'Keep'**
  String get staffKeep;

  /// No description provided for @staffCancelInvitation.
  ///
  /// In en, this message translates to:
  /// **'Cancel invitation'**
  String get staffCancelInvitation;

  /// No description provided for @staffRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get staffRemove;

  /// No description provided for @staffAddMemberTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Staff Member'**
  String get staffAddMemberTitle;

  /// No description provided for @staffFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get staffFullName;

  /// No description provided for @staffFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Alex Johnson'**
  String get staffFullNameHint;

  /// No description provided for @staffFullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter the full name'**
  String get staffFullNameRequired;

  /// No description provided for @staffEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get staffEmailAddress;

  /// No description provided for @staffEmailHint.
  ///
  /// In en, this message translates to:
  /// **'alex@example.com'**
  String get staffEmailHint;

  /// No description provided for @staffEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter an email'**
  String get staffEmailRequired;

  /// No description provided for @staffEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get staffEmailInvalid;

  /// No description provided for @staffAssignRole.
  ///
  /// In en, this message translates to:
  /// **'Assign Role'**
  String get staffAssignRole;

  /// No description provided for @staffSelectRole.
  ///
  /// In en, this message translates to:
  /// **'Select a role'**
  String get staffSelectRole;

  /// No description provided for @staffRoleRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a role'**
  String get staffRoleRequired;

  /// No description provided for @staffPermissions.
  ///
  /// In en, this message translates to:
  /// **'PERMISSIONS'**
  String get staffPermissions;

  /// No description provided for @staffPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Select at least one permission'**
  String get staffPermissionRequired;

  /// No description provided for @staffInvitationSent.
  ///
  /// In en, this message translates to:
  /// **'Invitation sent to {email}'**
  String staffInvitationSent(String email);

  /// No description provided for @staffSendInvitation.
  ///
  /// In en, this message translates to:
  /// **'Send Invitation'**
  String get staffSendInvitation;

  /// No description provided for @staffPending.
  ///
  /// In en, this message translates to:
  /// **'PENDING'**
  String get staffPending;

  /// No description provided for @staffActive.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get staffActive;

  /// No description provided for @staffPermissionViewAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Can view analytics'**
  String get staffPermissionViewAnalytics;

  /// No description provided for @staffPermissionViewAnalyticsDescription.
  ///
  /// In en, this message translates to:
  /// **'Access to sales reports and charts'**
  String get staffPermissionViewAnalyticsDescription;

  /// No description provided for @staffPermissionScanTickets.
  ///
  /// In en, this message translates to:
  /// **'Can scan tickets'**
  String get staffPermissionScanTickets;

  /// No description provided for @staffPermissionScanTicketsDescription.
  ///
  /// In en, this message translates to:
  /// **'Use the mobile app for check-ins'**
  String get staffPermissionScanTicketsDescription;

  /// No description provided for @staffPermissionEditEventDetails.
  ///
  /// In en, this message translates to:
  /// **'Can edit event details'**
  String get staffPermissionEditEventDetails;

  /// No description provided for @staffPermissionEditEventDetailsDescription.
  ///
  /// In en, this message translates to:
  /// **'Change title, schedule and description'**
  String get staffPermissionEditEventDetailsDescription;

  /// No description provided for @staffRoleCoOrganizer.
  ///
  /// In en, this message translates to:
  /// **'Co-organizer'**
  String get staffRoleCoOrganizer;

  /// No description provided for @staffRoleManager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get staffRoleManager;

  /// No description provided for @staffRoleGateStaff.
  ///
  /// In en, this message translates to:
  /// **'Gate Staff'**
  String get staffRoleGateStaff;

  /// No description provided for @staffRoleAnalyst.
  ///
  /// In en, this message translates to:
  /// **'Analyst'**
  String get staffRoleAnalyst;

  /// No description provided for @createEventScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get createEventScreenTitle;

  /// No description provided for @createEventPhaseDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get createEventPhaseDetails;

  /// No description provided for @createEventPhaseMedia.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get createEventPhaseMedia;

  /// No description provided for @createEventPhaseSeating.
  ///
  /// In en, this message translates to:
  /// **'Seating'**
  String get createEventPhaseSeating;

  /// No description provided for @createEventPhaseTickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get createEventPhaseTickets;

  /// No description provided for @createEventPublishFailed.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while publishing the event'**
  String get createEventPublishFailed;

  /// No description provided for @createEventNextStep.
  ///
  /// In en, this message translates to:
  /// **'Next Step'**
  String get createEventNextStep;

  /// No description provided for @createEventTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Enter catchy event name'**
  String get createEventTitleHint;

  /// No description provided for @createEventTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get createEventTitleLabel;

  /// No description provided for @createEventTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter event title'**
  String get createEventTitleRequired;

  /// No description provided for @createEventCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get createEventCategoryLabel;

  /// No description provided for @createEventCategoryHint.
  ///
  /// In en, this message translates to:
  /// **'Select event category'**
  String get createEventCategoryHint;

  /// No description provided for @createEventCategoryRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get createEventCategoryRequired;

  /// No description provided for @createEventStartDateTime.
  ///
  /// In en, this message translates to:
  /// **'Start Date & Time'**
  String get createEventStartDateTime;

  /// No description provided for @createEventEndDateTime.
  ///
  /// In en, this message translates to:
  /// **'End Date & Time'**
  String get createEventEndDateTime;

  /// No description provided for @createEventUrlLabel.
  ///
  /// In en, this message translates to:
  /// **'Event URL'**
  String get createEventUrlLabel;

  /// No description provided for @createEventUrlHint.
  ///
  /// In en, this message translates to:
  /// **'Enter event URL (e.g. Zoom link)'**
  String get createEventUrlHint;

  /// No description provided for @createEventUrlRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter event URL'**
  String get createEventUrlRequired;

  /// No description provided for @createEventOnlineToggle.
  ///
  /// In en, this message translates to:
  /// **'Online event (Virtual)'**
  String get createEventOnlineToggle;

  /// No description provided for @createEventSelectStart.
  ///
  /// In en, this message translates to:
  /// **'Please select a start date & time'**
  String get createEventSelectStart;

  /// No description provided for @createEventSelectEnd.
  ///
  /// In en, this message translates to:
  /// **'Please select an end date & time'**
  String get createEventSelectEnd;

  /// No description provided for @createEventLocationRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter the event location'**
  String get createEventLocationRequired;

  /// No description provided for @createEventEndBeforeStart.
  ///
  /// In en, this message translates to:
  /// **'End date & time must be after start date & time'**
  String get createEventEndBeforeStart;

  /// No description provided for @createEventAddressNotFound.
  ///
  /// In en, this message translates to:
  /// **'Could not get address from location'**
  String get createEventAddressNotFound;

  /// No description provided for @createEventLocationError.
  ///
  /// In en, this message translates to:
  /// **'Error getting location: {error}'**
  String createEventLocationError(String error);

  /// No description provided for @createEventLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Event Location'**
  String get createEventLocationLabel;

  /// No description provided for @createEventLocationHint.
  ///
  /// In en, this message translates to:
  /// **'Search or enter location'**
  String get createEventLocationHint;

  /// No description provided for @createEventDateHint.
  ///
  /// In en, this message translates to:
  /// **'mm/dd/yyyy'**
  String get createEventDateHint;

  /// No description provided for @createEventCategorySports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get createEventCategorySports;

  /// No description provided for @createEventCategoryMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get createEventCategoryMusic;

  /// No description provided for @createEventCategoryMedical.
  ///
  /// In en, this message translates to:
  /// **'Medical'**
  String get createEventCategoryMedical;

  /// No description provided for @createEventCategoryMovies.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get createEventCategoryMovies;

  /// No description provided for @createEventCategoryTechnology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get createEventCategoryTechnology;

  /// No description provided for @createEventCategoryBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get createEventCategoryBusiness;

  /// No description provided for @createEventCategoryEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get createEventCategoryEducation;

  /// No description provided for @createEventCategoryEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get createEventCategoryEntertainment;

  /// No description provided for @createEventCategoryArtsCulture.
  ///
  /// In en, this message translates to:
  /// **'Arts & Culture'**
  String get createEventCategoryArtsCulture;

  /// No description provided for @createEventCategoryFoodDrink.
  ///
  /// In en, this message translates to:
  /// **'Food & Drink'**
  String get createEventCategoryFoodDrink;

  /// No description provided for @createEventCategoryHealthWellness.
  ///
  /// In en, this message translates to:
  /// **'Health & Wellness'**
  String get createEventCategoryHealthWellness;

  /// No description provided for @createEventCategoryTravelAdventure.
  ///
  /// In en, this message translates to:
  /// **'Travel & Adventure'**
  String get createEventCategoryTravelAdventure;

  /// No description provided for @createEventCategoryGaming.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get createEventCategoryGaming;

  /// No description provided for @createEventCategoryFashion.
  ///
  /// In en, this message translates to:
  /// **'Fashion'**
  String get createEventCategoryFashion;

  /// No description provided for @createEventCategoryNetworking.
  ///
  /// In en, this message translates to:
  /// **'Networking'**
  String get createEventCategoryNetworking;

  /// No description provided for @createEventCategoryWorkshops.
  ///
  /// In en, this message translates to:
  /// **'Workshops'**
  String get createEventCategoryWorkshops;

  /// No description provided for @createEventCategoryConferences.
  ///
  /// In en, this message translates to:
  /// **'Conferences'**
  String get createEventCategoryConferences;

  /// No description provided for @createEventCategoryExhibitions.
  ///
  /// In en, this message translates to:
  /// **'Exhibitions'**
  String get createEventCategoryExhibitions;

  /// No description provided for @createEventCategoryFestivals.
  ///
  /// In en, this message translates to:
  /// **'Festivals'**
  String get createEventCategoryFestivals;

  /// No description provided for @createEventCategoryCharitySocial.
  ///
  /// In en, this message translates to:
  /// **'Charity & Social'**
  String get createEventCategoryCharitySocial;

  /// No description provided for @createEventMediaTitle.
  ///
  /// In en, this message translates to:
  /// **'Media Files'**
  String get createEventMediaTitle;

  /// No description provided for @createEventMediaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add visuals to attract more attendees'**
  String get createEventMediaSubtitle;

  /// No description provided for @createEventCoverImage.
  ///
  /// In en, this message translates to:
  /// **'Cover Image'**
  String get createEventCoverImage;

  /// No description provided for @createEventGalleryPhotos.
  ///
  /// In en, this message translates to:
  /// **'Gallery Photos (Optional)'**
  String get createEventGalleryPhotos;

  /// No description provided for @createEventGalleryLimit.
  ///
  /// In en, this message translates to:
  /// **'maximum {max} photos, up to 5MB each.'**
  String createEventGalleryLimit(int max);

  /// No description provided for @createEventDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Tell your attendees what to expect this amazing event...'**
  String get createEventDescriptionHint;

  /// No description provided for @createEventCoverRequired.
  ///
  /// In en, this message translates to:
  /// **'Please upload a cover image'**
  String get createEventCoverRequired;

  /// No description provided for @createEventUploadCover.
  ///
  /// In en, this message translates to:
  /// **'Upload Cover Photo'**
  String get createEventUploadCover;

  /// No description provided for @createEventRecommendedSize.
  ///
  /// In en, this message translates to:
  /// **'Recommended size: 1200 x 675px'**
  String get createEventRecommendedSize;

  /// No description provided for @createEventVenueMap.
  ///
  /// In en, this message translates to:
  /// **'Venue Map'**
  String get createEventVenueMap;

  /// No description provided for @createEventVenueMapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how attendees will be seated at this event.'**
  String get createEventVenueMapSubtitle;

  /// No description provided for @createEventContinueToTickets.
  ///
  /// In en, this message translates to:
  /// **'Continue to Tickets'**
  String get createEventContinueToTickets;

  /// No description provided for @createEventLayoutSeating.
  ///
  /// In en, this message translates to:
  /// **'Seating'**
  String get createEventLayoutSeating;

  /// No description provided for @createEventLayoutSections.
  ///
  /// In en, this message translates to:
  /// **'Sections'**
  String get createEventLayoutSections;

  /// No description provided for @createEventSeatAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get createEventSeatAvailable;

  /// No description provided for @createEventSeatUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get createEventSeatUnavailable;

  /// No description provided for @createEventAddSection.
  ///
  /// In en, this message translates to:
  /// **'Add Section'**
  String get createEventAddSection;

  /// No description provided for @createEventScreenLabel.
  ///
  /// In en, this message translates to:
  /// **'SCREEN'**
  String get createEventScreenLabel;

  /// No description provided for @createEventWalkway.
  ///
  /// In en, this message translates to:
  /// **'WALKWAY'**
  String get createEventWalkway;

  /// No description provided for @createEventMapSettings.
  ///
  /// In en, this message translates to:
  /// **'Map Settings'**
  String get createEventMapSettings;

  /// No description provided for @createEventRows.
  ///
  /// In en, this message translates to:
  /// **'Rows'**
  String get createEventRows;

  /// No description provided for @createEventSeatsPerRow.
  ///
  /// In en, this message translates to:
  /// **'Seats per Row'**
  String get createEventSeatsPerRow;

  /// No description provided for @createEventSectionName.
  ///
  /// In en, this message translates to:
  /// **'Section Name'**
  String get createEventSectionName;

  /// No description provided for @createEventSectionNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Stage A, VIP Zone.'**
  String get createEventSectionNameHint;

  /// No description provided for @createEventSectionNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a section name'**
  String get createEventSectionNameRequired;

  /// No description provided for @createEventCapacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get createEventCapacity;

  /// No description provided for @createEventCapacityHint.
  ///
  /// In en, this message translates to:
  /// **'Enter number of spots.'**
  String get createEventCapacityHint;

  /// No description provided for @createEventRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get createEventRequired;

  /// No description provided for @createEventInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid'**
  String get createEventInvalid;

  /// No description provided for @createEventTicketTiers.
  ///
  /// In en, this message translates to:
  /// **'Ticket Tiers'**
  String get createEventTicketTiers;

  /// No description provided for @createEventActiveTierOne.
  ///
  /// In en, this message translates to:
  /// **'1 active tier'**
  String get createEventActiveTierOne;

  /// No description provided for @createEventActiveTiers.
  ///
  /// In en, this message translates to:
  /// **'{count} active tiers'**
  String createEventActiveTiers(int count);

  /// No description provided for @createEventAddTier.
  ///
  /// In en, this message translates to:
  /// **'Add New Tier'**
  String get createEventAddTier;

  /// No description provided for @createEventPublish.
  ///
  /// In en, this message translates to:
  /// **'Publish Event'**
  String get createEventPublish;

  /// No description provided for @createEventTicketName.
  ///
  /// In en, this message translates to:
  /// **'Ticket Name'**
  String get createEventTicketName;

  /// No description provided for @createEventTicketNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your ticket name.'**
  String get createEventTicketNameHint;

  /// No description provided for @createEventTicketNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a ticket name'**
  String get createEventTicketNameRequired;

  /// No description provided for @createEventPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get createEventPrice;

  /// No description provided for @createEventPriceHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Price.'**
  String get createEventPriceHint;

  /// No description provided for @createEventInvalidPrice.
  ///
  /// In en, this message translates to:
  /// **'Invalid price'**
  String get createEventInvalidPrice;

  /// No description provided for @createEventQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get createEventQuantity;

  /// No description provided for @createEventQuantityHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Ticket Quantity.'**
  String get createEventQuantityHint;

  /// No description provided for @createEventTicketDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get createEventTicketDescription;

  /// No description provided for @createEventTicketDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Ticket Description.'**
  String get createEventTicketDescriptionHint;

  /// No description provided for @createEventPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get createEventPaymentMethods;

  /// No description provided for @createEventPaymentMethodsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose where you want to receive your money.'**
  String get createEventPaymentMethodsSubtitle;

  /// No description provided for @createEventPaymentMethodRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one payment method'**
  String get createEventPaymentMethodRequired;

  /// No description provided for @createEventWalletNumber.
  ///
  /// In en, this message translates to:
  /// **'Wallet Number'**
  String get createEventWalletNumber;

  /// No description provided for @createEventInstaPayField.
  ///
  /// In en, this message translates to:
  /// **'InstaPay Address or Phone'**
  String get createEventInstaPayField;

  /// No description provided for @createEventPayPalField.
  ///
  /// In en, this message translates to:
  /// **'PayPal Email'**
  String get createEventPayPalField;

  /// No description provided for @createEventInstaPayHint.
  ///
  /// In en, this message translates to:
  /// **'name@instapay or 01XXXXXXXXX'**
  String get createEventInstaPayHint;

  /// No description provided for @createEventPaymentEnterField.
  ///
  /// In en, this message translates to:
  /// **'Please enter your {field}'**
  String createEventPaymentEnterField(String field);

  /// No description provided for @createEventInvalidVodafone.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Vodafone Cash number'**
  String get createEventInvalidVodafone;

  /// No description provided for @createEventInvalidOrange.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Orange Cash number'**
  String get createEventInvalidOrange;

  /// No description provided for @createEventInvalidInstaPay.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid InstaPay address or phone number'**
  String get createEventInvalidInstaPay;

  /// No description provided for @createEventInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get createEventInvalidEmail;

  /// No description provided for @createEventCongrats.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get createEventCongrats;

  /// No description provided for @createEventPublishedIntro.
  ///
  /// In en, this message translates to:
  /// **'Your event is now '**
  String get createEventPublishedIntro;

  /// No description provided for @createEventPublishedStatus.
  ///
  /// In en, this message translates to:
  /// **'Under Review!\n'**
  String get createEventPublishedStatus;

  /// No description provided for @createEventPublishedWait.
  ///
  /// In en, this message translates to:
  /// **'please wait for our response.'**
  String get createEventPublishedWait;

  /// No description provided for @createEventGoHome.
  ///
  /// In en, this message translates to:
  /// **'Go To Home'**
  String get createEventGoHome;

  /// No description provided for @createEventStatusPending.
  ///
  /// In en, this message translates to:
  /// **'PENDING'**
  String get createEventStatusPending;

  /// No description provided for @commonTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonTryAgain;

  /// No description provided for @commonRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get commonRefresh;

  /// No description provided for @commonStatusLive.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get commonStatusLive;

  /// No description provided for @commonStatusPending.
  ///
  /// In en, this message translates to:
  /// **'PENDING'**
  String get commonStatusPending;

  /// No description provided for @commonNoEventsFound.
  ///
  /// In en, this message translates to:
  /// **'No events found.'**
  String get commonNoEventsFound;

  /// No description provided for @authOrDivider.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get authOrDivider;

  /// No description provided for @authCheckEmailCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Check your email for the code sent \nto '**
  String get authCheckEmailCodeSent;

  /// No description provided for @authNameInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid name'**
  String get authNameInvalid;

  /// No description provided for @authEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get authEmailInvalid;

  /// No description provided for @authPasswordInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid password'**
  String get authPasswordInvalid;

  /// No description provided for @myEventsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Events'**
  String get myEventsTitle;

  /// No description provided for @myEventsManageEvent.
  ///
  /// In en, this message translates to:
  /// **'Manage Event'**
  String get myEventsManageEvent;

  /// No description provided for @myEventsNoTitle.
  ///
  /// In en, this message translates to:
  /// **'No Title'**
  String get myEventsNoTitle;

  /// No description provided for @homeOverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get homeOverviewTitle;

  /// No description provided for @homeSalesByEvent.
  ///
  /// In en, this message translates to:
  /// **'Sales by Event'**
  String get homeSalesByEvent;

  /// No description provided for @homeNoEventsTitle.
  ///
  /// In en, this message translates to:
  /// **'No events yet'**
  String get homeNoEventsTitle;

  /// No description provided for @homeNoEventsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your first event and its sales will show up here.'**
  String get homeNoEventsSubtitle;

  /// No description provided for @homeStatRevenue.
  ///
  /// In en, this message translates to:
  /// **'REVENUE'**
  String get homeStatRevenue;

  /// No description provided for @homeStatAllEvents.
  ///
  /// In en, this message translates to:
  /// **'All events'**
  String get homeStatAllEvents;

  /// No description provided for @homeStatTicketsSold.
  ///
  /// In en, this message translates to:
  /// **'TICKETS SOLD'**
  String get homeStatTicketsSold;

  /// No description provided for @homeStatSoldPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% of {capacity}'**
  String homeStatSoldPercent(int percent, String capacity);

  /// No description provided for @homeStatEvents.
  ///
  /// In en, this message translates to:
  /// **'EVENTS'**
  String get homeStatEvents;

  /// No description provided for @homeStatLiveNow.
  ///
  /// In en, this message translates to:
  /// **'{count} live now'**
  String homeStatLiveNow(String count);

  /// No description provided for @homeStatCheckedIn.
  ///
  /// In en, this message translates to:
  /// **'CHECKED IN'**
  String get homeStatCheckedIn;

  /// No description provided for @homeStatNoTicketsSold.
  ///
  /// In en, this message translates to:
  /// **'No tickets sold yet'**
  String get homeStatNoTicketsSold;

  /// No description provided for @homeStatOfSold.
  ///
  /// In en, this message translates to:
  /// **'of {count} sold'**
  String homeStatOfSold(String count);

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Event Dashboard'**
  String get dashboardTitle;

  /// No description provided for @dashboardTicketSales.
  ///
  /// In en, this message translates to:
  /// **'Ticket Sales'**
  String get dashboardTicketSales;

  /// No description provided for @dashboardNoTiers.
  ///
  /// In en, this message translates to:
  /// **'This event has no ticket tiers.'**
  String get dashboardNoTiers;

  /// No description provided for @dashboardOnlineEvent.
  ///
  /// In en, this message translates to:
  /// **'Online event'**
  String get dashboardOnlineEvent;

  /// No description provided for @dashboardNoLocation.
  ///
  /// In en, this message translates to:
  /// **'No location'**
  String get dashboardNoLocation;

  /// No description provided for @dashboardPerTicket.
  ///
  /// In en, this message translates to:
  /// **'{price} per ticket'**
  String dashboardPerTicket(String price);

  /// No description provided for @dashboardTierSold.
  ///
  /// In en, this message translates to:
  /// **'{sold} of {capacity} sold'**
  String dashboardTierSold(String sold, String capacity);

  /// No description provided for @dashboardTotalRevenue.
  ///
  /// In en, this message translates to:
  /// **'TOTAL REVENUE'**
  String get dashboardTotalRevenue;

  /// No description provided for @dashboardFromTickets.
  ///
  /// In en, this message translates to:
  /// **'From {count} tickets'**
  String dashboardFromTickets(String count);

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan Tickets'**
  String get scanTitle;

  /// No description provided for @scanLoadingEvents.
  ///
  /// In en, this message translates to:
  /// **'Loading events...'**
  String get scanLoadingEvents;

  /// No description provided for @scanSelectAnEvent.
  ///
  /// In en, this message translates to:
  /// **'Select an event'**
  String get scanSelectAnEvent;

  /// No description provided for @scanSelectEventTitle.
  ///
  /// In en, this message translates to:
  /// **'Select event'**
  String get scanSelectEventTitle;

  /// No description provided for @scanTicketVerified.
  ///
  /// In en, this message translates to:
  /// **'Ticket Verified'**
  String get scanTicketVerified;

  /// No description provided for @scanAlreadyScanned.
  ///
  /// In en, this message translates to:
  /// **'Already Scanned'**
  String get scanAlreadyScanned;

  /// No description provided for @scanInvalidTicket.
  ///
  /// In en, this message translates to:
  /// **'Invalid Ticket'**
  String get scanInvalidTicket;

  /// No description provided for @scanCodeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Code not found for this event'**
  String get scanCodeNotFound;

  /// No description provided for @scanFailed.
  ///
  /// In en, this message translates to:
  /// **'Scan Failed'**
  String get scanFailed;

  /// No description provided for @scanCameraPermission.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to scan tickets'**
  String get scanCameraPermission;

  /// No description provided for @scanCameraUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Camera is unavailable'**
  String get scanCameraUnavailable;

  /// No description provided for @scanEnterManuallyBelow.
  ///
  /// In en, this message translates to:
  /// **'You can still enter the ticket code manually below'**
  String get scanEnterManuallyBelow;

  /// No description provided for @scanInstruction.
  ///
  /// In en, this message translates to:
  /// **'Align QR code within the frame'**
  String get scanInstruction;

  /// No description provided for @scanManualEntry.
  ///
  /// In en, this message translates to:
  /// **'MANUAL ENTRY'**
  String get scanManualEntry;

  /// No description provided for @scanManualHint.
  ///
  /// In en, this message translates to:
  /// **'Enter ticket code manually'**
  String get scanManualHint;

  /// No description provided for @scanSound.
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get scanSound;

  /// No description provided for @scanVibrate.
  ///
  /// In en, this message translates to:
  /// **'Vibrate'**
  String get scanVibrate;

  /// No description provided for @scanStatScanned.
  ///
  /// In en, this message translates to:
  /// **'SCANNED'**
  String get scanStatScanned;

  /// No description provided for @scanStatTotalExpected.
  ///
  /// In en, this message translates to:
  /// **'TOTAL EXPECTED'**
  String get scanStatTotalExpected;

  /// No description provided for @scanSelectEventFirst.
  ///
  /// In en, this message translates to:
  /// **'Select an event before scanning'**
  String get scanSelectEventFirst;

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get notificationsMarkAllRead;

  /// No description provided for @notificationsMarkAllFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update your notifications'**
  String get notificationsMarkAllFailed;

  /// No description provided for @notificationsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get notificationsEmptyTitle;

  /// No description provided for @notificationsEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ticket sales, staff replies and event updates will show up here'**
  String get notificationsEmptySubtitle;

  /// No description provided for @notificationsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load your notifications'**
  String get notificationsLoadFailed;

  /// No description provided for @notificationsRecentTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get notificationsRecentTitle;

  /// No description provided for @notificationSomeone.
  ///
  /// In en, this message translates to:
  /// **'Someone'**
  String get notificationSomeone;

  /// No description provided for @notificationATicket.
  ///
  /// In en, this message translates to:
  /// **'a ticket'**
  String get notificationATicket;

  /// No description provided for @notificationTicketPurchasedTitle.
  ///
  /// In en, this message translates to:
  /// **'New ticket sold'**
  String get notificationTicketPurchasedTitle;

  /// No description provided for @notificationTicketPurchasedBody.
  ///
  /// In en, this message translates to:
  /// **'{buyer} bought {ticket} for \"{event}\"'**
  String notificationTicketPurchasedBody(String buyer, String ticket, String event);

  /// No description provided for @notificationStaffAcceptedTitle.
  ///
  /// In en, this message translates to:
  /// **'Invitation accepted'**
  String get notificationStaffAcceptedTitle;

  /// No description provided for @notificationStaffAcceptedBody.
  ///
  /// In en, this message translates to:
  /// **'{name} accepted your invitation to join \"{event}\"'**
  String notificationStaffAcceptedBody(String name, String event);

  /// No description provided for @notificationStaffDeclinedTitle.
  ///
  /// In en, this message translates to:
  /// **'Invitation declined'**
  String get notificationStaffDeclinedTitle;

  /// No description provided for @notificationStaffDeclinedBody.
  ///
  /// In en, this message translates to:
  /// **'{name} declined your invitation to join \"{event}\"'**
  String notificationStaffDeclinedBody(String name, String event);

  /// No description provided for @notificationEventLiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Your event is live'**
  String get notificationEventLiveTitle;

  /// No description provided for @notificationEventLiveBody.
  ///
  /// In en, this message translates to:
  /// **'\"{event}\" is now live'**
  String notificationEventLiveBody(String event);

  /// No description provided for @notificationTimeNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get notificationTimeNow;

  /// No description provided for @notificationTimeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String notificationTimeMinutes(int count);

  /// No description provided for @notificationTimeHours.
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String notificationTimeHours(int count);

  /// No description provided for @notificationTimeDays.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String notificationTimeDays(int count);

  /// No description provided for @notificationTicketsPurchasedBody.
  ///
  /// In en, this message translates to:
  /// **'{buyer} bought {count} tickets for "{event}"'**
  String notificationTicketsPurchasedBody(String buyer, int count, String event);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
