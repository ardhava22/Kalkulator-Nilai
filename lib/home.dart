import 'package:flutter/material.dart';
import '../Nilai.dart';
import '../Rata-rata.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeModeChanged;
  final ThemeMode themeMode;

  HomeScreen({required this.onThemeModeChanged, required this.themeMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  String _result = '';
  String _averageResult = '';



  void _updateResult(String result) {
    setState(() {
      _result = result;
    });
  }

  void _updateAverageResult(String result) {
    setState(() {
      _averageResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengelompokan Nilai Siswa',),
      ),
      body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Hitung Rata-rata dari Beberapa Nilai:',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                AverageScoreInput(onAverageResult: _updateAverageResult),
                SizedBox(height: 20),
                if (_averageResult.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.greenAccent),
                    ),
                    child: Text(
                      _averageResult,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                    widget.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                  ),
                    onPressed: widget.onThemeModeChanged,
                  ),
              ],
            ),
          ),
      );
  }
}