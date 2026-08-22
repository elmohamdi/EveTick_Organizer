// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get commonSkip => 'Skip';

  @override
  String get commonNext => 'Next';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonConfirmSelection => 'Confirm Selection';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonDone => 'Done!';

  @override
  String get commonSave => 'Save';

  @override
  String get commonPost => 'Post';

  @override
  String get commonFollow => 'Follow';

  @override
  String get commonFollowing => 'Following';

  @override
  String get commonManage => 'Manage';

  @override
  String get commonShare => 'Share';

  @override
  String get commonReadMore => 'Read More';

  @override
  String get commonViewAll => 'View All';

  @override
  String get commonSeeAll => 'See All';

  @override
  String get commonLoadMoreReviews => 'Load More Reviews';

  @override
  String get commonBackToHome => 'Back to Home';

  @override
  String get commonOr => 'or';

  @override
  String get commonBookNow => 'Book Now';

  @override
  String get commonSoldOut => 'Sold Out';

  @override
  String get commonWaitlist => 'WAITLIST';

  @override
  String commonFromPrice(String price) {
    return 'From \$$price';
  }

  @override
  String get onboardingAppName => 'EveTick';

  @override
  String get onboardingSlide1Title => 'Discover Local \n Events';

  @override
  String get onboardingSlide1Subtitle =>
      'Find and book tickets for concerts, cinema, and more happening right in your city';

  @override
  String get onboardingSlide2Title => 'Seamless Booking';

  @override
  String get onboardingSlide2Subtitle =>
      'Secure your spot in seconds with our fast and easy checkout process';

  @override
  String get onboardingWelcomeTitle => 'Discover Events\nYou ';

  @override
  String get onboardingWelcomeTitleRemain => 'Love';

  @override
  String get onboardingWelcomeSubtitle => 'Join the community of event seekers';

  @override
  String get locationSetLocationTitle => 'Where are You?';

  @override
  String get onboardingLocationPermissionNotice =>
      'To show you events near you, we need your location permission.';

  @override
  String get locationSelectLocationTitle => 'Select Location';

  @override
  String get locationSearchPlaceholder => 'Search for city, street, or venue';

  @override
  String get locationUseCurrentLocation => 'Use Current Location';

  @override
  String get locationCurrentCity => 'London, United Kingdom';

  @override
  String get locationPopularCities => 'Popular Cities';

  @override
  String get locationSelectGovernorate => 'Select Governorate';

  @override
  String get locationChooseGovernorate => 'Choose Governorate';

  @override
  String get locationNearbyLocations => 'Nearby Locations';

  @override
  String get locationSelectManually => 'Select Manually';

  @override
  String locationDistanceAway(String distance) {
    return '$distance miles away';
  }

  @override
  String locationRecentSearch(String city) {
    return 'Recent Search, $city';
  }

  @override
  String get locationCitiesLondon => 'London';

  @override
  String get locationCitiesNewYork => 'New York';

  @override
  String get locationCitiesSanFrancisco => 'San Francisco';

  @override
  String get locationCitiesDubai => 'Dubai';

  @override
  String get locationVenueWestminster => 'Westminster, London';

  @override
  String get locationVenueMadisonSquareGarden => 'Madison Square Garden';

  @override
  String get authSignIn => 'Sign in';

  @override
  String get authSignUp => 'Sign up';

  @override
  String get authContinueWithGoogle => 'Continue with Google';

  @override
  String get authContinueWithFacebook => 'Continue with Facebook';

  @override
  String get authContinueAsGuest => 'Continue as guest';

  @override
  String get authNoAccountPrompt => 'Don\'t have an account? ';

  @override
  String get authNoAccountPromptRemain => 'Sign up';

  @override
  String get authHasAccountPrompt => 'Already have an account? ';

  @override
  String get authHasAccountPromptRemain => 'Sign in';

  @override
  String get authEmailAddressLabel => 'Email Address';

  @override
  String get authEmailPlaceholder => 'Enter your email';

  @override
  String get authEmailPlaceholderContinue => 'Enter your email to continue';

  @override
  String get authFullNameLabel => 'Full Name';

  @override
  String get authFullNamePlaceholder => 'Enter your Name';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authPasswordPlaceholder => 'Enter your password';

  @override
  String get authVerifyTitle => 'Verify';

  @override
  String get authVerificationCodeLabel => 'Verification Code';

  @override
  String authVerificationSentNotice(String email) {
    return 'Check your email for the code sent to $email';
  }

  @override
  String get authResendCodePrompt => 'Didn\'t receive the code? Resend';

  @override
  String get authRegistrationSuccess => 'Successfully registered to EveTick';

  @override
  String get authStartExploring => 'Start Exploring';

  @override
  String get homeSearchPlaceholder => 'Search for concerts, cinema...';

  @override
  String get homeSearchSuggestionExample => 'Jazz concerts in London';

  @override
  String get homeFiltersAll => 'All';

  @override
  String get homeFiltersEvents => 'Events';

  @override
  String get homeFiltersTickets => 'Tickets';

  @override
  String get homeFiltersConcerts => 'Concerts';

  @override
  String get homeFiltersCinema => 'Cinema';

  @override
  String get homeFiltersTrips => 'Trips';

  @override
  String get homeFiltersSports => 'Sports';

  @override
  String get homeFiltersWorkshops => 'Workshops';

  @override
  String get homeFiltersNightlife => 'Nightlife';

  @override
  String get homeFiltersFreeEvents => 'Free Events';

  @override
  String get homeSortOptionsTrendingNow => 'Trending Now';

  @override
  String get homeSortOptionsUpcoming => 'Upcoming';

  @override
  String get homeSortOptionsThisWeekend => 'This weekend';

  @override
  String get homeSortOptionsPriceLowToHigh => 'Price: Low to High';

  @override
  String homeResultsFound(String count) {
    return '$count results found';
  }

  @override
  String get homeFeaturedEvents => 'Featured Events';

  @override
  String get homePopularEvents => 'Popular Events';

  @override
  String get homeBadgesTopSelling => 'TOP SELLING';

  @override
  String get homeBadgesBestValue => 'BEST VALUE';

  @override
  String get homeBadgesTrending => 'TRENDING';

  @override
  String get homeBadgesHighDemand => 'HIGH DEMAND';

  @override
  String get homeBadgesBestPrice => 'BEST PRICE';

  @override
  String get homeBadgesEarlyBird => 'Early Bird';

  @override
  String homeEventPrice(String price) {
    return '\$$price';
  }

  @override
  String get searchRecentSearches => 'Recent Searches';

  @override
  String get searchClearAll => 'Clear All';

  @override
  String get searchSortBy => 'Sort by';

  @override
  String get searchSortOptionsPopularity => 'Popularity';

  @override
  String get searchSortOptionsDate => 'Date';

  @override
  String get searchSortOptionsDistance => 'Distance';

  @override
  String get searchFilterAndRefine => 'Filter & Refine';

  @override
  String get searchApplyFilters => 'Apply Filters';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String notificationsTimeAgoJustNow(String minutes) {
    return '${minutes}M AGO';
  }

  @override
  String notificationsTimeAgoHoursAgo(String hours) {
    return '${hours}H AGO';
  }

  @override
  String notificationsTimeAgoDaysAgo(String days) {
    return '$days DAYS AGO';
  }

  @override
  String get notificationsTimeAgoYesterday => 'YESTERDAY';

  @override
  String get notificationsTimeAgoEarlier => 'EARLIER';

  @override
  String get notificationsHotDealTitle => 'Hot Deal: Summer Fest 2024';

  @override
  String get notificationsHotDealBody =>
      'Get 20% off on Early Bird tickets for the biggest summer music festival....';

  @override
  String get notificationsNewEventTitle => 'New Event Near You!';

  @override
  String get notificationsNewEventBody =>
      'Techno Night with DJ Spark is happening this Friday at The...';

  @override
  String get notificationsTicketConfirmedTitle => 'Ticket Confirmed';

  @override
  String get notificationsTicketConfirmedBody =>
      'Your booking for \"Jazz Under Stars\" is confirmed. See you there!';

  @override
  String get notificationsArtistFollowedTitle => 'Artist You Follow';

  @override
  String get notificationsArtistFollowedBody =>
      'Coldplay just announced a new world tour dates. Stay tuned for tickets!';

  @override
  String get notificationsProfileUpdatedTitle => 'Profile Updated';

  @override
  String get notificationsProfileUpdatedBody =>
      'You have successfully updated your payment method.';

  @override
  String get eventDetailsEventLocation => 'Event Location';

  @override
  String get eventDetailsVenueExamplesExcelCentre => 'Excel Centre, London';

  @override
  String get eventDetailsVenueExamplesWembleyStadium => 'Wembley Stadium';

  @override
  String get eventDetailsVenueExamplesGrandEgyptianMuseum =>
      'Grand Egyptian Museum';

  @override
  String get eventDetailsVenueExamplesTheGrandArena =>
      'The Grand Arena, Downtown';

  @override
  String get eventDetailsVenueExamplesSiliconValleyCenter =>
      'Silicon Valley Center, CA';

  @override
  String get eventDetailsDescriptionTitle => 'Description';

  @override
  String get eventDetailsDescriptionExample =>
      'Experience the ultimate summer music festival featuring top global artists, immersive art installations, and a diverse culinary selection. This year\'s lineup includes headliners that will keep you dancing under the stars... Read More';

  @override
  String get eventDetailsDateLabel => 'Date';

  @override
  String get eventDetailsTimeLabel => 'Time';

  @override
  String eventDetailsPriceFrom(String price) {
    return 'From \$$price';
  }

  @override
  String get eventDetailsPerksVipAccess => 'VIP Access';

  @override
  String get eventDetailsPerksBackstageLounge => 'Backstage lounge access.';

  @override
  String get eventDetailsPerksComplimentaryDrinks =>
      '2 Complimentary drink vouchers.';

  @override
  String get eventDetailsPerksPremiumViewing => 'Premium viewing area.';

  @override
  String get eventDetailsPerksMeetAndGreet => 'Meet and Greet with performers.';

  @override
  String get eventDetailsPerksIncludesVipPerks => 'Includes all VIP perks.';

  @override
  String get eventDetailsPerksStandardEntry => 'Includes standard entry.';

  @override
  String get eventDetailsPerksLimitedQuantities =>
      'Limited quantities for our early supporters.';

  @override
  String get ticketsSelectTicketsTitle => 'Select Tickets';

  @override
  String get ticketsVenueName => 'Main Arena Hall';

  @override
  String ticketsStepIndicator(String step, String total) {
    return 'Step $step OF $total';
  }

  @override
  String get ticketsStepTicketSelection => 'Ticket Selection';

  @override
  String get ticketsStepCheckout => 'Checkout';

  @override
  String get ticketsStepPayment => 'Payment';

  @override
  String get ticketsAvailable => 'Available';

  @override
  String get ticketsReserved => 'Reserved';

  @override
  String get ticketsSelected => 'Selected';

  @override
  String get ticketsTicketTypesGeneralAdmission => 'General Admission';

  @override
  String get ticketsTicketTypesVipAccess => 'VIP Access';

  @override
  String get ticketsTicketTypesBackstagePass => 'Backstage Pass';

  @override
  String ticketsTicketCountSelected(String count) {
    return '$count ticket selected';
  }

  @override
  String get ticketsTotalPrice => 'TOTAL PRICE';

  @override
  String get ticketsPlusServiceFee => '+ Service fee';

  @override
  String get ticketsSelectedSeats => 'Selected Seats';

  @override
  String get ticketsPricePerTicket => 'Price per ticket';

  @override
  String get ticketsContinueToCheckout => 'Continue to Checkout';

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String get checkoutBookingSummary => 'Booking Summary';

  @override
  String checkoutTicketQuantityTypeExample(String count, String ticket_type) {
    return '${count}X $ticket_type';
  }

  @override
  String get checkoutTicketTypeGeneralAdmission => 'GENERAL ADMISSION';

  @override
  String get checkoutAttendeeLabel => 'Attendee';

  @override
  String get checkoutSeatLabel => 'Seat';

  @override
  String get checkoutCategoryLabel => 'Category';

  @override
  String get checkoutCardholderNamePlaceholderExample => 'Ahmed Mohamed';

  @override
  String get checkoutExpiryDatePlaceholder => 'MM/YY';

  @override
  String get checkoutCvvPlaceholder => '***';

  @override
  String get checkoutProceedToPayment => 'Proceed to Payment';

  @override
  String get paymentPaymentMethod => 'Payment Method';

  @override
  String get paymentMethodsCreditCard => 'Credit Card';

  @override
  String get paymentMethodsApplePay => 'Apple Pay';

  @override
  String get paymentMethodsPaypal => 'PayPal';

  @override
  String get paymentCardNumberLabel => 'Card Number';

  @override
  String get paymentCardNumberPlaceholder => '0000 0000 0000 0000';

  @override
  String get paymentCardholderNameLabel => 'Cardholder Name';

  @override
  String get paymentExpiryDateLabel => 'Expiry Date';

  @override
  String get paymentCvvLabel => 'CVV';

  @override
  String get paymentSubtotal => 'Subtotal';

  @override
  String get paymentServiceFee => 'Service Fee';

  @override
  String get paymentTaxes => 'Taxes';

  @override
  String get paymentTotalPrice => 'Total Price';

  @override
  String get paymentSecurePaymentNotice => 'SECURE SSL ENCRYPTED PAYMENT';

  @override
  String get paymentPayNow => 'Pay Now';

  @override
  String get confirmationTitle => 'Confirmation';

  @override
  String get confirmationPaymentSuccessful => 'Payment Successful!';

  @override
  String get confirmationTicketConfirmed => 'Ticket Confirmed';

  @override
  String confirmationOrderId(String id) {
    return 'Order ID #$id';
  }

  @override
  String get confirmationBookingId => 'Booking ID';

  @override
  String get confirmationTotalPaid => 'Total Paid';

  @override
  String get confirmationViewTicket => 'View Ticket';

  @override
  String get confirmationScanAtEntrance => 'SCAN AT ENTRANCE';

  @override
  String confirmationTicketId(String id) {
    return 'Ticket ID: #$id';
  }

  @override
  String get confirmationViewOnMap => 'View on Map';

  @override
  String get profileMyProfile => 'My Profile';

  @override
  String get profilePremiumAttendee => 'Premium Attendee';

  @override
  String profilePremiumMemberSince(String year) {
    return 'Premium Member since $year';
  }

  @override
  String get profilePersonalInfo => 'Personal Info';

  @override
  String get profilePersonalInfoSubtitle => 'Email, phone, Address';

  @override
  String get profileEditProfile => 'Edit Profile';

  @override
  String get profileFullNameLabel => 'Full Name';

  @override
  String get profileEmailAddressLabel => 'Email Address';

  @override
  String get profilePhoneNumberLabel => 'Phone Number';

  @override
  String get profilePhysicalAddressLabel => 'Physical Address';

  @override
  String get profileAddressExample => '7 Posta Street, Eldekhila, Alexandria';

  @override
  String get profilePhoneExample => '+20 127 1734 638';

  @override
  String get profileAddPhotosOptional => 'Add Photos (optional)';

  @override
  String get profileUpload => 'UPLOAD';

  @override
  String get profileAccountSection => 'Account';

  @override
  String get profilePreferencesSection => 'Perferences';

  @override
  String get profilePreferencesRowsLanguage => 'Language';

  @override
  String get profilePreferencesRowsAppearance => 'Appearance';

  @override
  String get profilePreferencesRowsNotifications => 'Notifications';

  @override
  String get profileAppearanceValuesDarkMode => 'Dark Mode';

  @override
  String get profileAppearanceValuesLightMode => 'Light Mode';

  @override
  String get profileLanguageValueExample => 'English (US)';

  @override
  String get profileTabsMyTickets => 'My Tickets';

  @override
  String get profileTabsFavorites => 'Favorites';

  @override
  String get profileTabsReviewsAndRatings => 'Reviews & Ratings';

  @override
  String get profileTabsFollowingArtists => 'Following Artists';

  @override
  String get profileTabsFollowingOrganizers => 'Following Organizers';

  @override
  String get profileTicketStatusUpcoming => 'Upcoming';

  @override
  String get profileTicketStatusPast => 'Past';

  @override
  String get profileTicketStatusConfirmed => 'CONFIRMED';

  @override
  String get profileTicketStatusCompleted => 'COMPLETED';

  @override
  String get profileTicketStatusActive => 'ACTIVE';

  @override
  String get profileSearchOrganizersPlaceholder => 'Search organizers';

  @override
  String get profileSearchArtistsPlaceholder => 'Search artists...';

  @override
  String profileOrganizersCount(String count) {
    return 'Organizers ($count)';
  }

  @override
  String profileFollowersCount(String count) {
    return '$count Followers';
  }

  @override
  String get profileSupportSection => 'Support';

  @override
  String get profileAccount => 'Account';

  @override
  String get profileSettings => 'Settings';

  @override
  String get profileHelpCenter => 'Help Center';

  @override
  String get profileTermsOfService => 'Terms of Service';

  @override
  String get profileLogOut => 'Log Out';

  @override
  String get myTicketsTitle => 'My Tickets';

  @override
  String get myTicketsTabsUpcoming => 'Upcoming';

  @override
  String get myTicketsTabsPast => 'Past';

  @override
  String myTicketsTicketIdLabel(String id) {
    return 'Ticket ID: #$id';
  }

  @override
  String get myTicketsSampleEventsAiFutureTech => 'AI & Future Technology';

  @override
  String get myTicketsSampleEventsNeonNights => 'Neon Nights';

  @override
  String get myTicketsSampleEventsIndieFolkFestival => 'Indie Folk Festival';

  @override
  String get myTicketsSampleEventsWomenCooking => 'Women Cooking';

  @override
  String get myTicketsSampleEventsSummerJazzNight => 'Summer Jazz Night';

  @override
  String get myTicketsSampleEventsDigitalArtExpo => 'Digital Art Expo';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesCategoryMusic => 'Music';

  @override
  String get favoritesSampleEventsSummerSoundwave => 'Summer Soundwave 2024';

  @override
  String get favoritesSampleEventsGlobalInnovationSummit =>
      'Global Innovation Summit';

  @override
  String get artistOrganizerViewProfile => 'View Profile';

  @override
  String get artistOrganizerFollowers => 'Followers';

  @override
  String get artistOrganizerUpcomingEvents => 'Upcoming Events';

  @override
  String get artistOrganizerEventsHosted => 'Events Hosted';

  @override
  String artistOrganizerShowsCount(String count) {
    return '$count Shows';
  }

  @override
  String get artistOrganizerAbout => 'About';

  @override
  String get artistOrganizerGallery => 'Gallery';

  @override
  String get artistOrganizerUpcomingTours => 'Upcoming Tours';

  @override
  String get artistOrganizerUpcomingEventsViewAll =>
      'Upcoming Events (View All)';

  @override
  String artistOrganizerShowsCountFull(String count) {
    return '$count Shows';
  }

  @override
  String artistOrganizerEventsHostedCount(String count) {
    return '$count';
  }

  @override
  String artistOrganizerFollowersCountShort(String count) {
    return '$count';
  }

  @override
  String get artistOrganizerFindMoreArtists => 'Find More Artists';

  @override
  String get artistOrganizerTabsUpcoming => 'Upcoming';

  @override
  String get artistOrganizerTabsPastEvents => 'Past Events';

  @override
  String get artistOrganizerTabsReviews => 'Reviews';

  @override
  String get artistOrganizerArtistBioExample =>
      'Abel Makkonen Tesfaye, known professionally as The Weeknd, is a Canadian singer-songwriter and record producer. Known for his sonic versatility and dark lyricism... Read More';

  @override
  String get artistOrganizerOrganizerBioExample =>
      'Global Concerts Inc. is a premier event organizer specializing in international music festivals and live stadium performances. Bringing the world\'s best talent to your city.';

  @override
  String get artistOrganizerBandLabel => 'Band';

  @override
  String get artistOrganizerArtistLabel => 'Artist';

  @override
  String get reviewsTitle => 'Reviews & Ratings';

  @override
  String reviewsOverallRating(String rating) {
    return '$rating';
  }

  @override
  String reviewsReviewsCountTotal(String count) {
    return '$count Reviews';
  }

  @override
  String reviewsRatingBarLabel(String stars) {
    return '$stars';
  }

  @override
  String get reviewsWriteAReview => 'Write a Review';

  @override
  String get reviewsHowWasYourExperience => 'HOW WAS YOUR EXPERIENCE?';

  @override
  String get reviewsShareExperiencePlaceholder =>
      'Share your experience with others...';

  @override
  String get reviewsPostAnonymously => 'Post Anonymously';

  @override
  String get reviewsAnonymousNote => 'Your name won\'t be visible to others';

  @override
  String reviewsReviewsCount(String count) {
    return '$count Reviews';
  }

  @override
  String reviewsVerifiedAttendee(String time) {
    return 'Verified Attendee • $time ago';
  }

  @override
  String reviewsHelpfulCount(String count) {
    return 'Helpful ($count)';
  }

  @override
  String get reviewsReply => 'Reply';

  @override
  String get reviewsReviewExample1 =>
      'The atmosphere was electric! Sound quality was 10/10. Definitely worth the price. The staff was super helpful when we couldn\'t find our seats.';

  @override
  String get reviewsReviewExample2 =>
      'Overall great experience! Only downside was the long queue for beverages. I recommend arriving early if you want to grab drinks before the show starts.';

  @override
  String get reviewsReviewExample3 =>
      'Unbelievable night! The light show was synchronized perfectly with the bass. I\'ve been to many events, but EveTick always makes booking so seamless.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsAppearanceSubtitle =>
      'Choose how EveTick looks on your device.';

  @override
  String get settingsLightMode => 'Light';

  @override
  String get settingsLightModeSubtitle => 'Always bright and clear';

  @override
  String get settingsDarkMode => 'Dark';

  @override
  String get settingsDarkModeSubtitle => 'Easier on the eyes in low light';

  @override
  String get settingsSelectLanguage => 'Select Language';

  @override
  String get settingsDefaultLanguage => 'Default language';

  @override
  String get settingsArabicLanguage => 'Arabic language';

  @override
  String get settingsLanguageOptionsEnglish => 'English';

  @override
  String get settingsLanguageOptionsArabic => 'Arabic';

  @override
  String get settingsApplyChanges => 'Apply Changes';

  @override
  String get settingsApplySelection => 'Apply Selection';

  @override
  String get helpSupportTitle => 'Help & Support';

  @override
  String get helpSupportHowCanWeHelp => 'How can we help?';

  @override
  String get helpSupportWhatCanWeHelpWith => 'WHAT CAN WE HELP WITH?';

  @override
  String get helpSupportSelectCategory => 'Select Category';

  @override
  String get helpSupportCategoriesAccount => 'Account';

  @override
  String get helpSupportCategoriesBooking => 'Booking';

  @override
  String get helpSupportCategoriesPayment => 'Payment';

  @override
  String get helpSupportCategoriesOrganizerHelp => 'Organizer Help';

  @override
  String get helpSupportFrequentQuestions => 'Frequent Questions';

  @override
  String get helpSupportFaqRefundQuestion => 'How do I refund a ticket?';

  @override
  String get helpSupportFaqRefundAnswer =>
      'You can request a refund directly through the \'My Tickets\' section if the event organizer allows it. Usually, refunds are processed within 5-7 business days to your original payment method.';

  @override
  String get helpSupportFaqQrCodeQuestion => 'Where can I find my QR code?';

  @override
  String get helpSupportFaqTransferQuestion =>
      'Can I transfer my tickets to a friend?';

  @override
  String get helpSupportFaqProfilePhotoQuestion =>
      'How do I change my profile photo?';

  @override
  String get helpSupportStillNeedHelp => 'Still need help?';

  @override
  String get helpSupportSupportAvailabilityNotice =>
      'Our support team is available 24/7 to assist you with any issues.';

  @override
  String get helpSupportContactSupport => 'Contact Support';

  @override
  String get helpSupportSendMessageTitle => 'Send Us a Message';

  @override
  String get helpSupportYourMessageLabel => 'Your Message';

  @override
  String get helpSupportMessagePlaceholder =>
      'Describe your issue or feedback in detail here...';

  @override
  String get helpSupportAttachmentsOptional => 'ATTACHMENTS (OPTIONAL)';

  @override
  String get helpSupportUploadScreenshot => 'Upload Screenshot';

  @override
  String get helpSupportSupportedFormatsNotice =>
      'Supported formats: PNG, JPG (Max 5MB)';

  @override
  String get helpSupportResponseTimeNotice =>
      'Our support team typically responds within 24 hours. For urgent ticket issues, please check our FAQ section.';

  @override
  String get helpSupportSendMessage => 'Send Message';

  @override
  String get termsTitle => 'Terms of Service';

  @override
  String get termsSubtitle => 'Terms and Services';

  @override
  String termsLastUpdated(String date) {
    return 'Last updated: $date';
  }

  @override
  String get termsSectionsAcceptanceTitle => 'Acceptance of Terms';

  @override
  String get termsSectionsAcceptanceBody1 =>
      'By accessing or using the EveTick platform, you agree to be bound by these Terms and Services. These terms constitute a legally binding agreement between you and EveTick Inc.';

  @override
  String get termsSectionsAcceptanceBody2 =>
      'If you do not agree to all of these terms, please do not use our services. We reserve the right to change or modify these terms at any time.';

  @override
  String get termsSectionsEligibilityTitle => 'User Eligibility';

  @override
  String get termsSectionsEligibilityBody =>
      'You must be at least 18 years of age to use the Services. By creating an account, you represent and warrant that you have the right, authority, and capacity to enter into this agreement.';

  @override
  String get termsSectionsEligibilityListItem1 =>
      'Provide accurate registration information';

  @override
  String get termsSectionsEligibilityListItem2 =>
      'Maintain the security of your password.';

  @override
  String get termsSectionsEligibilityListItem3 =>
      'Promptly update any information changes.';

  @override
  String get termsSectionsTicketPurchaseTitle => 'Ticket Purchase & Refunds';

  @override
  String get termsSectionsTicketPurchaseBody =>
      'All sales are final unless an event is cancelled or rescheduled. EveTick acts as an intermediary between event organizers and attendees. Please review our Refund Policy for specific details regarding venue-specific cancellations.';

  @override
  String get termsSectionsProhibitedConductTitle => 'Prohibited Conduct';

  @override
  String get termsSectionsProhibitedConductIntro =>
      'Users are strictly prohibited from:';

  @override
  String get termsSectionsProhibitedConductListItem1 =>
      'Reselling tickets at a price higher than the original face value on third-party platforms.';

  @override
  String get termsSectionsProhibitedConductListItem2 =>
      'Attempting to circumvent security features or API limitations.';

  @override
  String get termsSectionsProhibitedConductListItem3 =>
      'Impersonating any person or entity or misrepresenting your affiliation.';

  @override
  String get termsSectionsIpTitle => 'Intellectual Property';

  @override
  String get termsSectionsIpBody =>
      'The EveTick name, logo, and all related designs are trademarks of EveTick Inc. You may not use these without prior written permission.';

  @override
  String get termsSectionsLiabilityTitle => 'Limitation of Liability';

  @override
  String get termsSectionsLiabilityBody =>
      'To the maximum extent permitted by law, EveTick shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your access to or use of the services.';

  @override
  String get termsDecline => 'Decline';

  @override
  String get termsAgreeAndContinue => 'Agree & Continue';

  @override
  String get profilePersonalInfoTitle => 'Personal Info';

  @override
  String get profileFullName => 'Full Name';

  @override
  String get profileFullNameHint => 'Enter your full name';

  @override
  String get profileFullNameRequired => 'Name is required';

  @override
  String get profileEmail => 'Email';

  @override
  String get profileEmailHint => 'Enter your email';

  @override
  String get profilePhone => 'Phone Number';

  @override
  String get profilePhoneHint => 'Enter your phone number';

  @override
  String get profilePhoneInvalid => 'Invalid phone number';

  @override
  String get profileAddress => 'Physical Address';

  @override
  String get profileAddressHint => 'Enter your address';

  @override
  String get profileAddressRequired => 'Address is required';

  @override
  String get profileSave => 'Save';

  @override
  String get profileUpdatedSuccess => 'Profile updated successfully.';

  @override
  String get profileTheme => 'Theme';

  @override
  String get profileThemeSystem => 'System Default';

  @override
  String get profileThemeLight => 'Light Mode';

  @override
  String get profileThemeDark => 'Dark Mode';
}
