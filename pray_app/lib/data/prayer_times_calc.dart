import 'dart:math';

/// ژمێریاری کاتەکانی بانگ بە شێوازی ئەستەرناسی (بەبێ پێویستی بە ئینتەرنێت)
/// بنەما: زاویەی خۆر لەگەڵ ئاسۆ (کۆمیشنی ئیسلامیی موسلمینی ئەمریکای باکوور - ISNA)
class PrayerTimeResult {
  final DateTime fajr, sunrise, dhuhr, asr, maghrib, isha;
  PrayerTimeResult({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });
}

class PrayerTimeCalculator {
  static const double fajrAngle = 15.0;
  static const double ishaAngle = 15.0;

  static double _deg2rad(double d) => d * pi / 180;
  static double _rad2deg(double r) => r * 180 / pi;

  static PrayerTimeResult calculate({
    required DateTime date,
    required double latitude,
    required double longitude,
    required double timezoneOffsetHours,
  }) {
    final dayOfYear = int.parse(
      DateTime(date.year, date.month, date.day).difference(DateTime(date.year, 1, 1)).inDays.toString(),
    ) + 1;

    // ڕاستکردنەوەی وەلات خۆر (equation of time) و لادانی خۆر (declination)
    final gamma = 2 * pi / 365 * (dayOfYear - 1);
    final eqTime = 229.18 *
        (0.000075 +
            0.001868 * cos(gamma) -
            0.032077 * sin(gamma) -
            0.014615 * cos(2 * gamma) -
            0.040849 * sin(2 * gamma));
    final decl = 0.006918 -
        0.399912 * cos(gamma) +
        0.070257 * sin(gamma) -
        0.006758 * cos(2 * gamma) +
        0.000907 * sin(2 * gamma) -
        0.002697 * cos(3 * gamma) +
        0.00148 * sin(3 * gamma);

    double hourAngle(double angleDeg) {
      final lat = _deg2rad(latitude);
      final angle = _deg2rad(-angleDeg);
      final cosH = (sin(angle) - sin(lat) * sin(decl)) / (cos(lat) * cos(decl));
      final clamped = cosH.clamp(-1.0, 1.0);
      return _rad2deg(acos(clamped));
    }

    double timeForAngle(double angleDeg, {bool morning = true}) {
      final ha = hourAngle(angleDeg);
      final solarNoon = 720 - 4 * longitude - eqTime;
      final minutes = morning ? solarNoon - ha * 4 : solarNoon + ha * 4;
      return minutes;
    }

    DateTime minutesToDateTime(double minutesUtc) {
      final localMinutes = minutesUtc + timezoneOffsetHours * 60;
      final base = DateTime(date.year, date.month, date.day);
      return base.add(Duration(minutes: localMinutes.round()));
    }

    final solarNoonMin = 720 - 4 * longitude - eqTime;
    final dhuhrMin = solarNoonMin;
    final sunriseMin = timeForAngle(0.833, morning: true);
    final maghribMin = timeForAngle(0.833, morning: false);
    final fajrMin = timeForAngle(fajrAngle, morning: true);
    final ishaMin = timeForAngle(ishaAngle, morning: false);

    // عەسر: کاتێک سێبەری شت یەک+تانجێنتی ڕاستی خۆر (شافیعی/جمهور)
    final lat = _deg2rad(latitude);
    final asrFactor = 1.0;
    final asrAngleRad = atan(1 / (asrFactor + tan((lat - decl).abs())));
    final asrAltitude = _rad2deg(asrAngleRad);
    final asrMin = timeForAngle(90 - asrAltitude, morning: false);

    return PrayerTimeResult(
      fajr: minutesToDateTime(fajrMin),
      sunrise: minutesToDateTime(sunriseMin),
      dhuhr: minutesToDateTime(dhuhrMin),
      asr: minutesToDateTime(asrMin),
      maghrib: minutesToDateTime(maghribMin),
      isha: minutesToDateTime(ishaMin),
    );
  }
}
