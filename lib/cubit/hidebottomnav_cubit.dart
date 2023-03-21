import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hidebottomnav_state.dart';

class HidebottomnavCubit extends Cubit<HidebottomnavState> {
  HidebottomnavCubit() : super(const HidebottomnavState());

  void showBottomNav(bool show) {
    emit(HidebottomnavState(show));
  }
}
