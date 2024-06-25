// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:equatable/equatable.dart';

class LoadingState extends Equatable {
  final Resource? response;
  final bool withoutToken;

  const LoadingState({this.response, this.withoutToken = true});

  @override
  List<Object?> get props => [response, withoutToken];

  LoadingState copyWith({
    Resource? response,
    bool? withoutToken,
  }) {
    return LoadingState(
      response: response ?? this.response,
      withoutToken: withoutToken ?? this.withoutToken,
    );
  }
}
