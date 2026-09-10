import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// زمانە پشتگیریکراوەکان - کوردی سەرەکییە (بنەڕەتی)
enum AppLanguage { ckb, ar, en, tr, fa }

extension AppLanguageX on AppLanguage {
  String get code {
    switch (this) {
      case AppLanguage.ckb:
        return 'ckb';
      case AppLanguage.ar:
        return 'ar';
      case AppLanguage.en:
        return 'en';
      case AppLanguage.tr:
        return 'tr';
      case AppLanguage.fa:
        return 'fa';
    }
  }

  String get nativeName {
    switch (this) {
      case AppLanguage.ckb:
        return 'کوردی';
      case AppLanguage.ar:
        return 'العربية';
      case AppLanguage.en:
        return 'English';
      case AppLanguage.tr:
        return 'Türkçe';
      case AppLanguage.fa:
        return 'فارسی';
    }
  }

  bool get isRtl => this != AppLanguage.en && this != AppLanguage.tr;
}

/// کۆنترۆڵکەری زمان - کوردی وەک بنەڕەت، بەڵام بەکارهێنەر دەتوانێت بیگۆڕێت
class L {
  static final ValueNotifier<AppLanguage> notifier = ValueNotifier(AppLanguage.ckb);
  static AppLanguage get current => notifier.value;

  static Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = prefs.getString('app_language');
      if (saved != null) {
        notifier.value = AppLanguage.values.firstWhere(
          (l) => l.code == saved,
          orElse: () => AppLanguage.ckb,
        );
      }
    } catch (_) {
      // بەردەوامبوون بە کوردی ئەگەر هەڵەیەک ڕوویدا
    }
  }

  static Future<void> set(AppLanguage lang) async {
    notifier.value = lang;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('app_language', lang.code);
    } catch (_) {}
  }

  static String t(String key) {
    final map = _strings[key];
    if (map == null) return key;
    return map[current] ?? map[AppLanguage.ckb] ?? key;
  }

  static final Map<String, Map<AppLanguage, String>> _strings = {
    'app_name': {
      AppLanguage.ckb: 'نوێژ',
      AppLanguage.ar: 'الصلاة',
      AppLanguage.en: 'Pray',
      AppLanguage.tr: 'Namaz',
      AppLanguage.fa: 'نماز',
    },
    'today_hadith': {
      AppLanguage.ckb: 'فەرموودەی ئەمڕۆ',
      AppLanguage.ar: 'حديث اليوم',
      AppLanguage.en: "Today's Hadith",
      AppLanguage.tr: 'Günün Hadisi',
      AppLanguage.fa: 'حدیث امروز',
    },
    'learn_salah': {
      AppLanguage.ckb: 'فێربوونی نوێژ',
      AppLanguage.ar: 'تعلّم الصلاة',
      AppLanguage.en: 'Learn Salah',
      AppLanguage.tr: 'Namazı Öğren',
      AppLanguage.fa: 'آموزش نماز',
    },
    'prayer_times': {
      AppLanguage.ckb: 'کاتی بانگ',
      AppLanguage.ar: 'مواقيت الصلاة',
      AppLanguage.en: 'Prayer Times',
      AppLanguage.tr: 'Namaz Vakitleri',
      AppLanguage.fa: 'اوقات نماز',
    },
    'qibla': {
      AppLanguage.ckb: 'قیبلەنما',
      AppLanguage.ar: 'اتجاه القبلة',
      AppLanguage.en: 'Qibla Compass',
      AppLanguage.tr: 'Kıble Pusulası',
      AppLanguage.fa: 'قبله‌نما',
    },
    'quran': {
      AppLanguage.ckb: 'قورئان',
      AppLanguage.ar: 'القرآن الكريم',
      AppLanguage.en: 'Quran',
      AppLanguage.tr: 'Kur\'an',
      AppLanguage.fa: 'قرآن',
    },
    'tafsir': {
      AppLanguage.ckb: 'تەفسیر',
      AppLanguage.ar: 'التفسير',
      AppLanguage.en: 'Tafsir',
      AppLanguage.tr: 'Tefsir',
      AppLanguage.fa: 'تفسیر',
    },
    'tajweed': {
      AppLanguage.ckb: 'تەجوید',
      AppLanguage.ar: 'التجويد',
      AppLanguage.en: 'Tajweed',
      AppLanguage.tr: 'Tecvid',
      AppLanguage.fa: 'تجوید',
    },
    'daily_hadith': {
      AppLanguage.ckb: 'فەرموودەی ڕۆژانە',
      AppLanguage.ar: 'حديث يومي',
      AppLanguage.en: 'Daily Hadith',
      AppLanguage.tr: 'Günlük Hadis',
      AppLanguage.fa: 'حدیث روزانه',
    },
    'adhkar': {
      AppLanguage.ckb: 'زیکر و دوعا',
      AppLanguage.ar: 'الأذكار والدعاء',
      AppLanguage.en: 'Adhkar & Dua',
      AppLanguage.tr: 'Zikir ve Dua',
      AppLanguage.fa: 'اذکار و دعا',
    },
    'asma': {
      AppLanguage.ckb: 'ناوەکانی خودا',
      AppLanguage.ar: 'أسماء الله الحسنى',
      AppLanguage.en: 'Names of Allah',
      AppLanguage.tr: 'Esma-ül Hüsna',
      AppLanguage.fa: 'اسماء الحسنی',
    },
    'select_language': {
      AppLanguage.ckb: 'زمان هەڵبژێرە',
      AppLanguage.ar: 'اختر اللغة',
      AppLanguage.en: 'Select Language',
      AppLanguage.tr: 'Dil Seçin',
      AppLanguage.fa: 'انتخاب زبان',
    },
    'all_hadiths': {
      AppLanguage.ckb: 'هەموو فەرموودەکان',
      AppLanguage.ar: 'جميع الأحاديث',
      AppLanguage.en: 'All Hadiths',
      AppLanguage.tr: 'Tüm Hadisler',
      AppLanguage.fa: 'همه احادیث',
    },
    'makharij_tab': {
      AppLanguage.ckb: 'مەخارج (شوێنی دەرچوون)',
      AppLanguage.ar: 'مخارج الحروف',
      AppLanguage.en: 'Points of Articulation',
      AppLanguage.tr: 'Mahreçler',
      AppLanguage.fa: 'مخارج حروف',
    },
    'tajweed_rules_tab': {
      AppLanguage.ckb: 'یاساکانی تەجوید',
      AppLanguage.ar: 'أحكام التجويد',
      AppLanguage.en: 'Tajweed Rules',
      AppLanguage.tr: 'Tecvid Kuralları',
      AppLanguage.fa: 'احکام تجوید',
    },
    'quran_note': {
      AppLanguage.ckb: 'دەقی تەواوی قورئان بەم زووانە زیاد دەکرێت. دەتوانیت API‌ی قورئان زیاد بکەیت.',
      AppLanguage.ar: 'سيتم إضافة النص الكامل للقرآن قريباً. يمكنك إضافة واجهة برمجية للقرآن.',
      AppLanguage.en: 'The full Quran text will be added soon. You can connect a Quran API.',
      AppLanguage.tr: 'Kur\'an\'ın tam metni yakında eklenecek. Bir Kur\'an API\'si ekleyebilirsiniz.',
      AppLanguage.fa: 'متن کامل قرآن به‌زودی اضافه می‌شود. می‌توانید یک API قرآن اضافه کنید.',
    },
    'shafii_note': {
      AppLanguage.ckb: 'ئەم فێرکارییە بەپێی مەزهەبی ئیمام شافیعی ئامادەکراوە، بۆ منداڵ و گەورە. بە هەنگاوی ورد و ئاسان فێری نوێژ دەبیت.',
      AppLanguage.ar: 'أُعد هذا الشرح وفق المذهب الشافعي، للأطفال والكبار. ستتعلم الصلاة خطوة بخطوة بسهولة.',
      AppLanguage.en: 'This guide follows the Shafi\'i madhhab, for children and adults. Learn Salah step by step, easily.',
      AppLanguage.tr: 'Bu rehber Şafii mezhebine göre hazırlanmıştır, çocuklar ve yetişkinler için. Namazı adım adım kolayca öğrenin.',
      AppLanguage.fa: 'این آموزش بر اساس مذهب شافعی تهیه شده، برای کودکان و بزرگسالان. نماز را گام به گام و آسان یاد بگیرید.',
    },
    'qibla_hint': {
      AppLanguage.ckb: 'مۆبایلەکەت بە ئاسایی لەبەردەمتدا بگرە هەتا نیشانەی کەعبە بەرەو سەرەوە ڕابکێشێت.',
      AppLanguage.ar: 'أمسك هاتفك بشكل مسطح أمامك حتى تشير الكعبة إلى الأعلى.',
      AppLanguage.en: 'Hold your phone flat in front of you until the Kaaba icon points up.',
      AppLanguage.tr: 'Kabe simgesi yukarıyı gösterene kadar telefonunuzu düz tutun.',
      AppLanguage.fa: 'گوشی خود را صاف جلوی خود نگه دارید تا نماد کعبه به سمت بالا اشاره کند.',
    },
    'grant_location': {
      AppLanguage.ckb: 'ڕێگەپێدان بۆ شوێن پێویستە.',
      AppLanguage.ar: 'يلزم إذن الموقع.',
      AppLanguage.en: 'Location permission is required.',
      AppLanguage.tr: 'Konum izni gereklidir.',
      AppLanguage.fa: 'مجوز موقعیت مکانی لازم است.',
    },
    'enable_gps': {
      AppLanguage.ckb: 'تکایە GPS چالاک بکە.',
      AppLanguage.ar: 'يرجى تفعيل GPS.',
      AppLanguage.en: 'Please enable GPS.',
      AppLanguage.tr: 'Lütfen GPS\'i etkinleştirin.',
      AppLanguage.fa: 'لطفاً GPS را روشن کنید.',
    },
  };
}
