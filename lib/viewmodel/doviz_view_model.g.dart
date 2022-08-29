// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DovizViewModel on _DovizViewModel, Store {
  final _$dovizFutureAtom = Atom(name: '_DovizViewModel.dovizFuture');

  @override
  ObservableFuture<DovizModel?>? get dovizFuture {
    _$dovizFutureAtom.reportRead();
    return super.dovizFuture;
  }

  @override
  set dovizFuture(ObservableFuture<DovizModel?>? value) {
    _$dovizFutureAtom.reportWrite(value, super.dovizFuture, () {
      super.dovizFuture = value;
    });
  }

  final _$dovizResultListAtom = Atom(name: '_DovizViewModel.dovizResultList');

  @override
  ObservableList<DovizResult?>? get dovizResultList {
    _$dovizResultListAtom.reportRead();
    return super.dovizResultList;
  }

  @override
  set dovizResultList(ObservableList<DovizResult?>? value) {
    _$dovizResultListAtom.reportWrite(value, super.dovizResultList, () {
      super.dovizResultList = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_DovizViewModel.pageState');

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

  final _$getDovizDatasAsyncAction =
      AsyncAction('_DovizViewModel.getDovizDatas');

  @override
  Future<dynamic> getDovizDatas() {
    return _$getDovizDatasAsyncAction.run(() => super.getDovizDatas());
  }

  @override
  String toString() {
    return '''
dovizFuture: ${dovizFuture},
dovizResultList: ${dovizResultList},
pageState: ${pageState}
    ''';
  }
}
