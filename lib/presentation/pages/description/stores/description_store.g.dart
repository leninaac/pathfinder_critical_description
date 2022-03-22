// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'description_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DescriptionStore on _DescriptionStore, Store {
  final _$isLoadingAtom = Atom(name: '_DescriptionStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$effectTypeAtom = Atom(name: '_DescriptionStore.effectType');

  @override
  String get effectType {
    _$effectTypeAtom.reportRead();
    return super.effectType;
  }

  @override
  set effectType(String value) {
    _$effectTypeAtom.reportWrite(value, super.effectType, () {
      super.effectType = value;
    });
  }

  final _$effectTitleAtom = Atom(name: '_DescriptionStore.effectTitle');

  @override
  String get effectTitle {
    _$effectTitleAtom.reportRead();
    return super.effectTitle;
  }

  @override
  set effectTitle(String value) {
    _$effectTitleAtom.reportWrite(value, super.effectTitle, () {
      super.effectTitle = value;
    });
  }

  final _$effectDescriptionAtom =
      Atom(name: '_DescriptionStore.effectDescription');

  @override
  String get effectDescription {
    _$effectDescriptionAtom.reportRead();
    return super.effectDescription;
  }

  @override
  set effectDescription(String value) {
    _$effectDescriptionAtom.reportWrite(value, super.effectDescription, () {
      super.effectDescription = value;
    });
  }

  final _$effectTypeBannerAtom =
      Atom(name: '_DescriptionStore.effectTypeBanner');

  @override
  String get effectTypeBanner {
    _$effectTypeBannerAtom.reportRead();
    return super.effectTypeBanner;
  }

  @override
  set effectTypeBanner(String value) {
    _$effectTypeBannerAtom.reportWrite(value, super.effectTypeBanner, () {
      super.effectTypeBanner = value;
    });
  }

  final _$effectTypeBackgroundAtom =
      Atom(name: '_DescriptionStore.effectTypeBackground');

  @override
  String get effectTypeBackground {
    _$effectTypeBackgroundAtom.reportRead();
    return super.effectTypeBackground;
  }

  @override
  set effectTypeBackground(String value) {
    _$effectTypeBackgroundAtom.reportWrite(value, super.effectTypeBackground,
        () {
      super.effectTypeBackground = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
effectType: ${effectType},
effectTitle: ${effectTitle},
effectDescription: ${effectDescription},
effectTypeBanner: ${effectTypeBanner},
effectTypeBackground: ${effectTypeBackground}
    ''';
  }
}
