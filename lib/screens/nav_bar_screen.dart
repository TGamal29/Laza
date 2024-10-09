import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/cuibts/navbar_cuibt.dart';
import 'package:laza/screens/cart_screen.dart';

import '../colors/colors.dart';
import 'home_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    final _pages = [HomeScreen()];
    return Scaffold(
      body: BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            if (state.navbarItem == NavbarItem.home) {
              return HomeScreen();
            } else if (state.navbarItem == NavbarItem.cart) {
              return CartScreen();
            } else if (state.navbarItem == NavbarItem.wallet) {
              // return ProfileScreen();
            }
            return Container();
          }),

      bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            showSelectedLabels: false,
            showUnselectedLabels: false,

            items: const [
              BottomNavigationBarItem(
                  activeIcon: Text('Home',style: TextStyle(color: bgscreen1,fontWeight: FontWeight.w500),),
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  activeIcon: Text('Cart',style: TextStyle(color: bgscreen1,fontWeight: FontWeight.w500)),
                  icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  activeIcon: Text('Wallet',style: TextStyle(color: bgscreen1,fontWeight: FontWeight.w500)),
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  label: 'Wallet')
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavBarCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavBarCubit>(context)
                    .getNavBarItem(NavbarItem.cart);
              } else if (index == 2) {
                BlocProvider.of<NavBarCubit>(context)
                    .getNavBarItem(NavbarItem.wallet);
              }
            },
          );
        },
      ),

    );
  }
}

