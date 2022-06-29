import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Types/Comments.dart';
import 'FeedView.dart';
import 'Feed_Cubit.dart';


class FeedNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedNavigatorCubit(),
      child: BlocBuilder<FeedNavigatorCubit, FeedNavigatorState>(
          builder: (context, state) {
            return Navigator(
              pages: [
                MaterialPage(child: (FeedView())),
                //if (state == HomeNavigatorState.profile)
                  //MaterialPage(child: ProfileView()),
                if (state == FeedNavigatorState.comments)
                  MaterialPage(child: Comments())
              ],
              onPopPage: (route, result) {
                context.read<FeedNavigatorCubit>().showHome();
                return route.didPop(result);
              },
            );
          }),
    );
  }
}