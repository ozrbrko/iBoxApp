import 'package:case_infobox/services/services.dart';
import 'package:mobx/mobx.dart';

import '../Models/corona_model.dart';
import '../Models/haberler_model.dart';
import '../constants/enum.dart';

part 'corona_view_model.g.dart';

class CoronaViewModel = _CoronaViewModel with _$CoronaViewModel;

abstract class _CoronaViewModel with Store {
  CoronaService? _service;
  // CoronaModel? coronaModel;

  void init() {
    _service = CoronaService();
  }

  @observable
  ObservableFuture<CoronaModel?>? coronaFuture;

  @observable
  ObservableList<CoronaResult?>? coronaResultList =
  ObservableList<CoronaResult>();

  @observable
  PageState pageState = PageState.NORMAL;

  @action
  Future getCoronaDatas() async {
    try {
      pageState = PageState.LOADING;

      coronaFuture = ObservableFuture(_service!.getCoronaData());
      coronaFuture!.then((value) {
        value!.result!.forEach((element) {
          coronaResultList!.add(element);
        });
        print("Listenin countu => "+coronaResultList!.length.toString());
        // coronaResultList!.addAll(coronaModel!.result!);

        pageState = PageState.SUCCESS;
      });
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }


}
