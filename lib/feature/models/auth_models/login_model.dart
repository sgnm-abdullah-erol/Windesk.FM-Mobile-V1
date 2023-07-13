import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  final String? accessToken;
  final int? expiresIn;
  final int? refreshExpiresIn;
  final String? refreshToken;
  final String? tokenType;
  final int? notBeforePolicy;
  final String? sessionState;
  final String? scope;

  const LoginModel({
    this.accessToken,
    this.expiresIn,
    this.refreshExpiresIn,
    this.refreshToken,
    this.tokenType,
    this.notBeforePolicy,
    this.sessionState,
    this.scope,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  List<Object?> get props => [
        accessToken,
        expiresIn,
        refreshExpiresIn,
        refreshToken,
        tokenType,
        notBeforePolicy,
        sessionState,
        scope,
      ];
}
