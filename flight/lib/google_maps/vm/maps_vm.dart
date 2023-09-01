import 'package:mobx/mobx.dart';

part 'maps_vm.g.dart';

class MapsViewModel = MapsViewBase with _$MapsViewModel;

abstract class MapsViewBase with Store {
  @observable
  String? title;

  @action
  void changeAppBarName({required String text}) {
    title = text;
  }
}
