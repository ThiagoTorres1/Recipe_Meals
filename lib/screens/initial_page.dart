import 'package:flutter/material.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class InitialPage extends StatefulWidget {
  final List<Meal>? favoriteMeals;
  const InitialPage({Key? key, this.favoriteMeals}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _selectedScreenIndex = 0;
  List<Widget>? _screens;
  List<String>? _titles;

  @override
  void initState() {
    super.initState();
    _titles = ['Lista de Categorias', 'Meus Favoritos'];

    _screens = [
      CategoryScreen(),
      FavoriteScreen(favoriteMeals: widget.favoriteMeals),
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles![_selectedScreenIndex]),
      ),
      drawer: MainDrawer(),
      body: _screens![_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
