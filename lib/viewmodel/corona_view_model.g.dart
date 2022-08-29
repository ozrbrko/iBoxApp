// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corona_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoronaViewModel on _CoronaViewModel, Store {
  final _$coronaFutureAtom = Atom(name: '_CoronaViewModel.coronaFuture');

  @override
  ObservableFuture<CoronaModel?>? get coronaFuture {
    _$coronaFutureAtom.reportRead();
    return super.coronaFuture;
  }

  @override
  set coronaFuture(ObservableFuture<CoronaModel?>? value) {
    _$coronaFutureAtom.reportWrite(value, super.coronaFuture, () {
      super.coronaFuture = value;
    });
  }

  final _$coronaResultListAtom =
      Atom(name: '_CoronaViewModel.coronaResultList');

  @override
  ObservableList<CoronaResult?>? get coronaResultList {
    _$coronaResultListAtom.reportRead();
    return super.coronaResultList;
  }

  @override
  set coronaResultList(ObservableList<CoronaResult?>? value) {
    _$coronaResultListAtom.reportWrite(value, super.coronaResultList, () {
      super.coronaResultList = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_CoronaViewModel.pageState');

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

  final _$getCoronaDatasAsyncAction =
      AsyncAction('_CoronaViewModel.getCoronaDatas');

  @override
  Future<dynamic> getCoronaDatas() {
    return _$getCoronaDatasAsyncAction.run(() => super.getCoronaDatas());
  }

  @override
  String toString() {
    return '''
coronaFuture: ${coronaFuture},
coronaResultList: ${coronaResultList},
pageState: ${pageState}
    ''';
  }
}
