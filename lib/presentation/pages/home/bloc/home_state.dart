// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final Resource? response;

  const HomeState({this.response});

  @override
  List<Object?> get props => [response];

  HomeState copyWith({
    Resource? response,
  }) {
    return HomeState(
      response: response ?? this.response,
    );
  }
}
