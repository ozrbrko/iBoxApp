// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hava_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HavaViewModel on _HavaViewModel, Store {
  final _$havaFutureAtom = Atom(name: '_HavaViewModel.havaFuture');

  @override
  ObservableFuture<HavaModel?>? get havaFuture {
    _$havaFutureAtom.reportRead();
    return super.havaFuture;
  }

  @override
  set havaFuture(ObservableFuture<HavaModel?>? value) {
    _$havaFutureAtom.reportWrite(value, super.havaFuture, () {
      super.havaFuture = value;
    });
  }

  final _$havaResultListAtom = Atom(name: '_HavaViewModel.havaResultList');

  @override
  ObservableList<HavaResult?>? get havaResultList {
    _$havaResultListAtom.reportRead();
    return super.havaResultList;
  }

  @override
  set havaResultList(ObservableList<HavaResult?>? value) {
    _$havaResultListAtom.reportWrite(value, super.havaResultList, () {
      super.havaResultList = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_HavaViewModel.pageState');

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

  final _$getHavaDatasAsyncAction = AsyncAction('_HavaViewModel.getHavaDatas');

  @override
  Future<dynamic> getHavaDatas(String lang, String city) {
    return _$getHavaDatasAsyncAction.run(() => super.getHavaDatas(lang, city));
  }

  @override
  String toString() {
    return '''
havaFuture: ${havaFuture},
havaResultList: ${havaResultList},
pageState: ${pageState}
    ''';
  }
}
