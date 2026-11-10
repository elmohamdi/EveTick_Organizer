import 'package:evetick_organizer/features/support/data/models/localized_text.dart';
import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/data/models/support_faq.dart';

/// Answers shown while the `organizer_faqs` collection is still empty, so the
/// Help & Support screen is never blank. Once a document exists in Firestore,
/// these are no longer used.
abstract final class DefaultSupportFaqs {
  static const List<SupportFaq> items = [
    SupportFaq(
      id: 'default_create_event',
      category: SupportCategory.events,
      order: 1,
      question: LocalizedText({
        'en': 'How do I create and publish an event?',
        'ar': 'كيف أنشئ فعالية وأنشرها؟',
      }),
      answer: LocalizedText({
        'en':
            'Tap the + button on the Home screen, then add your event details, cover photo and gallery, set up your ticket tiers and seating, and choose how you want to receive payments. Review everything and publish when you are ready.',
        'ar':
            'اضغط على زر + في الصفحة الرئيسية، ثم أضف تفاصيل الفعالية وصورة الغلاف والمعرض، وأعدّ فئات التذاكر والمقاعد، واختر طريقة استلام المدفوعات. راجع كل شيء ثم انشر الفعالية عندما تكون جاهزًا.',
      }),
    ),
    SupportFaq(
      id: 'default_manage_event',
      category: SupportCategory.events,
      order: 2,
      question: LocalizedText({
        'en': 'How do I manage an event after publishing it?',
        'ar': 'كيف أدير الفعالية بعد نشرها؟',
      }),
      answer: LocalizedText({
        'en':
            'Open the My Events tab and tap Manage Event on the event card. The dashboard shows your revenue, tickets sold and sales for each ticket tier, and it is where you manage your event staff.',
        'ar':
            'افتح تبويب فعالياتي واضغط على إدارة الفعالية في بطاقة الفعالية. تعرض لوحة التحكم إيراداتك وعدد التذاكر المباعة ومبيعات كل فئة تذاكر، ومنها تدير فريق العمل.',
      }),
    ),
    SupportFaq(
      id: 'default_add_staff',
      category: SupportCategory.events,
      order: 3,
      question: LocalizedText({
        'en': 'How do I add staff to help at my event?',
        'ar': 'كيف أضيف أعضاء فريق لمساعدتي في الفعالية؟',
      }),
      answer: LocalizedText({
        'en':
            'Open the event dashboard, go to the Staff section and tap Add. Enter their name and email, pick a role and choose what they can do, such as scanning tickets or viewing analytics. They will get an invitation in their app and can start helping as soon as they accept it.',
        'ar':
            'افتح لوحة تحكم الفعالية وانتقل إلى قسم الفريق ثم اضغط على إضافة. أدخل اسم العضو وبريده الإلكتروني، واختر دورًا وحدد صلاحياته مثل مسح التذاكر أو عرض التحليلات. ستصله دعوة داخل التطبيق ويمكنه البدء بمجرد قبولها.',
      }),
    ),
    SupportFaq(
      id: 'default_scan_tickets',
      category: SupportCategory.ticketing,
      order: 4,
      question: LocalizedText({
        'en': 'How do I scan tickets at the entrance?',
        'ar': 'كيف أمسح التذاكر عند المدخل؟',
      }),
      answer: LocalizedText({
        'en':
            'Open the Scan tab, choose your event and point the camera at the QR code on the attendee ticket. If the camera is not available you can type the ticket code manually. Always check that the right event is selected before you start.',
        'ar':
            'افتح تبويب المسح، واختر فعاليتك ووجّه الكاميرا نحو رمز QR الموجود على تذكرة الحاضر. وإذا لم تكن الكاميرا متاحة يمكنك كتابة رمز التذكرة يدويًا. تأكد دائمًا من اختيار الفعالية الصحيحة قبل أن تبدأ.',
      }),
    ),
    SupportFaq(
      id: 'default_scan_results',
      category: SupportCategory.ticketing,
      order: 5,
      question: LocalizedText({
        'en': 'What do the scan results mean?',
        'ar': 'ماذا تعني نتائج المسح؟',
      }),
      answer: LocalizedText({
        'en':
            'Verified means the ticket is valid and the attendee is now checked in. Already scanned means the ticket was used before, so do not let a second person in with it. Invalid means the code was not recognized for this event. If you see an error, check your internet connection and scan again.',
        'ar':
            'تم التحقق تعني أن التذكرة صالحة وتم تسجيل دخول الحاضر. تم مسحها مسبقًا تعني أن التذكرة استُخدمت من قبل، فلا تسمح لشخص آخر بالدخول بها. غير صالحة تعني أن الرمز غير معروف لهذه الفعالية. وإذا ظهرت لك رسالة خطأ فتحقق من اتصالك بالإنترنت وأعد المسح.',
      }),
    ),
    SupportFaq(
      id: 'default_track_sales',
      category: SupportCategory.ticketing,
      order: 6,
      question: LocalizedText({
        'en': 'Where can I track my ticket sales?',
        'ar': 'أين أتابع مبيعات التذاكر؟',
      }),
      answer: LocalizedText({
        'en':
            'The Home tab gives you an overview across all your events. For a single event, open its dashboard to see revenue, tickets sold and a breakdown by ticket tier.',
        'ar':
            'تعرض الصفحة الرئيسية نظرة عامة على جميع فعالياتك. ولمتابعة فعالية واحدة افتح لوحة التحكم الخاصة بها لتعرف الإيرادات والتذاكر المباعة وتفاصيل كل فئة تذاكر.',
      }),
    ),
    SupportFaq(
      id: 'default_get_paid',
      category: SupportCategory.payouts,
      order: 7,
      question: LocalizedText({
        'en': 'How do I get paid for my ticket sales?',
        'ar': 'كيف أستلم أرباح مبيعات التذاكر؟',
      }),
      answer: LocalizedText({
        'en':
            'When you create an event you choose how to receive your earnings: Vodafone Cash, Orange Cash, InstaPay or PayPal. The revenue of each event is shown on its dashboard. If you need to change your payout details, send us a message and we will help.',
        'ar':
            'عند إنشاء الفعالية تختار طريقة استلام أرباحك: فودافون كاش أو أورانج كاش أو إنستاباي أو باي بال. وتظهر إيرادات كل فعالية في لوحة التحكم الخاصة بها. وإذا أردت تغيير بيانات الاستلام أرسل لنا رسالة وسنساعدك.',
      }),
    ),
    SupportFaq(
      id: 'default_refund_request',
      category: SupportCategory.payouts,
      order: 8,
      question: LocalizedText({
        'en': 'What should I do if an attendee asks for a refund?',
        'ar': 'ماذا أفعل إذا طلب أحد الحاضرين استرداد قيمة التذكرة؟',
      }),
      answer: LocalizedText({
        'en':
            'Send us a message with the event name and the ticket details, and our support team will help you review the request.',
        'ar':
            'أرسل لنا رسالة تتضمن اسم الفعالية وتفاصيل التذكرة، وسيساعدك فريق الدعم في مراجعة الطلب.',
      }),
    ),
    SupportFaq(
      id: 'default_update_profile',
      category: SupportCategory.account,
      order: 9,
      question: LocalizedText({
        'en': 'How do I update my profile?',
        'ar': 'كيف أعدّل ملفي الشخصي؟',
      }),
      answer: LocalizedText({
        'en':
            'Open the Profile tab and tap Edit Profile. You can change your name, phone number, address and profile photo.',
        'ar':
            'افتح تبويب الملف الشخصي واضغط على تعديل الملف الشخصي. يمكنك تغيير اسمك ورقم هاتفك وعنوانك وصورتك الشخصية.',
      }),
    ),
    SupportFaq(
      id: 'default_language_theme',
      category: SupportCategory.account,
      order: 10,
      question: LocalizedText({
        'en': 'How do I change the language or appearance?',
        'ar': 'كيف أغيّر اللغة أو المظهر؟',
      }),
      answer: LocalizedText({
        'en':
            'Go to Profile and open Preferences. Tap Language to switch between English and Arabic, or Appearance to choose Light Mode, Dark Mode or System Default.',
        'ar':
            'انتقل إلى الملف الشخصي وافتح التفضيلات. اضغط على اللغة للتبديل بين الإنجليزية والعربية، أو على المظهر لاختيار الوضع الفاتح أو الداكن أو تلقائي.',
      }),
    ),
  ];
}
