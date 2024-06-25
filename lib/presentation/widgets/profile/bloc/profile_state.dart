// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final Resource? response;

  const ProfileState({this.response});

  @override
  List<Object?> get props => [response];

  ProfileState copyWith({
    Resource? response,
  }) {
    return ProfileState(
      response: response ?? this.response,
    );
  }
}
