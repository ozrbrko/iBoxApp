// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haberler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HaberlerViewModel on _HaberlerViewModel, Store {
  final _$haberlerFutureAtom = Atom(name: '_HaberlerViewModel.haberlerFuture');

  @override
  ObservableFuture<HaberlerModel?>? get haberlerFuture {
    _$haberlerFutureAtom.reportRead();
    return super.haberlerFuture;
  }

  @override
  set haberlerFuture(ObservableFuture<HaberlerModel?>? value) {
    _$haberlerFutureAtom.reportWrite(value, super.haberlerFuture, () {
      super.haberlerFuture = value;
    });
  }

  final _$haberlerResultListAtom =
      Atom(name: '_HaberlerViewModel.haberlerResultList');

  @override
  ObservableList<HaberlerResult?>? get haberlerResultList {
    _$haberlerResultListAtom.reportRead();
    return super.haberlerResultList;
  }

  @override
  set haberlerResultList(ObservableList<HaberlerResult?>? value) {
    _$haberlerResultListAtom.reportWrite(value, super.haberlerResultList, () {
      super.haberlerResultList = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_HaberlerViewModel.pageState');

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

  final _$getHaberlerDatasAsyncAction =
      AsyncAction('_HaberlerViewModel.getHaberlerDatas');

  @override
  Future<dynamic> getHaberlerDatas() {
    return _$getHaberlerDatasAsyncAction.run(() => super.getHaberlerDatas());
  }

  @override
  String toString() {
    return '''
haberlerFuture: ${haberlerFuture},
haberlerResultList: ${haberlerResultList},
pageState: ${pageState}
    ''';
  }
}
