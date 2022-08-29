// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'besin_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BesinViewModel on _BesinViewModel, Store {
  final _$besinFutureAtom = Atom(name: '_BesinViewModel.besinFuture');

  @override
  ObservableFuture<BesinModel?>? get besinFuture {
    _$besinFutureAtom.reportRead();
    return super.besinFuture;
  }

  @override
  set besinFuture(ObservableFuture<BesinModel?>? value) {
    _$besinFutureAtom.reportWrite(value, super.besinFuture, () {
      super.besinFuture = value;
    });
  }

  final _$mevsimMeyveResultListAtom =
      Atom(name: '_BesinViewModel.mevsimMeyveResultList');

  @override
  ObservableList<Result?>? get mevsimMeyveResultList {
    _$mevsimMeyveResultListAtom.reportRead();
    return super.mevsimMeyveResultList;
  }

  @override
  set mevsimMeyveResultList(ObservableList<Result?>? value) {
    _$mevsimMeyveResultListAtom.reportWrite(value, super.mevsimMeyveResultList,
        () {
      super.mevsimMeyveResultList = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_BesinViewModel.pageState');

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

  final _$getBesinDatasAsyncAction =
      AsyncAction('_BesinViewModel.getBesinDatas');

  @override
  Future<dynamic> getBesinDatas() {
    return _$getBesinDatasAsyncAction.run(() => super.getBesinDatas());
  }

  @override
  String toString() {
    return '''
besinFuture: ${besinFuture},
mevsimMeyveResultList: ${mevsimMeyveResultList},
pageState: ${pageState}
    ''';
  }
}
