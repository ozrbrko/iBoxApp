import 'package:case_infobox/services/services.dart';
import 'package:mobx/mobx.dart';

import '../Models/doviz_model.dart';
import '../constants/enum.dart';

part 'doviz_view_model.g.dart';

class DovizViewModel = _DovizViewModel with _$DovizViewModel;

abstract class _DovizViewModel with Store {
  DovizService? _service;
  // CoronaModel? coronaModel;

  void init() {
    _service = DovizService();
  }

  @observable
  ObservableFuture<DovizModel?>? dovizFuture;

  @observable
  ObservableList<DovizResult?>? dovizResultList =
  ObservableList<DovizResult>();

  @observable
  PageState pageState = PageState.NORMAL;

  @action
  Future getDovizDatas() async {
    try {
      pageState = PageState.LOADING;

      dovizFuture = ObservableFuture(_service!.getDovizData());
      dovizFuture!.then((value) {
        value!.result!.forEach((element) {
          dovizResultList!.add(element);
        });
        print("Listenin countu => "+dovizResultList!.length.toString());
        // coronaResultList!.addAll(coronaModel!.result!);

        pageState = PageState.SUCCESS;
      });
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }


}
