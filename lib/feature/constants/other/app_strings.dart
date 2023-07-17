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
  static const addEffort = 'Effor Ekle';
  static const date = 'Süre Seçiniz';
  static const gun = 'Gün';
  static const saat = 'Saat';
  static const dakika = 'Dakika';

  // add material strings
  static const malzemeEkle = 'Malzeme Ekle';
  static const depoSeciniz = 'Depo Seçiniz';
  static const urunSeciniz = 'Ürün Seçiniz';

  static const birimSeciniz = 'Birim Seçiniz';
  static const miktarGiriniz = 'Miktar Giriniz';

  // add personal strings
  static const personelEkle = 'Personel Ekle';
  static const personelSeciniz = 'Personel Seçiniz';
  static const vardiyaSeciniz = 'Vardiya Seçiniz';

  // accordion titles
  static const requstMaterial = 'Malzeme Talebi';
  static const addMaterial = 'Parça Ekle';
  static const efforts = 'Efforlar';
  static const addDocumant = 'Döküman Ekle';

  // sub accordion titles
  static const addedMaterials = 'Eklenmiş Parçalar';
  static const addedEfforts = 'Eklenmiş Efforlar';
  static const requstedMaterials = 'Talep Edilen Malzemeler';
  static const addPdf = 'Pdf Ekle';
  static const addImage = 'Fotoğraf Ekle';
  static const addedDocumants = 'Eklenmiş Dökümanlar';

  //issue filter strings
  static const durum = 'Durum';
  static const bina = 'Bina';
  static const kat = 'Kat';
  static const kanat = 'Kanat';
  static const taskForMe = 'Üzerime Atanan Vakalar';
}
