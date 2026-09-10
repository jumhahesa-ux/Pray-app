class DhikrItem {
  final String arabic;
  final String meaning;
  final int count;
  DhikrItem({required this.arabic, required this.meaning, this.count = 1});
}

class DhikrCategory {
  final String title;
  final String icon;
  final List<DhikrItem> items;
  DhikrCategory({required this.title, required this.icon, required this.items});
}

final List<DhikrCategory> adhkarCategories = [
  DhikrCategory(
    title: 'زیکری دوای نوێژ',
    icon: '🕌',
    items: [
      DhikrItem(arabic: 'أَسْتَغْفِرُ اللَّهَ', meaning: 'داوای لێخۆشبوون دەکەم لە خودا', count: 3),
      DhikrItem(
        arabic: 'اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ',
        meaning: 'خودایە تۆ سەلامیت و ئاشتی لە تۆوە دێت',
      ),
      DhikrItem(arabic: 'سُبْحَانَ اللَّهِ', meaning: 'پاکی بۆ خودا', count: 33),
      DhikrItem(arabic: 'الْحَمْدُ لِلَّهِ', meaning: 'ستایش بۆ خودا', count: 33),
      DhikrItem(arabic: 'اللَّهُ أَكْبَرُ', meaning: 'خودا گەورەترینە', count: 33),
    ],
  ),
  DhikrCategory(
    title: 'زیکری بەیانی',
    icon: '🌅',
    items: [
      DhikrItem(
        arabic: 'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ',
        meaning: 'بەیانیمان کرد و موڵکی هەموو شتێک هی خودایە',
      ),
      DhikrItem(
        arabic: 'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا',
        meaning: 'خودایە بە یارمەتی تۆ بەیانیمان کرد و بەیارمەتی تۆ ئێوارە دەکەین',
      ),
      DhikrItem(arabic: 'آيَةُ الْكُرْسِيِّ', meaning: 'ئایەتی کورسی (خوێندنەوەی بۆ پارێزراوی ڕۆژانە)'),
    ],
  ),
  DhikrCategory(
    title: 'زیکری ئێوارە',
    icon: '🌇',
    items: [
      DhikrItem(
        arabic: 'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ',
        meaning: 'ئێوارەمان کرد و موڵکی هەموو شتێک هی خودایە',
      ),
      DhikrItem(
        arabic: 'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَافِيَةَ',
        meaning: 'خودایە داوای چاکی و تەندروستیت لێ دەکەم',
      ),
    ],
  ),
  DhikrCategory(
    title: 'زیکری گشتی',
    icon: '📿',
    items: [
      DhikrItem(arabic: 'لَا إِلَهَ إِلَّا اللَّهُ', meaning: 'هیچ خودایەک نییە جگە لە خودا'),
      DhikrItem(arabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ', meaning: 'پاکی و ستایش بۆ خودا', count: 100),
      DhikrItem(
        arabic: 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
        meaning: 'هیچ هێز و توانایەک نییە بێ یارمەتی خودا',
      ),
    ],
  ),
];
