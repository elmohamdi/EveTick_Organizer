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
  String get onboardingSlide1Subtitle => 'Find and book tickets for concerts, cinema, and more happening right in your city';

  @override
  String get onboardingSlide2Title => 'Seamless Booking';

  @override
  String get onboardingSlide2Subtitle => 'Secure your spot in seconds with our fast and easy checkout process';

  @override
  String get onboardingWelcomeTitle => 'Manage Your Events\nLike ';

  @override
  String get onboardingWelcomeTitleRemain => 'a Pro';

  @override
  String get onboardingWelcomeSubtitle => 'Create, manage, and grow your events with ease.';

  @override
  String get locationSetLocationTitle => 'Where are You?';

  @override
  String get onboardingLocationPermissionNotice => 'To show you events near you, we need your location permission.';

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
  String get notificationsHotDealBody => 'Get 20% off on Early Bird tickets for the biggest summer music festival....';

  @override
  String get notificationsNewEventTitle => 'New Event Near You!';

  @override
  String get notificationsNewEventBody => 'Techno Night with DJ Spark is happening this Friday at The...';

  @override
  String get notificationsTicketConfirmedTitle => 'Ticket Confirmed';

  @override
  String get notificationsTicketConfirmedBody => 'Your booking for \"Jazz Under Stars\" is confirmed. See you there!';

  @override
  String get notificationsArtistFollowedTitle => 'Artist You Follow';

  @override
  String get notificationsArtistFollowedBody => 'Coldplay just announced a new world tour dates. Stay tuned for tickets!';

  @override
  String get notificationsProfileUpdatedTitle => 'Profile Updated';

  @override
  String get notificationsProfileUpdatedBody => 'You have successfully updated your payment method.';

  @override
  String get eventDetailsEventLocation => 'Event Location';

  @override
  String get eventDetailsVenueExamplesExcelCentre => 'Excel Centre, London';

  @override
  String get eventDetailsVenueExamplesWembleyStadium => 'Wembley Stadium';

  @override
  String get eventDetailsVenueExamplesGrandEgyptianMuseum => 'Grand Egyptian Museum';

  @override
  String get eventDetailsVenueExamplesTheGrandArena => 'The Grand Arena, Downtown';

  @override
  String get eventDetailsVenueExamplesSiliconValleyCenter => 'Silicon Valley Center, CA';

  @override
  String get eventDetailsDescriptionTitle => 'Description';

  @override
  String get eventDetailsDescriptionExample => 'Experience the ultimate summer music festival featuring top global artists, immersive art installations, and a diverse culinary selection. This year\'s lineup includes headliners that will keep you dancing under the stars... Read More';

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
  String get eventDetailsPerksComplimentaryDrinks => '2 Complimentary drink vouchers.';

  @override
  String get eventDetailsPerksPremiumViewing => 'Premium viewing area.';

  @override
  String get eventDetailsPerksMeetAndGreet => 'Meet and Greet with performers.';

  @override
  String get eventDetailsPerksIncludesVipPerks => 'Includes all VIP perks.';

  @override
  String get eventDetailsPerksStandardEntry => 'Includes standard entry.';

  @override
  String get eventDetailsPerksLimitedQuantities => 'Limited quantities for our early supporters.';

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
  String get favoritesSampleEventsGlobalInnovationSummit => 'Global Innovation Summit';

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
  String get artistOrganizerUpcomingEventsViewAll => 'Upcoming Events (View All)';

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
  String get artistOrganizerArtistBioExample => 'Abel Makkonen Tesfaye, known professionally as The Weeknd, is a Canadian singer-songwriter and record producer. Known for his sonic versatility and dark lyricism... Read More';

  @override
  String get artistOrganizerOrganizerBioExample => 'Global Concerts Inc. is a premier event organizer specializing in international music festivals and live stadium performances. Bringing the world\'s best talent to your city.';

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
  String get reviewsShareExperiencePlaceholder => 'Share your experience with others...';

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
  String get reviewsReviewExample1 => 'The atmosphere was electric! Sound quality was 10/10. Definitely worth the price. The staff was super helpful when we couldn\'t find our seats.';

  @override
  String get reviewsReviewExample2 => 'Overall great experience! Only downside was the long queue for beverages. I recommend arriving early if you want to grab drinks before the show starts.';

  @override
  String get reviewsReviewExample3 => 'Unbelievable night! The light show was synchronized perfectly with the bass. I\'ve been to many events, but EveTick always makes booking so seamless.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsAppearanceSubtitle => 'Choose how EveTick looks on your device.';

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
  String get helpSupportFaqRefundAnswer => 'You can request a refund directly through the \'My Tickets\' section if the event organizer allows it. Usually, refunds are processed within 5-7 business days to your original payment method.';

  @override
  String get helpSupportFaqQrCodeQuestion => 'Where can I find my QR code?';

  @override
  String get helpSupportFaqTransferQuestion => 'Can I transfer my tickets to a friend?';

  @override
  String get helpSupportFaqProfilePhotoQuestion => 'How do I change my profile photo?';

  @override
  String get helpSupportStillNeedHelp => 'Still need help?';

  @override
  String get helpSupportSupportAvailabilityNotice => 'Our support team is available 24/7 to assist you with any issues.';

  @override
  String get helpSupportContactSupport => 'Contact Support';

  @override
  String get helpSupportSendMessageTitle => 'Send Us a Message';

  @override
  String get helpSupportYourMessageLabel => 'Your Message';

  @override
  String get helpSupportMessagePlaceholder => 'Describe your issue or feedback in detail here...';

  @override
  String get helpSupportAttachmentsOptional => 'ATTACHMENTS (OPTIONAL)';

  @override
  String get helpSupportUploadScreenshot => 'Upload Screenshot';

  @override
  String get helpSupportSupportedFormatsNotice => 'Supported formats: PNG, JPG (Max 5MB)';

  @override
  String get helpSupportResponseTimeNotice => 'Our support team typically responds within 24 hours. For urgent ticket issues, please check our FAQ section.';

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
  String get termsSectionsAcceptanceBody1 => 'By accessing or using the EveTick platform, you agree to be bound by these Terms and Services. These terms constitute a legally binding agreement between you and EveTick Inc.';

  @override
  String get termsSectionsAcceptanceBody2 => 'If you do not agree to all of these terms, please do not use our services. We reserve the right to change or modify these terms at any time.';

  @override
  String get termsSectionsEligibilityTitle => 'User Eligibility';

  @override
  String get termsSectionsEligibilityBody => 'You must be at least 18 years of age to use the Services. By creating an account, you represent and warrant that you have the right, authority, and capacity to enter into this agreement.';

  @override
  String get termsSectionsEligibilityListItem1 => 'Provide accurate registration information';

  @override
  String get termsSectionsEligibilityListItem2 => 'Maintain the security of your password.';

  @override
  String get termsSectionsEligibilityListItem3 => 'Promptly update any information changes.';

  @override
  String get termsSectionsTicketPurchaseTitle => 'Ticket Purchase & Refunds';

  @override
  String get termsSectionsTicketPurchaseBody => 'All sales are final unless an event is cancelled or rescheduled. EveTick acts as an intermediary between event organizers and attendees. Please review our Refund Policy for specific details regarding venue-specific cancellations.';

  @override
  String get termsSectionsProhibitedConductTitle => 'Prohibited Conduct';

  @override
  String get termsSectionsProhibitedConductIntro => 'Users are strictly prohibited from:';

  @override
  String get termsSectionsProhibitedConductListItem1 => 'Reselling tickets at a price higher than the original face value on third-party platforms.';

  @override
  String get termsSectionsProhibitedConductListItem2 => 'Attempting to circumvent security features or API limitations.';

  @override
  String get termsSectionsProhibitedConductListItem3 => 'Impersonating any person or entity or misrepresenting your affiliation.';

  @override
  String get termsSectionsIpTitle => 'Intellectual Property';

  @override
  String get termsSectionsIpBody => 'The EveTick name, logo, and all related designs are trademarks of EveTick Inc. You may not use these without prior written permission.';

  @override
  String get termsSectionsLiabilityTitle => 'Limitation of Liability';

  @override
  String get termsSectionsLiabilityBody => 'To the maximum extent permitted by law, EveTick shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your access to or use of the services.';

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

  @override
  String get onboardingCreateCustomize => 'Create & Customize';

  @override
  String get onboardingCreateCustomizeDescription => 'Create stunning event pages, add ticket types, and your preferences.';

  @override
  String get onboardingScanAndManage => 'Scan & Manage';

  @override
  String get onboardingScanningDescription => 'Use our powerful scanning tools to validate tickets and manage entry';

  @override
  String get onboardingDashboardTitle => 'All-in-One Dashboard';

  @override
  String get onboardingDashboardSubtitle => 'Get a real-time overview of your events,tickets, sales, and staff performance.';

  @override
  String get supportHelpTitle => 'Help & Support';

  @override
  String get supportSearchHint => 'How can we help?';

  @override
  String get supportClearSearch => 'Clear';

  @override
  String get supportCategoriesTitle => 'Categories';

  @override
  String get supportFrequentQuestionsTitle => 'Frequent Questions';

  @override
  String get supportCategoryAccount => 'Account';

  @override
  String get supportCategoryEvents => 'Events';

  @override
  String get supportCategoryTicketing => 'Tickets & Scanning';

  @override
  String get supportCategoryPayouts => 'Payouts';

  @override
  String get supportCategoryTechnical => 'Technical Issue';

  @override
  String get supportCategoryFeedback => 'Feedback & Suggestions';

  @override
  String get supportNoResultsTitle => 'No results found';

  @override
  String get supportNoResultsSubtitle => 'Try different keywords or send a message to our support team.';

  @override
  String get supportRetry => 'Try again';

  @override
  String get supportStillNeedHelpTitle => 'Still need help?';

  @override
  String get supportStillNeedHelpSubtitle => 'Our support team is available 24/7 to assist you with any issues.';

  @override
  String get supportContactSupport => 'Contact Support';

  @override
  String get supportSendMessageTitle => 'Send Us a Message';

  @override
  String get supportWhatCanWeHelpWith => 'What can we help with?';

  @override
  String get supportSelectCategory => 'Select Category';

  @override
  String get supportCategoryRequired => 'Please select a category';

  @override
  String get supportYourMessage => 'Your Message';

  @override
  String get supportMessageHint => 'Describe your issue or feedback in detail here...';

  @override
  String get supportMessageRequired => 'Please write your message';

  @override
  String get supportMessageTooShort => 'Your message must be at least 10 characters';

  @override
  String get supportAttachmentsOptional => 'Attachments (optional)';

  @override
  String get supportUploadScreenshot => 'Upload Screenshot';

  @override
  String get supportAttachmentHint => 'Supported formats: PNG, JPG (Max 5MB)';

  @override
  String get supportAttachmentRemove => 'Remove';

  @override
  String get supportAttachmentUnsupported => 'Only PNG and JPG images are supported';

  @override
  String get supportAttachmentTooLarge => 'This image is larger than 5MB';

  @override
  String get supportAttachmentLimit => 'You can attach up to 3 screenshots';

  @override
  String get supportAttachmentPickFailed => 'Could not open that image, please try again';

  @override
  String get supportNoticePrefix => 'Our support team typically responds within 24 hours. For urgent issues during a live event, please check our ';

  @override
  String get supportNoticeLink => 'FAQ section';

  @override
  String get supportNoticeSuffix => '.';

  @override
  String get supportSendMessage => 'Send Message';

  @override
  String get supportMessageSent => 'Message sent! We will get back to you within 24 hours.';

  @override
  String staffInvitationsTitle(int count) {
    return 'Staff invitations ($count)';
  }

  @override
  String get staffInvitationsCheckFailed => 'Couldn\'t check your invitations';

  @override
  String get staffInvitationsRetry => 'Retry';

  @override
  String staffInvitationAccepted(String eventTitle) {
    return 'You joined \"$eventTitle\"';
  }

  @override
  String get staffInvitationDeclined => 'Invitation declined';

  @override
  String staffInvitationInvitedAs(String name, String role) {
    return '$name invited you as $role';
  }

  @override
  String get staffAccept => 'Accept';

  @override
  String get staffDecline => 'Decline';

  @override
  String get staffSectionTitle => 'Staff';

  @override
  String get staffAdd => 'Add';

  @override
  String get staffLoadFailed => 'Could not load staff';

  @override
  String get staffTryAgain => 'Try again';

  @override
  String get staffEmptyMessage => 'No staff yet. Invite a co-organizer or gate staff by email and choose what they can do.';

  @override
  String get staffAddMember => 'Add staff member';

  @override
  String get staffCancelInvitationQuestion => 'Cancel invitation?';

  @override
  String get staffRemoveMemberQuestion => 'Remove staff member?';

  @override
  String staffCancelInvitationMessage(String email) {
    return 'The invitation sent to $email will be cancelled.';
  }

  @override
  String staffRemoveMemberMessage(String name) {
    return '$name will lose access to this event.';
  }

  @override
  String get staffKeep => 'Keep';

  @override
  String get staffCancelInvitation => 'Cancel invitation';

  @override
  String get staffRemove => 'Remove';

  @override
  String get staffAddMemberTitle => 'Add Staff Member';

  @override
  String get staffFullName => 'Full Name';

  @override
  String get staffFullNameHint => 'e.g. Alex Johnson';

  @override
  String get staffFullNameRequired => 'Please enter the full name';

  @override
  String get staffEmailAddress => 'Email Address';

  @override
  String get staffEmailHint => 'alex@example.com';

  @override
  String get staffEmailRequired => 'Please enter an email';

  @override
  String get staffEmailInvalid => 'Please enter a valid email';

  @override
  String get staffAssignRole => 'Assign Role';

  @override
  String get staffSelectRole => 'Select a role';

  @override
  String get staffRoleRequired => 'Please select a role';

  @override
  String get staffPermissions => 'PERMISSIONS';

  @override
  String get staffPermissionRequired => 'Select at least one permission';

  @override
  String staffInvitationSent(String email) {
    return 'Invitation sent to $email';
  }

  @override
  String get staffSendInvitation => 'Send Invitation';

  @override
  String get staffPending => 'PENDING';

  @override
  String get staffActive => 'ACTIVE';

  @override
  String get staffPermissionViewAnalytics => 'Can view analytics';

  @override
  String get staffPermissionViewAnalyticsDescription => 'Access to sales reports and charts';

  @override
  String get staffPermissionScanTickets => 'Can scan tickets';

  @override
  String get staffPermissionScanTicketsDescription => 'Use the mobile app for check-ins';

  @override
  String get staffPermissionEditEventDetails => 'Can edit event details';

  @override
  String get staffPermissionEditEventDetailsDescription => 'Change title, schedule and description';

  @override
  String get staffRoleCoOrganizer => 'Co-organizer';

  @override
  String get staffRoleManager => 'Manager';

  @override
  String get staffRoleGateStaff => 'Gate Staff';

  @override
  String get staffRoleAnalyst => 'Analyst';

  @override
  String get createEventScreenTitle => 'Create Event';

  @override
  String get createEventPhaseDetails => 'Details';

  @override
  String get createEventPhaseMedia => 'Media';

  @override
  String get createEventPhaseSeating => 'Seating';

  @override
  String get createEventPhaseTickets => 'Tickets';

  @override
  String get createEventPublishFailed => 'Something went wrong while publishing the event';

  @override
  String get createEventNextStep => 'Next Step';

  @override
  String get createEventTitleHint => 'Enter catchy event name';

  @override
  String get createEventTitleLabel => 'Event Title';

  @override
  String get createEventTitleRequired => 'Please enter event title';

  @override
  String get createEventCategoryLabel => 'Category';

  @override
  String get createEventCategoryHint => 'Select event category';

  @override
  String get createEventCategoryRequired => 'Please select a category';

  @override
  String get createEventStartDateTime => 'Start Date & Time';

  @override
  String get createEventEndDateTime => 'End Date & Time';

  @override
  String get createEventUrlLabel => 'Event URL';

  @override
  String get createEventUrlHint => 'Enter event URL (e.g. Zoom link)';

  @override
  String get createEventUrlRequired => 'Please enter event URL';

  @override
  String get createEventOnlineToggle => 'Online event (Virtual)';

  @override
  String get createEventSelectStart => 'Please select a start date & time';

  @override
  String get createEventSelectEnd => 'Please select an end date & time';

  @override
  String get createEventLocationRequired => 'Please enter the event location';

  @override
  String get createEventEndBeforeStart => 'End date & time must be after start date & time';

  @override
  String get createEventAddressNotFound => 'Could not get address from location';

  @override
  String createEventLocationError(String error) {
    return 'Error getting location: $error';
  }

  @override
  String get createEventLocationLabel => 'Event Location';

  @override
  String get createEventLocationHint => 'Search or enter location';

  @override
  String get createEventDateHint => 'mm/dd/yyyy';

  @override
  String get createEventCategorySports => 'Sports';

  @override
  String get createEventCategoryMusic => 'Music';

  @override
  String get createEventCategoryMedical => 'Medical';

  @override
  String get createEventCategoryMovies => 'Movies';

  @override
  String get createEventCategoryTechnology => 'Technology';

  @override
  String get createEventCategoryBusiness => 'Business';

  @override
  String get createEventCategoryEducation => 'Education';

  @override
  String get createEventCategoryEntertainment => 'Entertainment';

  @override
  String get createEventCategoryArtsCulture => 'Arts & Culture';

  @override
  String get createEventCategoryFoodDrink => 'Food & Drink';

  @override
  String get createEventCategoryHealthWellness => 'Health & Wellness';

  @override
  String get createEventCategoryTravelAdventure => 'Travel & Adventure';

  @override
  String get createEventCategoryGaming => 'Gaming';

  @override
  String get createEventCategoryFashion => 'Fashion';

  @override
  String get createEventCategoryNetworking => 'Networking';

  @override
  String get createEventCategoryWorkshops => 'Workshops';

  @override
  String get createEventCategoryConferences => 'Conferences';

  @override
  String get createEventCategoryExhibitions => 'Exhibitions';

  @override
  String get createEventCategoryFestivals => 'Festivals';

  @override
  String get createEventCategoryCharitySocial => 'Charity & Social';

  @override
  String get createEventMediaTitle => 'Media Files';

  @override
  String get createEventMediaSubtitle => 'Add visuals to attract more attendees';

  @override
  String get createEventCoverImage => 'Cover Image';

  @override
  String get createEventGalleryPhotos => 'Gallery Photos (Optional)';

  @override
  String createEventGalleryLimit(int max) {
    return 'maximum $max photos, up to 5MB each.';
  }

  @override
  String get createEventDescriptionHint => 'Tell your attendees what to expect this amazing event...';

  @override
  String get createEventCoverRequired => 'Please upload a cover image';

  @override
  String get createEventUploadCover => 'Upload Cover Photo';

  @override
  String get createEventRecommendedSize => 'Recommended size: 1200 x 675px';

  @override
  String get createEventVenueMap => 'Venue Map';

  @override
  String get createEventVenueMapSubtitle => 'Choose how attendees will be seated at this event.';

  @override
  String get createEventContinueToTickets => 'Continue to Tickets';

  @override
  String get createEventLayoutSeating => 'Seating';

  @override
  String get createEventLayoutSections => 'Sections';

  @override
  String get createEventSeatAvailable => 'Available';

  @override
  String get createEventSeatUnavailable => 'Unavailable';

  @override
  String get createEventAddSection => 'Add Section';

  @override
  String get createEventScreenLabel => 'SCREEN';

  @override
  String get createEventWalkway => 'WALKWAY';

  @override
  String get createEventMapSettings => 'Map Settings';

  @override
  String get createEventRows => 'Rows';

  @override
  String get createEventSeatsPerRow => 'Seats per Row';

  @override
  String get createEventSectionName => 'Section Name';

  @override
  String get createEventSectionNameHint => 'e.g. Stage A, VIP Zone.';

  @override
  String get createEventSectionNameRequired => 'Please enter a section name';

  @override
  String get createEventCapacity => 'Capacity';

  @override
  String get createEventCapacityHint => 'Enter number of spots.';

  @override
  String get createEventRequired => 'Required';

  @override
  String get createEventInvalid => 'Invalid';

  @override
  String get createEventTicketTiers => 'Ticket Tiers';

  @override
  String get createEventActiveTierOne => '1 active tier';

  @override
  String createEventActiveTiers(int count) {
    return '$count active tiers';
  }

  @override
  String get createEventAddTier => 'Add New Tier';

  @override
  String get createEventPublish => 'Publish Event';

  @override
  String get createEventTicketName => 'Ticket Name';

  @override
  String get createEventTicketNameHint => 'Enter your ticket name.';

  @override
  String get createEventTicketNameRequired => 'Please enter a ticket name';

  @override
  String get createEventPrice => 'Price';

  @override
  String get createEventPriceHint => 'Enter Your Price.';

  @override
  String get createEventInvalidPrice => 'Invalid price';

  @override
  String get createEventQuantity => 'Quantity';

  @override
  String get createEventQuantityHint => 'Enter Ticket Quantity.';

  @override
  String get createEventTicketDescription => 'Description';

  @override
  String get createEventTicketDescriptionHint => 'Enter Ticket Description.';

  @override
  String get createEventPaymentMethods => 'Payment Methods';

  @override
  String get createEventPaymentMethodsSubtitle => 'Choose where you want to receive your money.';

  @override
  String get createEventPaymentMethodRequired => 'Please select at least one payment method';

  @override
  String get createEventWalletNumber => 'Wallet Number';

  @override
  String get createEventInstaPayField => 'InstaPay Address or Phone';

  @override
  String get createEventPayPalField => 'PayPal Email';

  @override
  String get createEventInstaPayHint => 'name@instapay or 01XXXXXXXXX';

  @override
  String createEventPaymentEnterField(String field) {
    return 'Please enter your $field';
  }

  @override
  String get createEventInvalidVodafone => 'Enter a valid Vodafone Cash number';

  @override
  String get createEventInvalidOrange => 'Enter a valid Orange Cash number';

  @override
  String get createEventInvalidInstaPay => 'Enter a valid InstaPay address or phone number';

  @override
  String get createEventInvalidEmail => 'Enter a valid email';

  @override
  String get createEventCongrats => 'Congratulations!';

  @override
  String get createEventPublishedIntro => 'Your event is now ';

  @override
  String get createEventPublishedStatus => 'Under Review!\n';

  @override
  String get createEventPublishedWait => 'please wait for our response.';

  @override
  String get createEventGoHome => 'Go To Home';

  @override
  String get createEventStatusPending => 'PENDING';

  @override
  String get commonTryAgain => 'Try again';

  @override
  String get commonRefresh => 'Refresh';

  @override
  String get commonStatusLive => 'LIVE';

  @override
  String get commonStatusPending => 'PENDING';

  @override
  String get commonNoEventsFound => 'No events found.';

  @override
  String get authOrDivider => 'or';

  @override
  String get authCheckEmailCodeSent => 'Check your email for the code sent \nto ';

  @override
  String get authNameInvalid => 'Please enter a valid name';

  @override
  String get authEmailInvalid => 'Please enter a valid email';

  @override
  String get authPasswordInvalid => 'Please enter a valid password';

  @override
  String get myEventsTitle => 'My Events';

  @override
  String get myEventsManageEvent => 'Manage Event';

  @override
  String get myEventsNoTitle => 'No Title';

  @override
  String get homeOverviewTitle => 'Overview';

  @override
  String get homeSalesByEvent => 'Sales by Event';

  @override
  String get homeNoEventsTitle => 'No events yet';

  @override
  String get homeNoEventsSubtitle => 'Create your first event and its sales will show up here.';

  @override
  String get homeStatRevenue => 'REVENUE';

  @override
  String get homeStatAllEvents => 'All events';

  @override
  String get homeStatTicketsSold => 'TICKETS SOLD';

  @override
  String homeStatSoldPercent(int percent, String capacity) {
    return '$percent% of $capacity';
  }

  @override
  String get homeStatEvents => 'EVENTS';

  @override
  String homeStatLiveNow(String count) {
    return '$count live now';
  }

  @override
  String get homeStatCheckedIn => 'CHECKED IN';

  @override
  String get homeStatNoTicketsSold => 'No tickets sold yet';

  @override
  String homeStatOfSold(String count) {
    return 'of $count sold';
  }

  @override
  String get dashboardTitle => 'Event Dashboard';

  @override
  String get dashboardTicketSales => 'Ticket Sales';

  @override
  String get dashboardNoTiers => 'This event has no ticket tiers.';

  @override
  String get dashboardOnlineEvent => 'Online event';

  @override
  String get dashboardNoLocation => 'No location';

  @override
  String dashboardPerTicket(String price) {
    return '$price per ticket';
  }

  @override
  String dashboardTierSold(String sold, String capacity) {
    return '$sold of $capacity sold';
  }

  @override
  String get dashboardTotalRevenue => 'TOTAL REVENUE';

  @override
  String dashboardFromTickets(String count) {
    return 'From $count tickets';
  }

  @override
  String get scanTitle => 'Scan Tickets';

  @override
  String get scanLoadingEvents => 'Loading events...';

  @override
  String get scanSelectAnEvent => 'Select an event';

  @override
  String get scanSelectEventTitle => 'Select event';

  @override
  String get scanTicketVerified => 'Ticket Verified';

  @override
  String get scanAlreadyScanned => 'Already Scanned';

  @override
  String get scanInvalidTicket => 'Invalid Ticket';

  @override
  String get scanCodeNotFound => 'Code not found for this event';

  @override
  String get scanFailed => 'Scan Failed';

  @override
  String get scanCameraPermission => 'Camera permission is required to scan tickets';

  @override
  String get scanCameraUnavailable => 'Camera is unavailable';

  @override
  String get scanEnterManuallyBelow => 'You can still enter the ticket code manually below';

  @override
  String get scanInstruction => 'Align QR code within the frame';

  @override
  String get scanManualEntry => 'MANUAL ENTRY';

  @override
  String get scanManualHint => 'Enter ticket code manually';

  @override
  String get scanSound => 'Sound';

  @override
  String get scanVibrate => 'Vibrate';

  @override
  String get scanStatScanned => 'SCANNED';

  @override
  String get scanStatTotalExpected => 'TOTAL EXPECTED';

  @override
  String get scanSelectEventFirst => 'Select an event before scanning';

  @override
  String get notificationsMarkAllRead => 'Mark all as read';

  @override
  String get notificationsMarkAllFailed => 'Couldn\'t update your notifications';

  @override
  String get notificationsEmptyTitle => 'No notifications yet';

  @override
  String get notificationsEmptySubtitle => 'Ticket sales, staff replies and event updates will show up here';

  @override
  String get notificationsLoadFailed => 'Couldn\'t load your notifications';

  @override
  String get notificationsRecentTitle => 'Recent';

  @override
  String get notificationSomeone => 'Someone';

  @override
  String get notificationATicket => 'a ticket';

  @override
  String get notificationTicketPurchasedTitle => 'New ticket sold';

  @override
  String notificationTicketPurchasedBody(String buyer, String ticket, String event) {
    return '$buyer bought $ticket for \"$event\"';
  }

  @override
  String get notificationStaffAcceptedTitle => 'Invitation accepted';

  @override
  String notificationStaffAcceptedBody(String name, String event) {
    return '$name accepted your invitation to join \"$event\"';
  }

  @override
  String get notificationStaffDeclinedTitle => 'Invitation declined';

  @override
  String notificationStaffDeclinedBody(String name, String event) {
    return '$name declined your invitation to join \"$event\"';
  }

  @override
  String get notificationEventLiveTitle => 'Your event is live';

  @override
  String notificationEventLiveBody(String event) {
    return '\"$event\" is now live';
  }

  @override
  String get notificationTimeNow => 'Just now';

  @override
  String notificationTimeMinutes(int count) {
    return '${count}m ago';
  }

  @override
  String notificationTimeHours(int count) {
    return '${count}h ago';
  }

  @override
  String notificationTimeDays(int count) {
    return '${count}d ago';
  }

  @override
  String notificationTicketsPurchasedBody(String buyer, int count, String event) {
    return '$buyer bought $count tickets for \"$event\"';
  }

  @override
  String get authForgotPasswordLink => 'Forgot password?';

  @override
  String get authForgotPasswordTitle => 'Forgot Password';

  @override
  String get authForgotPasswordSubtitle => 'Enter your email and we will send you a link to reset your password.';

  @override
  String get authSendResetLink => 'Send reset link';

  @override
  String get authBackToSignIn => 'Back to sign in';

  @override
  String get authResetLinkSent => 'Reset link sent successfully, please check your email';

  @override
  String get profileDeleteAccount => 'Delete Account';

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountDescription => 'Deleting your account permanently removes your profile and data. This action cannot be undone.';

  @override
  String get deleteAccountGoogleNote => 'You will be asked to confirm with Google before your account is deleted.';

  @override
  String get deleteAccountPasswordNote => 'You will be asked to enter your password before your account is deleted.';

  @override
  String get deleteAccountSuccess => 'Your account has been deleted';

  @override
  String get deleteAccountPasswordSheetTitle => 'Confirm your password';

  @override
  String get deleteAccountPasswordSheetSubtitle => 'Enter your current password to permanently delete your account.';

  @override
  String get deleteAccountPasswordRequired => 'Please enter your password';

  @override
  String get termsAccept => 'Accept';

  @override
  String get termsReject => 'Reject';

  @override
  String get termsScrollToAccept => 'Scroll to the end of the terms to enable Accept';

  @override
  String get termsRejectedNotice => 'You need to accept the terms to use EveTick';
}
