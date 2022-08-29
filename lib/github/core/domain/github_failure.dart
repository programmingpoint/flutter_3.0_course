import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_failure.freezed.dart';

@freezed
class GithubFailure with _$GithubFailure {
  const GithubFailure._();
  const factory GithubFailure.api(int? errorCode) = _Api;
}
