import 'package:case_infobox/services/services.dart';
import 'package:mobx/mobx.dart';

import '../Models/hava_model.dart';
import '../constants/enum.dart';

part 'hava_view_model.g.dart';

class HavaViewModel = _HavaViewModel with _$HavaViewModel;

abstract class _HavaViewModel with Store {
  HavaService? _service;
  // CoronaModel? coronaModel;

  void init() {
    _service = HavaService();
  }

  @observable
  ObservableFuture<HavaModel?>? havaFuture;

  @observable
  ObservableList<HavaResult?>? havaResultList =
  ObservableList<HavaResult>();

  @observable
  PageState pageState = PageState.NORMAL;

  @action
  Future getHavaDatas(String lang,String city) async {
    try {
      pageState = PageState.LOADING;

      havaFuture = ObservableFuture(_service!.getHavaData(lang,city));
      havaFuture!.then((value) {
        value!.result!.forEach((element) {
          havaResultList!.add(element);
        });
        print("Listenin countu => "+havaResultList!.length.toString());
        // coronaResultList!.addAll(coronaModel!.result!);

        pageState = PageState.SUCCESS;
      });
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }


}
