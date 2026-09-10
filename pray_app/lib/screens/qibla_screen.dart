import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import '../theme/app_theme.dart';
import '../l10n/strings.dart';

// کۆردینەیتی کەعبە
const double _kaabaLat = 21.4225;
const double _kaabaLng = 39.8262;

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});
  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? _qiblaBearing;
  String _status = 'وەرگرتنی شوێن...';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
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
      final bearing = _calculateQiblaBearing(pos.latitude, pos.longitude);
      setState(() {
        _qiblaBearing = bearing;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _status = 'هەڵەیەک ڕوویدا.';
        _loading = false;
      });
    }
  }

  double _calculateQiblaBearing(double lat, double lng) {
    final lat1 = lat * pi / 180;
    final lat2 = _kaabaLat * pi / 180;
    final dLng = (_kaabaLng - lng) * pi / 180;
    final y = sin(dLng) * cos(lat2);
    final x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLng);
    var bearing = atan2(y, x) * 180 / pi;
    bearing = (bearing + 360) % 360;
    return bearing;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L.t('qibla'))),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _qiblaBearing == null
              ? Center(child: Padding(padding: const EdgeInsets.all(24), child: Text(_status)))
              : StreamBuilder<CompassEvent>(
                  stream: FlutterCompass.events,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: Text('پشکنینی کۆمپاس ناکرێت لەم ئامێرەدا'));
                    }
                    final heading = snapshot.data!.heading ?? 0;
                    final angle = ((_qiblaBearing! - heading) * pi / 180);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text('${_qiblaBearing!.toStringAsFixed(0)}° لە باکوورەوە',
                            style: const TextStyle(fontSize: 16, color: AppColors.textMuted)),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 260,
                          height: 260,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.gold, width: 3),
                                  color: AppColors.cardWhite,
                                ),
                              ),
                              Transform.rotate(
                                angle: angle,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('🕋', style: TextStyle(fontSize: 46)),
                                    SizedBox(height: 4),
                                    Icon(Icons.arrow_upward, size: 40, color: AppColors.primaryGreen),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            L.t('qibla_hint'),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: AppColors.textMuted),
                          ),
                        ),
                        const Spacer(),
                      ],
                    );
                  },
                ),
    );
  }
}
