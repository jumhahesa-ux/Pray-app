class HadithItem {
  final String arabic;
  final String translation;
  final String source;
  HadithItem({required this.arabic, required this.translation, required this.source});
}

final List<HadithItem> hadithList = [
  HadithItem(
    arabic: 'إِنَّمَا الأَعْمَالُ بِالنِّيَّاتِ',
    translation: 'بێگومان کردەوەکان بە نیەتەکانیانەوەن.',
    source: 'بوخاری و موسلم',
  ),
  HadithItem(
    arabic: 'الصَّلاَةُ عِمَادُ الدِّينِ',
    translation: 'نوێژ ستوونی ئایینە.',
    source: 'بەیهەقی',
  ),
  HadithItem(
    arabic: 'مَنْ لَا يَرْحَمُ لَا يُرْحَمُ',
    translation: 'ئەوەی بەزەیی نیشان نەدات، بەزەیی پێی نایەت.',
    source: 'بوخاری',
  ),
  HadithItem(
    arabic: 'الدِّينُ النَّصِيحَةُ',
    translation: 'ئایین ڕاوێژ و دڵسۆزییە.',
    source: 'موسلم',
  ),
  HadithItem(
    arabic: 'مَنْ صَمَتَ نَجَا',
    translation: 'ئەوەی بێدەنگ بێت، ڕزگاری دەبێت.',
    source: 'تیرمزی',
  ),
  HadithItem(
    arabic: 'الطُّهُورُ شَطْرُ الإِيمَانِ',
    translation: 'پاکی نیوەی ئیمانە.',
    source: 'موسلم',
  ),
  HadithItem(
    arabic: 'بُنِيَ الْإِسْلَامُ عَلَى خَمْسٍ',
    translation: 'ئیسلام لەسەر پێنج بناغە دامەزراوە: شایەتیدان، نوێژ، زەکات، ڕۆژوو، حەج.',
    source: 'بوخاری و موسلم',
  ),
  HadithItem(
    arabic: 'خَيْرُكُمْ مَنْ تَعَلَّمَ الْقُرْآنَ وَعَلَّمَهُ',
    translation: 'باشترینتان ئەوەیە قورئان فێر بێت و فێری کەسانی تر بکات.',
    source: 'بوخاری',
  ),
  HadithItem(
    arabic: 'لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ',
    translation: 'ئیمانی هیچ کەستان تەواو نابێت هەتا ئەوەی بۆ خۆی حەز لێی دەکات بۆ برای ئیمانیشی حەز لێ نەکات.',
    source: 'بوخاری و موسلم',
  ),
  HadithItem(
    arabic: 'التَّبَسُّمُ فِي وَجْهِ أَخِيكَ صَدَقَةٌ',
    translation: 'زەردەخەنە بۆ ڕووی برات خێرێکە (سەدەقەیە).',
    source: 'تیرمزی',
  ),
];

HadithItem hadithOfDay(DateTime date) {
  final dayOfYear = date.difference(DateTime(date.year, 1, 1)).inDays;
  return hadithList[dayOfYear % hadithList.length];
}
