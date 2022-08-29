import 'package:case_infobox/services/services.dart';
import 'package:mobx/mobx.dart';

import '../Models/altin_model.dart';
import '../constants/enum.dart';

part 'altin_view_model.g.dart';

class AltinViewModel = _AltinViewModel with _$AltinViewModel;

abstract class _AltinViewModel with Store {
  AltinService? _service;
  // CoronaModel? coronaModel;

  void init() {
    _service = AltinService();
  }

  @observable
  ObservableFuture<AltinModel?>? altinFuture;

  @observable
  ObservableList<AltinResult?>? altinResultList =
  ObservableList<AltinResult>();

  @observable
  PageState pageState = PageState.NORMAL;

  @action
  Future getAltinDatas() async {
    try {
      pageState = PageState.LOADING;

      altinFuture = ObservableFuture(_service!.getAltinData());
      altinFuture!.then((value) {
        value!.result!.forEach((element) {
          altinResultList!.add(element);
        });
        print("Listenin countu => "+altinResultList!.length.toString());
        // coronaResultList!.addAll(coronaModel!.result!);

        pageState = PageState.SUCCESS;
      });
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }


}
