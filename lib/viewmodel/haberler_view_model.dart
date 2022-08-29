import 'package:case_infobox/services/services.dart';
import 'package:mobx/mobx.dart';

import '../Models/haberler_model.dart';
import '../constants/enum.dart';

part 'haberler_view_model.g.dart';

class HaberlerViewModel = _HaberlerViewModel with _$HaberlerViewModel;

abstract class _HaberlerViewModel with Store {
  HaberlerService? _service;
  // CoronaModel? coronaModel;

  void init() {
    _service = HaberlerService();
  }

  @observable
  ObservableFuture<HaberlerModel?>? haberlerFuture;

  @observable
  ObservableList<HaberlerResult?>? haberlerResultList =
  ObservableList<HaberlerResult>();

  @observable
  PageState pageState = PageState.NORMAL;

  @action
  Future getHaberlerDatas() async {
    try {
      pageState = PageState.LOADING;

      haberlerFuture = ObservableFuture(_service!.getHaberlerData());
      haberlerFuture!.then((value) {
        value!.result!.forEach((element) {
          haberlerResultList!.add(element);
        });
        print("Listenin countu => "+haberlerResultList!.length.toString());
        // coronaResultList!.addAll(coronaModel!.result!);

        pageState = PageState.SUCCESS;
      });
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }


}
