import 'package:flutter/material.dart';
import 'package:guess_app/constants/theme/project_colors.dart';
import 'package:guess_app/feature/number_guess/view/number_guess_page.dart';
import 'package:guess_app/feature/score_board/view/score_board_page.dart';
import 'package:guess_app/feature/welcome_page/constants/welcome_page_constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WelcomePageConstants.appbarTitle),
      ),
      body: Stack(
        children: [
          _currentIndex == 0 ? const NumberGuessPage() : const ScoreBoardPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedFontSize: 17,
        selectedItemColor: ProjectGuessNumberColors.white,
        unselectedItemColor: ProjectGuessNumberColors.white,
        backgroundColor: ProjectGuessNumberColors.pink,
        items: [
          BottomNavigationBarItem(
            icon: const SizedBox.shrink(),
            label: WelcomePageConstants.bottomNavigationPlayButtonTitle,
          ),
          BottomNavigationBarItem(
            icon: const SizedBox.shrink(),
            label: WelcomePageConstants.bottomNavigationScoreButtonTitle,
          ),
        ],
      ),
    );
  }
}
