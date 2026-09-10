class MakhrajGroup {
  final String title;
  final String letters;
  final String description;
  MakhrajGroup({required this.title, required this.letters, required this.description});
}

/// شوێنی دەرچوونی پیتەکان (مەخارج الحروف)
final List<MakhrajGroup> makhrajGroups = [
  MakhrajGroup(
    title: 'حەڵق (گەروو)',
    letters: 'ء ه ع ح غ خ',
    description: 'پیتەکانی گەروو، لە سێ شوێن دەردەچن: قووڵترین گەروو (ء ه)، ناوەڕاست (ع ح)، سەرووی گەروو (غ خ).',
  ),
  MakhrajGroup(
    title: 'زمان (بەشی دواوە)',
    letters: 'ق ك',
    description: 'لە بنی زمان لەگەڵ سەقفی سووک دەردەچن.',
  ),
  MakhrajGroup(
    title: 'زمان (ناوەڕاست)',
    letters: 'ج ش ي',
    description: 'لە ناوەڕاستی زمان لەگەڵ سەقف دەردەچن.',
  ),
  MakhrajGroup(
    title: 'لێواری زمان',
    letters: 'ض',
    description: 'لە لێواری زمان لەگەڵ ددانەکانی سەرەوە.',
  ),
  MakhrajGroup(
    title: 'سەری زمان',
    letters: 'ل ن ر',
    description: 'لە سەری زمان لەگەڵ سەقفی سووک، هەریەکە بە جیاوازی بچووک.',
  ),
  MakhrajGroup(
    title: 'زمان و ددان (سووت)',
    letters: 'ص س ز',
    description: 'دەنگی سووتیان هەیە، لەنێوان زمان و ددانی خوارەوە دەردەچن.',
  ),
  MakhrajGroup(
    title: 'زمان و ددان',
    letters: 'ث ذ ظ',
    description: 'سەری زمان لەگەڵ سەری ددانی سەرەوە.',
  ),
  MakhrajGroup(
    title: 'زمان و ددان (تی/دی/تا)',
    letters: 'ت د ط',
    description: 'سەری زمان لەگەڵ بنی ددانی سەرەوە.',
  ),
  MakhrajGroup(
    title: 'لێو',
    letters: 'ف ب م و',
    description: 'ف: ددانی سەرەوە لەگەڵ لێوی خوارەوە. ب م و: هەردوو لێو پێکەوە.',
  ),
  MakhrajGroup(
    title: 'لووت (خەیشوم)',
    letters: 'غونە',
    description: 'دەنگی خەیشوومی (غونە) کاتێک ن و م بە تەشدید یان نوون ساکن دەبن.',
  ),
];

class TajweedRule {
  final String title;
  final String description;
  TajweedRule({required this.title, required this.description});
}

final List<TajweedRule> tajweedRules = [
  TajweedRule(
    title: 'نوونی ساکن و تەنوین',
    description:
        'چوار حاڵەت: ئیزهار (ڕوونی) لەگەڵ پیتەکانی گەروو، ئیدغام (تێکەڵبوون)، ئیقلاب (گۆڕین بۆ م لای ب)، ئیخفا (شاردنەوە) لەگەڵ ١٥ پیتی تر.',
  ),
  TajweedRule(
    title: 'میمی ساکن',
    description: 'سێ حاڵەت: ئیخفای شەفەوی (لای ب)، ئیدغامی میمی (لای م)، ئیزهاری شەفەوی (لای پیتەکانی تر).',
  ),
  TajweedRule(
    title: 'مەدد (درێژکردنەوە)',
    description:
        'مەددی سروشتی (٢ حەرەکە)، مەددی موتەسیل و مونفەسیل (٤-٥ حەرەکە)، مەددی لازم (٦ حەرەکە) کاتێک پیتی مەدد بەرەو پیتی ساکن یان تەشدیددار دەڕوات.',
  ),
  TajweedRule(
    title: 'قەڵقەلە',
    description: 'پیتەکانی (ق ط ب ج د) کاتێک ساکن بن، دەنگێکی بچووکیان هەیە کاتی وتنیان.',
  ),
  TajweedRule(
    title: 'تەفخیم و تەرقیق',
    description: 'هەندێک پیت بە قەبارە (تەفخیم) دەوترێن وەک (خ ص ض ط ظ غ ق)، هەندێکیش بە سووکی (تەرقیق).',
  ),
];
