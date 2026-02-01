import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/presentation/views/profile_view.dart';
import 'package:hungry/features/cart/presentation/views/cart_view.dart';
import 'package:hungry/features/home/presentation/views/home_view.dart';
import 'package:hungry/features/orderHistory/presentation/views/order_history_view.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key, required this.user});
  final UserEntity user;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late PageController controller = PageController();
  int currentScreen = 0;
  late final List<Widget> screens;
  @override
  void initState() {
    super.initState();
    screens = [
      HomeView(user: widget.user),
      CartView(),
      OrderHistoryView(),
      ProfileView(),
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500.withOpacity(0.7),
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
          currentIndex: currentScreen,
          onTap: (v) {
            setState(() {
              currentScreen = v;
            });
            controller.jumpToPage(currentScreen);
          },
        ),
      ),
    );
  }
}
