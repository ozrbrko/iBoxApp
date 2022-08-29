// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kripto_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$KriptoViewModel on _KriptoViewModel, Store {
  final _$kriptoFutureAtom = Atom(name: '_KriptoViewModel.kriptoFuture');

  @override
  ObservableFuture<KriptoModel?>? get kriptoFuture {
    _$kriptoFutureAtom.reportRead();
    return super.kriptoFuture;
  }

  @override
  set kriptoFuture(ObservableFuture<KriptoModel?>? value) {
    _$kriptoFutureAtom.reportWrite(value, super.kriptoFuture, () {
      super.kriptoFuture = value;
    });
  }

  final _$kriptoResultListAtom =
      Atom(name: '_KriptoViewModel.kriptoResultList');

  @override
  ObservableList<KriptoResult?>? get kriptoResultList {
    _$kriptoResultListAtom.reportRead();
    return super.kriptoResultList;
  }

  @override
  set kriptoResultList(ObservableList<KriptoResult?>? value) {
    _$kriptoResultListAtom.reportWrite(value, super.kriptoResultList, () {
      super.kriptoResultList = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_KriptoViewModel.pageState');

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  final _$getKriptoDatasAsyncAction =
      AsyncAction('_KriptoViewModel.getKriptoDatas');

  @override
  Future<dynamic> getKriptoDatas() {
    return _$getKriptoDatasAsyncAction.run(() => super.getKriptoDatas());
  }

  @override
  String toString() {
    return '''
kriptoFuture: ${kriptoFuture},
kriptoResultList: ${kriptoResultList},
pageState: ${pageState}
    ''';
  }
}
