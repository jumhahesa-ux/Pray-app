import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';
import '../data/prayer_times_calc.dart';
import '../l10n/strings.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});
  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  PrayerTimeResult? _result;
  String _status = 'وەرگرتنی شوێن...';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _status = L.t('enable_gps');
          _loading = false;
        });
        return;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        setState(() {
          _status = L.t('grant_location');
          _loading = false;
        });
        return;
      }
      final pos = await Geolocator.getCurrentPosition();
      final tzOffset = DateTime.now().timeZoneOffset.inMinutes / 60.0;
      final result = PrayerTimeCalculator.calculate(
        date: DateTime.now(),
        latitude: pos.latitude,
        longitude: pos.longitude,
        timezoneOffsetHours: tzOffset,
      );
      setState(() {
        _result = result;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _status = 'هەڵەیەک ڕوویدا لە وەرگرتنی شوێن.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L.t('prayer_times')),
        actions: [IconButton(onPressed: _load, icon: const Icon(Icons.refresh))],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _result == null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(_status, textAlign: TextAlign.center),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(DateFormat('EEEE، d MMMM yyyy').format(DateTime.now()),
                        textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textMuted)),
                    const SizedBox(height: 16),
                    _timeCard('بانگی بەیانی (فەجر)', _result!.fajr, '🌄'),
                    _timeCard('خۆرهەڵاتن', _result!.sunrise, '☀️'),
                    _timeCard('نیوەڕۆ (زوهر)', _result!.dhuhr, '🕛'),
                    _timeCard('عەسر', _result!.asr, '🌤️'),
                    _timeCard('ئێوارە (مەغریب)', _result!.maghrib, '🌇'),
                    _timeCard('شەو (عیشا)', _result!.isha, '🌙'),
                    const SizedBox(height: 12),
                    const Text(
                      'کاتەکان بە شێوازی ئەستەرناسی ژمێردراون بەپێی شوێنی ئێستات، مومکینە کەمێک جیاواز بێت لەگەڵ کاتی فەرمی شارەکەت.',
                      style: TextStyle(fontSize: 12, color: AppColors.textMuted),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
    );
  }

  Widget _timeCard(String name, DateTime time, String icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Text(icon, style: const TextStyle(fontSize: 26)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(DateFormat('hh:mm a').format(time),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryGreen)),
      ),
    );
  }
}
