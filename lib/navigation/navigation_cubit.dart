import 'package:flutter_bloc/flutter_bloc.dart';
class NaveCubit extends Cubit<int>{
  NaveCubit() : super(0);
  void selectTab(int index) => emit(index);
}