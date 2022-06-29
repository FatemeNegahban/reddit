import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/navigation/navigation_cubit.dart';
import '../View/pages/Feed/Feed_page.dart';
import '../View/pages/Search_page.dart';

class NaviBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NaveCubit(),
        child: BlocBuilder<NaveCubit, int>(builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Search"),
              actions: [
                IconButton(
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => SearchPage())),
                    icon: Icon(Icons.search))
              ],
            ),
            body: IndexedStack(
              index: state,
              children: [
                FeedPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state,
              onTap: (index) => context.read<NaveCubit>().selectTab(index),
              items:[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  label: 'setting',
                ),

                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: 'feed',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  label: 'Add post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people,
                    color: Colors.black,
                  ),
                  label: 'Add post',
                ),
              ],
            ),
          );
        }));
  }
}
