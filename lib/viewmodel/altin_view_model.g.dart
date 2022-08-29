// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altin_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AltinViewModel on _AltinViewModel, Store {
  final _$altinFutureAtom = Atom(name: '_AltinViewModel.altinFuture');

  @override
  ObservableFuture<AltinModel?>? get altinFuture {
    _$altinFutureAtom.reportRead();
    return super.altinFuture;
  }

  @override
  set altinFuture(ObservableFuture<AltinModel?>? value) {
    _$altinFutureAtom.reportWrite(value, super.altinFuture, () {
      super.altinFuture = value;
    });
  }

  final _$altinResultListAtom = Atom(name: '_AltinViewModel.altinResultList');

  @override
  ObservableList<AltinResult?>? get altinResultList {
    _$altinResultListAtom.reportRead();
    return super.altinResultList;
  }

  @override
  set altinResultList(ObservableList<AltinResult?>? value) {
    _$altinResultListAtom.reportWrite(value, super.altinResultList, () {
      super.altinResultList = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_AltinViewModel.pageState');

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

  final _$getAltinDatasAsyncAction =
      AsyncAction('_AltinViewModel.getAltinDatas');

  @override
  Future<dynamic> getAltinDatas() {
    return _$getAltinDatasAsyncAction.run(() => super.getAltinDatas());
  }

  @override
  String toString() {
    return '''
altinFuture: ${altinFuture},
altinResultList: ${altinResultList},
pageState: ${pageState}
    ''';
  }
}
