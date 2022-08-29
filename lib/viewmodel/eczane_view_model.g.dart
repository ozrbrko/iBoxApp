// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eczane_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EczaneViewModel on _EczaneViewModel, Store {
  final _$eczaneFutureAtom = Atom(name: '_EczaneViewModel.eczaneFuture');

  @override
  ObservableFuture<EczaneModel?>? get eczaneFuture {
    _$eczaneFutureAtom.reportRead();
    return super.eczaneFuture;
  }

  @override
  set eczaneFuture(ObservableFuture<EczaneModel?>? value) {
    _$eczaneFutureAtom.reportWrite(value, super.eczaneFuture, () {
      super.eczaneFuture = value;
    });
  }

  final _$eczaneResultListAtom =
      Atom(name: '_EczaneViewModel.eczaneResultList');

  @override
  ObservableList<EczaneResult?>? get eczaneResultList {
    _$eczaneResultListAtom.reportRead();
    return super.eczaneResultList;
  }

  @override
  set eczaneResultList(ObservableList<EczaneResult?>? value) {
    _$eczaneResultListAtom.reportWrite(value, super.eczaneResultList, () {
      super.eczaneResultList = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_EczaneViewModel.pageState');

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

  final _$getEczaneDatasAsyncAction =
      AsyncAction('_EczaneViewModel.getEczaneDatas');

  @override
  Future<dynamic> getEczaneDatas(String il, String ilce) {
    return _$getEczaneDatasAsyncAction
        .run(() => super.getEczaneDatas(il, ilce));
  }

  @override
  String toString() {
    return '''
eczaneFuture: ${eczaneFuture},
eczaneResultList: ${eczaneResultList},
pageState: ${pageState}
    ''';
  }
}
