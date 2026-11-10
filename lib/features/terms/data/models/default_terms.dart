import 'package:evetick_organizer/features/support/data/models/localized_text.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_block.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_document.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_icon.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_section.dart';

/// Shown when `legal_documents/organizer_terms` does not exist in Firestore
/// (or cannot be read), so the screen always has something to display.
/// This is a draft: have it reviewed before you publish the app.
abstract final class DefaultTerms {
  static const TermsDocument document = TermsDocument(
    lastUpdated: LocalizedText({'en': 'October 2026', 'ar': 'أكتوبر 2026'}),
    sections: [
      TermsSection(
        title: LocalizedText({
          'en': 'Acceptance of Terms',
          'ar': 'قبول الشروط',
        }),
        blocks: [
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'By accessing or using the **EveTick** Organizer app, you agree to be bound by these Terms of Service. These terms constitute a legally binding agreement between you and EveTick Inc.',
              'ar':
                  'بدخولك إلى تطبيق **EveTick** للمنظمين أو استخدامه، فإنك توافق على الالتزام بشروط الخدمة هذه. وتُعد هذه الشروط اتفاقًا ملزمًا قانونيًا بينك وبين شركة EveTick.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'If you do not agree to all of these terms, please do not use the organizer services. We reserve the right to change or modify these terms at any time.',
              'ar':
                  'إذا كنت لا توافق على جميع هذه الشروط، فيرجى عدم استخدام خدمات المنظمين. ونحتفظ بالحق في تغيير هذه الشروط أو تعديلها في أي وقت.',
            }),
          ),
        ],
      ),
      TermsSection(
        title: LocalizedText({
          'en': 'Organizer Eligibility',
          'ar': 'أهلية المنظم',
        }),
        blocks: [
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'You must be at least 18 years of age and have the legal authority to organize events and receive payments. By creating an organizer account, you represent and warrant that you have the right, authority, and capacity to enter into this agreement.',
              'ar':
                  'يجب ألا يقل عمرك عن 18 عامًا وأن تملك الصلاحية القانونية لتنظيم الفعاليات واستلام المدفوعات. وبإنشاء حساب منظم فإنك تقر وتضمن أن لديك الحق والصلاحية والأهلية للدخول في هذا الاتفاق.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en': 'Provide accurate profile and payout information.',
              'ar': 'تقديم بيانات الملف الشخصي وبيانات استلام الأرباح بشكل صحيح.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en': 'Maintain the security of your password.',
              'ar': 'الحفاظ على أمان كلمة المرور الخاصة بك.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en': 'Promptly update any information changes.',
              'ar': 'تحديث أي تغييرات في بياناتك فور حدوثها.',
            }),
          ),
        ],
      ),
      TermsSection(
        title: LocalizedText({
          'en': 'Events & Ticket Sales',
          'ar': 'الفعاليات وبيع التذاكر',
        }),
        blocks: [
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'You are responsible for the accuracy of your event details, including the title, date, venue, ticket tiers and prices. EveTick acts as an intermediary between event organizers and attendees.',
              'ar':
                  'أنت مسؤول عن صحة تفاصيل فعاليتك، ومنها العنوان والموعد والمكان وفئات التذاكر وأسعارها. وتعمل EveTick كوسيط بين منظمي الفعاليات والحاضرين.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.note,
            text: LocalizedText({
              'en':
                  'Please review our **Refund Policy** for specific details regarding cancelled or rescheduled events.',
              'ar':
                  'يرجى مراجعة **سياسة الاسترداد** لمعرفة التفاصيل الخاصة بالفعاليات الملغاة أو المؤجلة.',
            }),
          ),
        ],
      ),
      TermsSection(
        title: LocalizedText({
          'en': 'Payments & Payouts',
          'ar': 'المدفوعات والأرباح',
        }),
        blocks: [
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'Earnings from your ticket sales are sent to the payout method you choose when creating an event, such as Vodafone Cash, Orange Cash, InstaPay or PayPal. You are responsible for providing correct payout details.',
              'ar':
                  'تُرسل أرباح مبيعات تذاكرك إلى طريقة الاستلام التي تختارها عند إنشاء الفعالية، مثل فودافون كاش أو أورانج كاش أو إنستاباي أو باي بال. وأنت مسؤول عن تقديم بيانات الاستلام الصحيحة.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'EveTick may hold or delay a payout while a dispute or a suspected violation of these terms is under review.',
              'ar':
                  'يجوز لـ EveTick تعليق أي تحويل أو تأجيله أثناء مراجعة نزاع أو مخالفة محتملة لهذه الشروط.',
            }),
          ),
        ],
      ),
      TermsSection(
        title: LocalizedText({
          'en': 'Staff & Ticket Scanning',
          'ar': 'فريق العمل ومسح التذاكر',
        }),
        blocks: [
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'You may invite staff to help manage your event and choose what each person is allowed to do. You are responsible for the actions of the people you invite.',
              'ar':
                  'يمكنك دعوة أعضاء فريق لمساعدتك في إدارة فعاليتك وتحديد صلاحيات كل شخص. وأنت مسؤول عن تصرفات الأشخاص الذين تدعوهم.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'Tickets must be checked in through the EveTick scanner, and a ticket that was already scanned must not be accepted a second time.',
              'ar':
                  'يجب تسجيل دخول الحاضرين عبر ماسح EveTick، ولا يجوز قبول تذكرة تم مسحها مسبقًا مرة ثانية.',
            }),
          ),
        ],
      ),
      TermsSection(
        title: LocalizedText({
          'en': 'Prohibited Conduct',
          'ar': 'السلوك المحظور',
        }),
        blocks: [
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en': 'Organizers are strictly prohibited from:',
              'ar': 'يُحظر على المنظمين بشكل صارم ما يلي:',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.item,
            icon: TermsIcon.block,
            text: LocalizedText({
              'en':
                  'Selling tickets for fake, misleading or unauthorized events.',
              'ar': 'بيع تذاكر لفعاليات وهمية أو مضللة أو غير مصرح بها.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.item,
            icon: TermsIcon.security,
            text: LocalizedText({
              'en':
                  'Attempting to circumvent security features, ticket validation or API limitations.',
              'ar':
                  'محاولة تجاوز ميزات الأمان أو التحقق من التذاكر أو قيود واجهة البرمجة.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.item,
            icon: TermsIcon.personOff,
            text: LocalizedText({
              'en':
                  'Impersonating any person or entity or misrepresenting your affiliation.',
              'ar': 'انتحال شخصية أي شخص أو جهة أو تقديم معلومات مضللة عن انتمائك.',
            }),
          ),
        ],
      ),
      TermsSection(
        title: LocalizedText({
          'en': 'Intellectual Property',
          'ar': 'الملكية الفكرية',
        }),
        blocks: [
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'The EveTick name, logo, and all related designs are trademarks of EveTick Inc. You may not use these without prior written permission.',
              'ar':
                  'اسم EveTick وشعارها وجميع التصاميم المرتبطة بها علامات تجارية مملوكة لشركة EveTick. ولا يجوز استخدامها دون إذن كتابي مسبق.',
            }),
          ),
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'You keep the rights to the content you upload for your events, and you allow EveTick to display it in order to promote your event.',
              'ar':
                  'تحتفظ بحقوق المحتوى الذي ترفعه لفعالياتك، وتسمح لـ EveTick بعرضه للترويج لفعاليتك.',
            }),
          ),
        ],
      ),
      TermsSection(
        title: LocalizedText({
          'en': 'Limitation of Liability',
          'ar': 'حدود المسؤولية',
        }),
        blocks: [
          TermsBlock(
            type: TermsBlockType.paragraph,
            text: LocalizedText({
              'en':
                  'To the maximum extent permitted by law, EveTick shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your access to or use of the services.',
              'ar':
                  'إلى أقصى حد يسمح به القانون، لا تتحمل EveTick المسؤولية عن أي أضرار غير مباشرة أو عرضية أو خاصة أو تبعية أو عقابية ناتجة عن دخولك إلى الخدمات أو استخدامك لها.',
            }),
          ),
        ],
      ),
    ],
  );
}
