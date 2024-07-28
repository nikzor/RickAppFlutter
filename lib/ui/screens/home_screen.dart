import 'package:flutter/material.dart';
import 'package:rick_app/ui/screens/characters_list_screen/characters_list_screen.dart';
import 'package:rick_app/ui/screens/favoutites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;
  final pages = [
    const CharactersListScreen(),
    const FavouritesScreen(),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_search,
            ),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.favorite,
            ),
            activeIcon: Icon(
              Icons.favorite,
              color: Colors.pink[200],
            ),
            label: 'Favourites',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(_currentIndex);
          });
        },
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        ),
      ),
    );
  }
}
