import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/View/Pages/home_page.dart';
import 'package:reddit/navigation/navigation_cubit.dart';
class NaviBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NaveCubit(),
        child: BlocBuilder<NaveCubit, int>(builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state,
              children: [
                HomePage(),
                HomePage()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state,
              onTap: (index) => context.read<NaveCubit>().selectTab(index),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'feed',
                ),


              ],
            ),
          );
        }));
  }
}
