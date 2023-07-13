import 'package:equatable/equatable.dart';

class CheckAccesTokenModel extends Equatable {
  final bool? isTokenValid;

  const CheckAccesTokenModel(this.isTokenValid);

  factory CheckAccesTokenModel.fromJson(Map<String, dynamic> json) {
    return CheckAccesTokenModel(
      json['auth'] as bool?,
    );
  }

  @override
  List<Object?> get props => [
        isTokenValid,
      ];
}
