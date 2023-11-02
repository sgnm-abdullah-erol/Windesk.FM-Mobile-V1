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

  static const String effortAdded = 'Efor eklenmiştir.';
  static const String materialAdded = 'Malzeme eklenmiştir.';
  static const String materialRequested = 'Malzeme talep edilmiştir.';
  static const String taskStateChange = 'Görev durumu değiştirilmiştir.';
  static const String takeItOnMeSuccess = 'Görev üzerinize alınmıştır.';
  static const String pdfAdded = 'Pdf eklenmiştir.';
  static const String imageAdded = 'Fotoğraf eklenmiştir.';
  static const String fileDownloaded = 'Dosya indirildi';
  static const String fileNotDownloaded = 'Dosya indirilemedi';

  static const String woCreate = 'İş Emri Başarıyla Oluşturuldu.';
  static const String woCreateError = 'İş Emri Oluşturulurken Hata Oluştu.';

}
