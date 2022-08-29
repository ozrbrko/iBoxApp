import 'package:case_infobox/Models/besin_model.dart';
import 'package:case_infobox/services/services.dart';
import 'package:mobx/mobx.dart';
import '../constants/enum.dart';
part 'besin_view_model.g.dart';


class BesinViewModel = _BesinViewModel with _$BesinViewModel;

abstract class _BesinViewModel with Store {
  BesinService? _service;
  BesinModel? besinModel;
  void init() {
    _service = BesinService();
  }

  @observable
  ObservableFuture<BesinModel?>? besinFuture;

  @observable
  ObservableList<Result?>? mevsimMeyveResultList =
  ObservableList<Result>();

  @observable
  PageState pageState = PageState.NORMAL;

  @action
  Future getBesinDatas() async {
    try {
      pageState = PageState.LOADING;

      besinFuture = ObservableFuture(_service!.getBesinData());
      besinModel =await besinFuture;

      pageState = PageState.SUCCESS;


      // besinFuture!.then((value) {
      //   print(value!.success.toString());
      //
      //   // value!.result!.mevsimMeyve!.forEach((element) {
      //   //   mevsimMeyveResultList!.add(element);
      //   // });
      //   // print("Listenin aaaa => aa"+mevsimMeyveResultList!.length.toString());
      //   // coronaResultList!.addAll(coronaModel!.result!);
      //
      //   pageState = PageState.SUCCESS;
      // });

    } catch (e) {
      pageState = PageState.ERROR;
    }
  }


}
