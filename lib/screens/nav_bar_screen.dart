import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/cuibts/navbar_cuibt.dart';

import 'home_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    final _pages = [HomeScreen()];
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar:
            BlocBuilder<NavBarCubit, NavBarState>(builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  label: 'Wallet')
            ],
            onTap: (index) {},
          );
        }));
  }
}
