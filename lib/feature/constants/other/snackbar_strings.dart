import 'package:flutter/material.dart';

@immutable
class SnackbarStrings {
  const SnackbarStrings._();

  static const String noInternetConnection = 'No internet connection';
  static const String loginError = 'Giriş Yapılamadı, Lütfen Tekrar Deneyiniz';
  static const String logoutSuccess = 'Çıkış Yapıldı';
  static const String logoutError = 'Çıkış Yapılamadı, Lütfen Tekrar Deneyiniz';
  static const String loginEmptyError = 'Kullanıcı Adı veya Şifre Boş Olamaz';
  static const String loginSuccess = 'Giriş Başarılı';

  static const String effortAdded = 'Effor eklenmiştir.';
  static const String materialAdded = 'Malzeme eklenmiştir.';
  static const String materialRequested = 'Malzeme talep edilmiştir.';
  static const String taskStateChange = 'Görev durumu değiştirilmiştir.';
  static const String takeItOnMeSuccess = 'Görev üzerinize alınmıştır.';
}
