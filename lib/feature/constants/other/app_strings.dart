import 'package:flutter/material.dart';

@immutable
class AppStrings {
  const AppStrings._();

  // app name
  static const String appName = 'Windesk FM Mobile V1';

  // app navigation tabs
  static const String homeTab = 'Ana Sayfa';
  static const String newOrderTab = 'Yeni İş Emri';
  static const String searchTab = 'Arama';
  static const String testTab = 'Test';

  // app circular home button strings
  static const String caseSlaList = 'Vaka-(SLA) Listesi';
  static const String caseSlaSearch = 'Vaka-(SLA) Arama';
  static const String workOrderList = 'İş Emri Listesi';
  static const String workOrderSearch = 'İş Emri Arama';
  static const String newWorkOrder = 'Yeni İş Emri';

  // date strings
  static const day = 'gün';
  static const hour = 'saat';
  static const minute = 'dk.';
  static const second = 'sn.';

  // workorder tabs
  static const myOrders = 'Üzerimdekiler';
  static const myGroups = 'Grubumdakiler';
  static const myPendiks = 'Bekleyenler';

  //button
  static const start = 'Başlat';
  static const end = 'Bitir';
  static const cancel = 'Vazgeç';
  static const reject = 'Reddet';
  static const save = 'Kaydet';
  static const approve = 'Onayla';

  //Add efforts labels
  static const addEffort = 'Efor Ekle';
  static const date = 'Süre Seçiniz';

  // add material strings
  static const addMaterial = 'Malzeme Ekle';
  static const chooseWareHouse = 'Depo Seçiniz';
  static const chooseProduct = 'Ürün Seçiniz';

  static const chooseUnit = 'Birim Seçiniz';
  static const enterAmount = 'Miktar Giriniz';

  // add personal strings
  static const addPersonal = 'Personel Ekle';
  static const choosePersonal = 'Personel Seçiniz';
  static const chooseShift = 'Vardiya Seçiniz';

  // accordion titles
  static const requstMaterial = 'Malzeme Talebi';
  static const addPiece = 'Parça Ekle';
  static const efforts = 'Eforlar';
  static const addDocumant = 'Döküman Ekle';

  // sub accordion titles
  static const addedMaterials = 'Eklenmiş Parçalar';
  static const addedEfforts = 'Eklenmiş Eforlar';
  static const requstedMaterials = 'Talep Edilen Malzemeler';
  static const addPdf = 'Pdf Ekle';
  static const addImage = 'Fotoğraf Ekle';
  static const addedDocumants = 'Eklenmiş Dökümanlar';

  //issue filter strings
  static const state = 'Durum';
  static const build = 'Bina';
  static const floor = 'Kat';
  static const wing = 'Kanat';
  static const taskForMe = 'Üzerime Atanan Vakalar';

  static const logout = 'Çıkış Yap';
  static const title = 'Yardım Masası Uygulaması';
}
