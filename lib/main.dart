import 'package:flutter/material.dart';
import 'package:money_planner/assets/theme/theme.dart';
import 'package:money_planner/screens/home_page.dart';
import 'package:money_planner/screens/statistics_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  List<Widget> _getWidgetOptions() {
    return [
      HomePage(toggleTheme: _toggleTheme, themeMode: _themeMode),
      const StatisticsPage(),
    ];
  }

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Planning App',
      theme: CustomTheme.theme,
      darkTheme: CustomDarkModeTheme.theme,
      themeMode: _themeMode,
      home: Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return SizedBox(
      height: 100,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Statistic',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onTabTapped,
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _getWidgetOptions().elementAt(_currentIndex),
        ),
      ),
    );
  }
}
