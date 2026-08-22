// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get commonSkip => 'تخطي';

  @override
  String get commonNext => 'التالي';

  @override
  String get commonContinue => 'متابعة';

  @override
  String get commonConfirm => 'تأكيد';

  @override
  String get commonConfirmSelection => 'تأكيد الاختيار';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonDone => 'تم!';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonPost => 'نشر';

  @override
  String get commonFollow => 'متابعة';

  @override
  String get commonFollowing => 'متابَع';

  @override
  String get commonManage => 'إدارة';

  @override
  String get commonShare => 'مشاركة';

  @override
  String get commonReadMore => 'اقرأ المزيد';

  @override
  String get commonViewAll => 'عرض الكل';

  @override
  String get commonSeeAll => 'عرض الكل';

  @override
  String get commonLoadMoreReviews => 'تحميل المزيد من التقييمات';

  @override
  String get commonBackToHome => 'العودة للرئيسية';

  @override
  String get commonOr => 'أو';

  @override
  String get commonBookNow => 'احجز الآن';

  @override
  String get commonSoldOut => 'نفدت الكمية';

  @override
  String get commonWaitlist => 'قائمة الانتظار';

  @override
  String commonFromPrice(String price) {
    return 'يبدأ من $price\$';
  }

  @override
  String get onboardingAppName => 'إيفتيك';

  @override
  String get onboardingSlide1Title => 'اكتشف الفعاليات \n المحلية';

  @override
  String get onboardingSlide1Subtitle =>
      'ابحث واحجز تذاكر الحفلات والسينما وغيرها من الفعاليات القريبة منك';

  @override
  String get onboardingSlide2Title => 'حجز سلس';

  @override
  String get onboardingSlide2Subtitle =>
      'أمّن مكانك في ثوانٍ مع عملية دفع سريعة وسهلة';

  @override
  String get onboardingWelcomeTitle => 'اكتشف الفعاليات\nالتي ';

  @override
  String get onboardingWelcomeTitleRemain => 'تحبها';

  @override
  String get onboardingWelcomeSubtitle =>
      'انضم إلى مجتمع الباحثين عن الفعاليات';

  @override
  String get locationSetLocationTitle => 'أين أنت؟';

  @override
  String get onboardingLocationPermissionNotice =>
      'لعرض الفعاليات القريبة منك، نحتاج إلى إذن الوصول لموقعك.';

  @override
  String get locationSelectLocationTitle => 'اختر الموقع';

  @override
  String get locationSearchPlaceholder => 'ابحث عن مدينة أو شارع أو مكان';

  @override
  String get locationUseCurrentLocation => 'استخدام الموقع الحالي';

  @override
  String get locationCurrentCity => 'لندن، المملكة المتحدة';

  @override
  String get locationPopularCities => 'المدن الشائعة';

  @override
  String get locationSelectGovernorate => 'اختر المحافظة';

  @override
  String get locationChooseGovernorate => 'اختر المحافظة';

  @override
  String get locationNearbyLocations => 'المواقع القريبة';

  @override
  String get locationSelectManually => 'اختيار يدوي';

  @override
  String locationDistanceAway(String distance) {
    return 'على بعد $distance ميل';
  }

  @override
  String locationRecentSearch(String city) {
    return 'بحث سابق، $city';
  }

  @override
  String get locationCitiesLondon => 'لندن';

  @override
  String get locationCitiesNewYork => 'نيويورك';

  @override
  String get locationCitiesSanFrancisco => 'سان فرانسيسكو';

  @override
  String get locationCitiesDubai => 'دبي';

  @override
  String get locationVenueWestminster => 'وستمنستر، لندن';

  @override
  String get locationVenueMadisonSquareGarden => 'ماديسون سكوير جاردن';

  @override
  String get authSignIn => 'تسجيل الدخول';

  @override
  String get authSignUp => 'إنشاء حساب';

  @override
  String get authContinueWithGoogle => 'المتابعة باستخدام جوجل';

  @override
  String get authContinueWithFacebook => 'المتابعة باستخدام فيسبوك';

  @override
  String get authContinueAsGuest => 'المتابعة كضيف';

  @override
  String get authNoAccountPrompt => 'ليس لديك حساب؟ ';

  @override
  String get authNoAccountPromptRemain => 'أنشئ حسابًا';

  @override
  String get authHasAccountPrompt => 'لديك حساب بالفعل؟ ';

  @override
  String get authHasAccountPromptRemain => 'سجّل الدخول';

  @override
  String get authEmailAddressLabel => 'البريد الإلكتروني';

  @override
  String get authEmailPlaceholder => 'أدخل بريدك الإلكتروني';

  @override
  String get authEmailPlaceholderContinue => 'أدخل بريدك الإلكتروني للمتابعة';

  @override
  String get authFullNameLabel => 'الاسم الكامل';

  @override
  String get authFullNamePlaceholder => 'أدخل اسمك';

  @override
  String get authPasswordLabel => 'كلمة المرور';

  @override
  String get authPasswordPlaceholder => 'أدخل كلمة المرور';

  @override
  String get authVerifyTitle => 'تحقق';

  @override
  String get authVerificationCodeLabel => 'رمز التحقق';

  @override
  String authVerificationSentNotice(String email) {
    return 'تحقق من بريدك الإلكتروني لرمز التحقق المرسل إلى $email';
  }

  @override
  String get authResendCodePrompt => 'لم يصلك الرمز؟ إعادة الإرسال';

  @override
  String get authRegistrationSuccess => 'تم تسجيلك بنجاح في إيفتيك';

  @override
  String get authStartExploring => 'ابدأ الاستكشاف';

  @override
  String get homeSearchPlaceholder => 'ابحث عن حفلات، سينما...';

  @override
  String get homeSearchSuggestionExample => 'حفلات الجاز في لندن';

  @override
  String get homeFiltersAll => 'الكل';

  @override
  String get homeFiltersEvents => 'الفعاليات';

  @override
  String get homeFiltersTickets => 'التذاكر';

  @override
  String get homeFiltersConcerts => 'الحفلات';

  @override
  String get homeFiltersCinema => 'السينما';

  @override
  String get homeFiltersTrips => 'الرحلات';

  @override
  String get homeFiltersSports => 'الرياضة';

  @override
  String get homeFiltersWorkshops => 'ورش العمل';

  @override
  String get homeFiltersNightlife => 'الحياة الليلية';

  @override
  String get homeFiltersFreeEvents => 'فعاليات مجانية';

  @override
  String get homeSortOptionsTrendingNow => 'الأكثر رواجًا الآن';

  @override
  String get homeSortOptionsUpcoming => 'القادمة';

  @override
  String get homeSortOptionsThisWeekend => 'نهاية هذا الأسبوع';

  @override
  String get homeSortOptionsPriceLowToHigh => 'السعر: من الأقل للأعلى';

  @override
  String homeResultsFound(String count) {
    return 'تم العثور على $count نتيجة';
  }

  @override
  String get homeFeaturedEvents => 'فعاليات مميزة';

  @override
  String get homePopularEvents => 'فعاليات شائعة';

  @override
  String get homeBadgesTopSelling => 'الأكثر مبيعًا';

  @override
  String get homeBadgesBestValue => 'أفضل قيمة';

  @override
  String get homeBadgesTrending => 'رائج';

  @override
  String get homeBadgesHighDemand => 'إقبال كبير';

  @override
  String get homeBadgesBestPrice => 'أفضل سعر';

  @override
  String get homeBadgesEarlyBird => 'الحجز المبكر';

  @override
  String homeEventPrice(String price) {
    return '$price\$';
  }

  @override
  String get searchRecentSearches => 'عمليات البحث الأخيرة';

  @override
  String get searchClearAll => 'مسح الكل';

  @override
  String get searchSortBy => 'الترتيب حسب';

  @override
  String get searchSortOptionsPopularity => 'الشعبية';

  @override
  String get searchSortOptionsDate => 'التاريخ';

  @override
  String get searchSortOptionsDistance => 'المسافة';

  @override
  String get searchFilterAndRefine => 'تصفية وتنقية';

  @override
  String get searchApplyFilters => 'تطبيق الفلاتر';

  @override
  String get notificationsTitle => 'الإشعارات';

  @override
  String notificationsTimeAgoJustNow(String minutes) {
    return 'منذ $minutes دقيقة';
  }

  @override
  String notificationsTimeAgoHoursAgo(String hours) {
    return 'منذ $hours ساعة';
  }

  @override
  String notificationsTimeAgoDaysAgo(String days) {
    return 'منذ $days أيام';
  }

  @override
  String get notificationsTimeAgoYesterday => 'الأمس';

  @override
  String get notificationsTimeAgoEarlier => 'سابقًا';

  @override
  String get notificationsHotDealTitle => 'عرض ساخن: مهرجان الصيف 2024';

  @override
  String get notificationsHotDealBody =>
      'احصل على خصم 20% على تذاكر الحجز المبكر لأكبر مهرجان موسيقي صيفي....';

  @override
  String get notificationsNewEventTitle => 'فعالية جديدة بالقرب منك!';

  @override
  String get notificationsNewEventBody =>
      'ليلة تكنو مع دي جي سبارك تُقام هذه الجمعة في...';

  @override
  String get notificationsTicketConfirmedTitle => 'تم تأكيد التذكرة';

  @override
  String get notificationsTicketConfirmedBody =>
      'تم تأكيد حجزك لـ\"جاز تحت النجوم\". نراك هناك!';

  @override
  String get notificationsArtistFollowedTitle => 'فنان تتابعه';

  @override
  String get notificationsArtistFollowedBody =>
      'أعلن كولدبلاي للتو عن جولة عالمية جديدة. ترقّب التذاكر!';

  @override
  String get notificationsProfileUpdatedTitle => 'تم تحديث الملف الشخصي';

  @override
  String get notificationsProfileUpdatedBody =>
      'لقد قمت بتحديث طريقة الدفع بنجاح.';

  @override
  String get eventDetailsEventLocation => 'موقع الفعالية';

  @override
  String get eventDetailsVenueExamplesExcelCentre => 'إكسل سنتر، لندن';

  @override
  String get eventDetailsVenueExamplesWembleyStadium => 'ملعب ويمبلي';

  @override
  String get eventDetailsVenueExamplesGrandEgyptianMuseum =>
      'المتحف المصري الكبير';

  @override
  String get eventDetailsVenueExamplesTheGrandArena =>
      'الأرينا الكبرى، وسط المدينة';

  @override
  String get eventDetailsVenueExamplesSiliconValleyCenter =>
      'مركز وادي السيليكون، كاليفورنيا';

  @override
  String get eventDetailsDescriptionTitle => 'الوصف';

  @override
  String get eventDetailsDescriptionExample =>
      'استمتع بأروع مهرجان موسيقي صيفي يضم أشهر الفنانين العالميين ومنشآت فنية غامرة وتشكيلة متنوعة من المأكولات. تضم قائمة هذا العام نجومًا سيبقونك ترقص تحت النجوم... اقرأ المزيد';

  @override
  String get eventDetailsDateLabel => 'التاريخ';

  @override
  String get eventDetailsTimeLabel => 'الوقت';

  @override
  String eventDetailsPriceFrom(String price) {
    return 'يبدأ من $price\$';
  }

  @override
  String get eventDetailsPerksVipAccess => 'دخول كبار الشخصيات';

  @override
  String get eventDetailsPerksBackstageLounge => 'دخول لصالة الكواليس.';

  @override
  String get eventDetailsPerksComplimentaryDrinks => 'قسيمتان مشروبات مجانية.';

  @override
  String get eventDetailsPerksPremiumViewing => 'منطقة مشاهدة مميزة.';

  @override
  String get eventDetailsPerksMeetAndGreet => 'لقاء وتصوير مع الفنانين.';

  @override
  String get eventDetailsPerksIncludesVipPerks =>
      'يشمل جميع مزايا كبار الشخصيات.';

  @override
  String get eventDetailsPerksStandardEntry => 'يشمل الدخول القياسي.';

  @override
  String get eventDetailsPerksLimitedQuantities =>
      'كميات محدودة لمؤيدينا الأوائل.';

  @override
  String get ticketsSelectTicketsTitle => 'اختر التذاكر';

  @override
  String get ticketsVenueName => 'قاعة الأرينا الرئيسية';

  @override
  String ticketsStepIndicator(String step, String total) {
    return 'خطوة $step من $total';
  }

  @override
  String get ticketsStepTicketSelection => 'اختيار التذاكر';

  @override
  String get ticketsStepCheckout => 'الدفع';

  @override
  String get ticketsStepPayment => 'الدفع';

  @override
  String get ticketsAvailable => 'متاح';

  @override
  String get ticketsReserved => 'محجوز';

  @override
  String get ticketsSelected => 'محدد';

  @override
  String get ticketsTicketTypesGeneralAdmission => 'دخول عام';

  @override
  String get ticketsTicketTypesVipAccess => 'دخول كبار الشخصيات';

  @override
  String get ticketsTicketTypesBackstagePass => 'تصريح الكواليس';

  @override
  String ticketsTicketCountSelected(String count) {
    return 'تم اختيار $count تذكرة';
  }

  @override
  String get ticketsTotalPrice => 'السعر الإجمالي';

  @override
  String get ticketsPlusServiceFee => '+ رسوم الخدمة';

  @override
  String get ticketsSelectedSeats => 'المقاعد المختارة';

  @override
  String get ticketsPricePerTicket => 'سعر التذكرة';

  @override
  String get ticketsContinueToCheckout => 'المتابعة إلى الدفع';

  @override
  String get checkoutTitle => 'الدفع';

  @override
  String get checkoutBookingSummary => 'ملخص الحجز';

  @override
  String checkoutTicketQuantityTypeExample(String count, String ticket_type) {
    return '$count× $ticket_type';
  }

  @override
  String get checkoutTicketTypeGeneralAdmission => 'دخول عام';

  @override
  String get checkoutAttendeeLabel => 'الحاضر';

  @override
  String get checkoutSeatLabel => 'المقعد';

  @override
  String get checkoutCategoryLabel => 'الفئة';

  @override
  String get checkoutCardholderNamePlaceholderExample => 'أحمد محمد';

  @override
  String get checkoutExpiryDatePlaceholder => 'شهر/سنة';

  @override
  String get checkoutCvvPlaceholder => '***';

  @override
  String get checkoutProceedToPayment => 'المتابعة للدفع';

  @override
  String get paymentPaymentMethod => 'طريقة الدفع';

  @override
  String get paymentMethodsCreditCard => 'بطاقة ائتمان';

  @override
  String get paymentMethodsApplePay => 'أبل باي';

  @override
  String get paymentMethodsPaypal => 'باي بال';

  @override
  String get paymentCardNumberLabel => 'رقم البطاقة';

  @override
  String get paymentCardNumberPlaceholder => '0000 0000 0000 0000';

  @override
  String get paymentCardholderNameLabel => 'اسم حامل البطاقة';

  @override
  String get paymentExpiryDateLabel => 'تاريخ الانتهاء';

  @override
  String get paymentCvvLabel => 'رمز التحقق CVV';

  @override
  String get paymentSubtotal => 'المجموع الفرعي';

  @override
  String get paymentServiceFee => 'رسوم الخدمة';

  @override
  String get paymentTaxes => 'الضرائب';

  @override
  String get paymentTotalPrice => 'السعر الإجمالي';

  @override
  String get paymentSecurePaymentNotice => 'دفع مشفّر وآمن SSL';

  @override
  String get paymentPayNow => 'ادفع الآن';

  @override
  String get confirmationTitle => 'تأكيد';

  @override
  String get confirmationPaymentSuccessful => 'تم الدفع بنجاح!';

  @override
  String get confirmationTicketConfirmed => 'تم تأكيد التذكرة';

  @override
  String confirmationOrderId(String id) {
    return 'رقم الطلب #$id';
  }

  @override
  String get confirmationBookingId => 'رقم الحجز';

  @override
  String get confirmationTotalPaid => 'المبلغ المدفوع';

  @override
  String get confirmationViewTicket => 'عرض التذكرة';

  @override
  String get confirmationScanAtEntrance => 'امسح عند الدخول';

  @override
  String confirmationTicketId(String id) {
    return 'رقم التذكرة: #$id';
  }

  @override
  String get confirmationViewOnMap => 'عرض على الخريطة';

  @override
  String get profileMyProfile => 'ملفي الشخصي';

  @override
  String get profilePremiumAttendee => 'حاضر مميز';

  @override
  String profilePremiumMemberSince(String year) {
    return 'عضو مميز منذ $year';
  }

  @override
  String get profilePersonalInfo => 'المعلومات الشخصية';

  @override
  String get profilePersonalInfoSubtitle =>
      'البريد الإلكتروني، الهاتف، العنوان';

  @override
  String get profileEditProfile => 'تعديل الملف الشخصي';

  @override
  String get profileFullNameLabel => 'الاسم الكامل';

  @override
  String get profileEmailAddressLabel => 'البريد الإلكتروني';

  @override
  String get profilePhoneNumberLabel => 'رقم الهاتف';

  @override
  String get profilePhysicalAddressLabel => 'العنوان';

  @override
  String get profileAddressExample => '7 شارع بوسطة، الدخيلة، الإسكندرية';

  @override
  String get profilePhoneExample => '+20 127 1734 638';

  @override
  String get profileAddPhotosOptional => 'إضافة صور (اختياري)';

  @override
  String get profileUpload => 'رفع';

  @override
  String get profileAccountSection => 'الحساب';

  @override
  String get profilePreferencesSection => 'التفضيلات';

  @override
  String get profilePreferencesRowsLanguage => 'اللغة';

  @override
  String get profilePreferencesRowsAppearance => 'المظهر';

  @override
  String get profilePreferencesRowsNotifications => 'الإشعارات';

  @override
  String get profileAppearanceValuesDarkMode => 'الوضع الداكن';

  @override
  String get profileAppearanceValuesLightMode => 'الوضع الفاتح';

  @override
  String get profileLanguageValueExample => 'الإنجليزية (الولايات المتحدة)';

  @override
  String get profileTabsMyTickets => 'تذاكري';

  @override
  String get profileTabsFavorites => 'المفضلة';

  @override
  String get profileTabsReviewsAndRatings => 'التقييمات والمراجعات';

  @override
  String get profileTabsFollowingArtists => 'الفنانون المتابَعون';

  @override
  String get profileTabsFollowingOrganizers => 'المنظمون المتابَعون';

  @override
  String get profileTicketStatusUpcoming => 'القادمة';

  @override
  String get profileTicketStatusPast => 'السابقة';

  @override
  String get profileTicketStatusConfirmed => 'مؤكدة';

  @override
  String get profileTicketStatusCompleted => 'مكتملة';

  @override
  String get profileTicketStatusActive => 'نشطة';

  @override
  String get profileSearchOrganizersPlaceholder => 'ابحث عن منظمين';

  @override
  String get profileSearchArtistsPlaceholder => 'ابحث عن فنانين...';

  @override
  String profileOrganizersCount(String count) {
    return 'المنظمون ($count)';
  }

  @override
  String profileFollowersCount(String count) {
    return '$count متابع';
  }

  @override
  String get profileSupportSection => 'Support';

  @override
  String get profileAccount => 'الحساب';

  @override
  String get profileSettings => 'الإعدادات';

  @override
  String get profileHelpCenter => 'مركز المساعدة';

  @override
  String get profileTermsOfService => 'شروط الخدمة';

  @override
  String get profileLogOut => 'تسجيل الخروج';

  @override
  String get myTicketsTitle => 'تذاكري';

  @override
  String get myTicketsTabsUpcoming => 'القادمة';

  @override
  String get myTicketsTabsPast => 'السابقة';

  @override
  String myTicketsTicketIdLabel(String id) {
    return 'رقم التذكرة: #$id';
  }

  @override
  String get myTicketsSampleEventsAiFutureTech =>
      'الذكاء الاصطناعي ومستقبل التكنولوجيا';

  @override
  String get myTicketsSampleEventsNeonNights => 'ليالي نيون';

  @override
  String get myTicketsSampleEventsIndieFolkFestival => 'مهرجان الفولك المستقل';

  @override
  String get myTicketsSampleEventsWomenCooking => 'طبخ نسائي';

  @override
  String get myTicketsSampleEventsSummerJazzNight => 'ليلة جاز صيفية';

  @override
  String get myTicketsSampleEventsDigitalArtExpo => 'معرض الفن الرقمي';

  @override
  String get favoritesTitle => 'المفضلة';

  @override
  String get favoritesCategoryMusic => 'موسيقى';

  @override
  String get favoritesSampleEventsSummerSoundwave =>
      'مهرجان الموجة الصوتية الصيفية 2024';

  @override
  String get favoritesSampleEventsGlobalInnovationSummit =>
      'قمة الابتكار العالمية';

  @override
  String get artistOrganizerViewProfile => 'عرض الملف الشخصي';

  @override
  String get artistOrganizerFollowers => 'المتابعون';

  @override
  String get artistOrganizerUpcomingEvents => 'الفعاليات القادمة';

  @override
  String get artistOrganizerEventsHosted => 'الفعاليات المستضافة';

  @override
  String artistOrganizerShowsCount(String count) {
    return '$count عرض';
  }

  @override
  String get artistOrganizerAbout => 'نبذة';

  @override
  String get artistOrganizerGallery => 'معرض الصور';

  @override
  String get artistOrganizerUpcomingTours => 'الجولات القادمة';

  @override
  String get artistOrganizerUpcomingEventsViewAll =>
      'الفعاليات القادمة (عرض الكل)';

  @override
  String artistOrganizerShowsCountFull(String count) {
    return '$count عرض';
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
  String get artistOrganizerFindMoreArtists => 'اكتشف المزيد من الفنانين';

  @override
  String get artistOrganizerTabsUpcoming => 'القادمة';

  @override
  String get artistOrganizerTabsPastEvents => 'الفعاليات السابقة';

  @override
  String get artistOrganizerTabsReviews => 'التقييمات';

  @override
  String get artistOrganizerArtistBioExample =>
      'أبيل ماكونين تسفاي، المعروف باسم ذا ويكند، مغنٍ وكاتب أغانٍ ومنتج موسيقي كندي. اشتهر بتنوعه الصوتي وأسلوبه الغنائي الحزين... اقرأ المزيد';

  @override
  String get artistOrganizerOrganizerBioExample =>
      'جلوبال كونسرتس هي شركة تنظيم فعاليات رائدة متخصصة في المهرجانات الموسيقية العالمية والعروض في الملاعب الكبرى، تجلب أفضل المواهب العالمية إلى مدينتك.';

  @override
  String get artistOrganizerBandLabel => 'فرقة';

  @override
  String get artistOrganizerArtistLabel => 'فنان';

  @override
  String get reviewsTitle => 'التقييمات والمراجعات';

  @override
  String reviewsOverallRating(String rating) {
    return '$rating';
  }

  @override
  String reviewsReviewsCountTotal(String count) {
    return '$count تقييم';
  }

  @override
  String reviewsRatingBarLabel(String stars) {
    return '$stars';
  }

  @override
  String get reviewsWriteAReview => 'اكتب تقييمًا';

  @override
  String get reviewsHowWasYourExperience => 'كيف كانت تجربتك؟';

  @override
  String get reviewsShareExperiencePlaceholder => 'شارك تجربتك مع الآخرين...';

  @override
  String get reviewsPostAnonymously => 'النشر بشكل مجهول';

  @override
  String get reviewsAnonymousNote => 'لن يظهر اسمك للآخرين';

  @override
  String reviewsReviewsCount(String count) {
    return '$count تقييم';
  }

  @override
  String reviewsVerifiedAttendee(String time) {
    return 'حاضر موثّق • منذ $time';
  }

  @override
  String reviewsHelpfulCount(String count) {
    return 'مفيد ($count)';
  }

  @override
  String get reviewsReply => 'رد';

  @override
  String get reviewsReviewExample1 =>
      'كانت الأجواء رائعة! جودة الصوت كانت ممتازة. تستحق ثمنها بالتأكيد. كان الطاقم متعاونًا جدًا عندما لم نجد مقاعدنا.';

  @override
  String get reviewsReviewExample2 =>
      'تجربة رائعة بشكل عام! العيب الوحيد كان طابور الانتظار الطويل للمشروبات. أنصح بالحضور مبكرًا إذا كنت تريد الحصول على مشروب قبل بدء العرض.';

  @override
  String get reviewsReviewExample3 =>
      'ليلة لا تُصدق! العرض الضوئي كان متزامنًا تمامًا مع الإيقاع. لقد حضرت فعاليات كثيرة، لكن إيفتيك يجعل الحجز سلسًا دائمًا.';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsAppearance => 'المظهر';

  @override
  String get settingsAppearanceSubtitle => 'اختر شكل ظهور إيفتيك على جهازك.';

  @override
  String get settingsLightMode => 'فاتح';

  @override
  String get settingsLightModeSubtitle => 'مظهر مشرق وواضح دائمًا';

  @override
  String get settingsDarkMode => 'داكن';

  @override
  String get settingsDarkModeSubtitle => 'أريح للعين في الإضاءة المنخفضة';

  @override
  String get settingsSelectLanguage => 'اختر اللغة';

  @override
  String get settingsDefaultLanguage => 'اللغة الافتراضية';

  @override
  String get settingsArabicLanguage => 'اللغة العربية';

  @override
  String get settingsLanguageOptionsEnglish => 'الإنجليزية';

  @override
  String get settingsLanguageOptionsArabic => 'العربية';

  @override
  String get settingsApplyChanges => 'تطبيق التغييرات';

  @override
  String get settingsApplySelection => 'تطبيق الاختيار';

  @override
  String get helpSupportTitle => 'المساعدة والدعم';

  @override
  String get helpSupportHowCanWeHelp => 'كيف يمكننا مساعدتك؟';

  @override
  String get helpSupportWhatCanWeHelpWith => 'بماذا يمكننا مساعدتك؟';

  @override
  String get helpSupportSelectCategory => 'اختر الفئة';

  @override
  String get helpSupportCategoriesAccount => 'الحساب';

  @override
  String get helpSupportCategoriesBooking => 'الحجز';

  @override
  String get helpSupportCategoriesPayment => 'الدفع';

  @override
  String get helpSupportCategoriesOrganizerHelp => 'مساعدة المنظمين';

  @override
  String get helpSupportFrequentQuestions => 'الأسئلة الشائعة';

  @override
  String get helpSupportFaqRefundQuestion => 'كيف يمكنني استرداد ثمن تذكرة؟';

  @override
  String get helpSupportFaqRefundAnswer =>
      'يمكنك طلب استرداد الأموال مباشرة من قسم \"تذاكري\" إذا سمح منظم الفعالية بذلك. عادةً ما تتم معالجة المبالغ المستردة خلال 5-7 أيام عمل إلى وسيلة الدفع الأصلية.';

  @override
  String get helpSupportFaqQrCodeQuestion =>
      'أين يمكنني إيجاد رمز QR الخاص بي؟';

  @override
  String get helpSupportFaqTransferQuestion => 'هل يمكنني نقل تذاكري إلى صديق؟';

  @override
  String get helpSupportFaqProfilePhotoQuestion =>
      'كيف يمكنني تغيير صورة ملفي الشخصي؟';

  @override
  String get helpSupportStillNeedHelp => 'ما زلت بحاجة إلى مساعدة؟';

  @override
  String get helpSupportSupportAvailabilityNotice =>
      'فريق الدعم لدينا متاح على مدار الساعة لمساعدتك في أي مشكلة.';

  @override
  String get helpSupportContactSupport => 'التواصل مع الدعم';

  @override
  String get helpSupportSendMessageTitle => 'أرسل لنا رسالة';

  @override
  String get helpSupportYourMessageLabel => 'رسالتك';

  @override
  String get helpSupportMessagePlaceholder =>
      'صف مشكلتك أو ملاحظاتك بالتفصيل هنا...';

  @override
  String get helpSupportAttachmentsOptional => 'المرفقات (اختياري)';

  @override
  String get helpSupportUploadScreenshot => 'رفع لقطة شاشة';

  @override
  String get helpSupportSupportedFormatsNotice =>
      'الصيغ المدعومة: PNG، JPG (بحد أقصى 5 ميجابايت)';

  @override
  String get helpSupportResponseTimeNotice =>
      'يستجيب فريق الدعم لدينا عادةً خلال 24 ساعة. لمشكلات التذاكر العاجلة، يُرجى مراجعة قسم الأسئلة الشائعة.';

  @override
  String get helpSupportSendMessage => 'إرسال الرسالة';

  @override
  String get termsTitle => 'شروط الخدمة';

  @override
  String get termsSubtitle => 'الشروط والخدمات';

  @override
  String termsLastUpdated(String date) {
    return 'آخر تحديث: $date';
  }

  @override
  String get termsSectionsAcceptanceTitle => 'قبول الشروط';

  @override
  String get termsSectionsAcceptanceBody1 =>
      'من خلال الوصول إلى منصة إيفتيك أو استخدامها، فإنك توافق على الالتزام بهذه الشروط والخدمات. تشكل هذه الشروط اتفاقية ملزمة قانونًا بينك وبين شركة إيفتيك.';

  @override
  String get termsSectionsAcceptanceBody2 =>
      'إذا كنت لا توافق على جميع هذه الشروط، فيُرجى عدم استخدام خدماتنا. نحتفظ بالحق في تغيير أو تعديل هذه الشروط في أي وقت.';

  @override
  String get termsSectionsEligibilityTitle => 'أهلية المستخدم';

  @override
  String get termsSectionsEligibilityBody =>
      'يجب أن يكون عمرك 18 عامًا على الأقل لاستخدام الخدمات. من خلال إنشاء حساب، فإنك تقر وتضمن أن لديك الحق والصلاحية والأهلية للدخول في هذه الاتفاقية.';

  @override
  String get termsSectionsEligibilityListItem1 => 'تقديم معلومات تسجيل دقيقة';

  @override
  String get termsSectionsEligibilityListItem2 =>
      'الحفاظ على أمان كلمة المرور الخاصة بك.';

  @override
  String get termsSectionsEligibilityListItem3 =>
      'تحديث أي تغييرات في المعلومات فورًا.';

  @override
  String get termsSectionsTicketPurchaseTitle => 'شراء التذاكر والاسترداد';

  @override
  String get termsSectionsTicketPurchaseBody =>
      'جميع المبيعات نهائية ما لم يتم إلغاء الفعالية أو إعادة جدولتها. تعمل إيفتيك كوسيط بين منظمي الفعاليات والحضور. يُرجى مراجعة سياسة الاسترداد الخاصة بنا للاطلاع على التفاصيل المتعلقة بإلغاءات أماكن محددة.';

  @override
  String get termsSectionsProhibitedConductTitle => 'السلوك المحظور';

  @override
  String get termsSectionsProhibitedConductIntro =>
      'يُحظر على المستخدمين بشكل صارم القيام بما يلي:';

  @override
  String get termsSectionsProhibitedConductListItem1 =>
      'إعادة بيع التذاكر بسعر أعلى من القيمة الاسمية الأصلية على منصات طرف ثالث.';

  @override
  String get termsSectionsProhibitedConductListItem2 =>
      'محاولة التحايل على ميزات الأمان أو قيود واجهة برمجة التطبيقات (API).';

  @override
  String get termsSectionsProhibitedConductListItem3 =>
      'انتحال شخصية أي فرد أو كيان أو تحريف انتمائك.';

  @override
  String get termsSectionsIpTitle => 'الملكية الفكرية';

  @override
  String get termsSectionsIpBody =>
      'اسم إيفتيك وشعارها وجميع التصاميم المرتبطة بها هي علامات تجارية مملوكة لشركة إيفتيك. لا يجوز استخدامها دون إذن كتابي مسبق.';

  @override
  String get termsSectionsLiabilityTitle => 'تحديد المسؤولية';

  @override
  String get termsSectionsLiabilityBody =>
      'إلى أقصى حد يسمح به القانون، لن تكون إيفتيك مسؤولة عن أي أضرار غير مباشرة أو عرضية أو خاصة أو تبعية أو تأديبية ناتجة عن وصولك إلى الخدمات أو استخدامها.';

  @override
  String get termsDecline => 'رفض';

  @override
  String get termsAgreeAndContinue => 'موافق ومتابعة';

  @override
  String get profilePersonalInfoTitle => 'المعلومات الشخصية';

  @override
  String get profileFullName => 'الاسم الكامل';

  @override
  String get profileFullNameHint => 'أدخل اسمك الكامل';

  @override
  String get profileFullNameRequired => 'الاسم مطلوب';

  @override
  String get profileEmail => 'البريد الإلكتروني';

  @override
  String get profileEmailHint => 'أدخل بريدك الإلكتروني';

  @override
  String get profilePhone => 'رقم الهاتف';

  @override
  String get profilePhoneHint => 'أدخل رقم هاتفك';

  @override
  String get profilePhoneInvalid => 'رقم الهاتف غير صالح';

  @override
  String get profileAddress => 'العنوان';

  @override
  String get profileAddressHint => 'أدخل عنوانك';

  @override
  String get profileAddressRequired => 'العنوان مطلوب';

  @override
  String get profileSave => 'حفظ';

  @override
  String get profileUpdatedSuccess => 'تم تحديث الملف الشخصي بنجاح.';

  @override
  String get profileTheme => 'المظهر';

  @override
  String get profileThemeSystem => 'تلقائي';

  @override
  String get profileThemeLight => 'الوضع الفاتح';

  @override
  String get profileThemeDark => 'الوضع الداكن';
}
