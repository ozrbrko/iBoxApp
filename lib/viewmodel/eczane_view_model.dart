import 'package:case_infobox/Models/eczane_model.dart';
import 'package:case_infobox/services/services.dart';
import 'package:mobx/mobx.dart';

import '../Models/hava_model.dart';
import '../constants/enum.dart';

part 'eczane_view_model.g.dart';

class EczaneViewModel = _EczaneViewModel with _$EczaneViewModel;

abstract class _EczaneViewModel with Store {
  EczaneService? _service;
  // CoronaModel? coronaModel;

  void init() {
    _service = EczaneService();
  }

  @observable
  ObservableFuture<EczaneModel?>? eczaneFuture;

  @observable
  ObservableList<EczaneResult?>? eczaneResultList =
  ObservableList<EczaneResult>();

  @observable
  PageState pageState = PageState.NORMAL;

  @action
  Future getEczaneDatas(String il,String ilce) async {
    try {
      pageState = PageState.LOADING;

      eczaneFuture = ObservableFuture(_service!.getEczaneData(il,ilce));
      eczaneFuture!.then((value) {
        value!.result!.forEach((element) {
          eczaneResultList!.add(element);
        });
        print("Listenin countu => "+eczaneResultList!.length.toString());
        // coronaResultList!.addAll(coronaModel!.result!);

        pageState = PageState.SUCCESS;
      });
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }


}
