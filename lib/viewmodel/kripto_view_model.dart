import 'package:case_infobox/services/services.dart';
import 'package:mobx/mobx.dart';
import '../Models/kripto_model.dart';
import '../constants/enum.dart';
part 'kripto_view_model.g.dart';

class KriptoViewModel = _KriptoViewModel with _$KriptoViewModel;

abstract class _KriptoViewModel with Store {
  KriptoService? _service;
  // CoronaModel? coronaModel;

  void init() {
    _service = KriptoService();
  }

  @observable
  ObservableFuture<KriptoModel?>? kriptoFuture;

  @observable
  ObservableList<KriptoResult?>? kriptoResultList =
  ObservableList<KriptoResult>();

  @observable
  PageState pageState = PageState.NORMAL;

  @action
  Future getKriptoDatas() async {
    try {
      pageState = PageState.LOADING;

      kriptoFuture = ObservableFuture(_service!.getKriptoData());
      kriptoFuture!.then((value) {
        value!.result!.forEach((element) {
          kriptoResultList!.add(element);
        });
        print("Listenin countu => "+kriptoResultList!.length.toString());
        // coronaResultList!.addAll(coronaModel!.result!);

        pageState = PageState.SUCCESS;
      });
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }


}
