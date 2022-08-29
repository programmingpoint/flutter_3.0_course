import 'package:dartz/dartz.dart';
import 'package:resocoder_repo_viewer/core/domain/fresh.dart';
import 'package:resocoder_repo_viewer/core/infrastructure/network_exceptions.dart';
import 'package:resocoder_repo_viewer/github/core/domain/github_failure.dart';
import 'package:resocoder_repo_viewer/github/detail/domain/github_repo_detail.dart';
import 'package:resocoder_repo_viewer/github/detail/infrastructure/github_repo_detail_dto.dart';
import 'package:resocoder_repo_viewer/github/detail/infrastructure/repo_detail_local_service.dart';
import 'package:resocoder_repo_viewer/github/detail/infrastructure/repo_detail_remote_service.dart';

class RepoDetailRepository {
  final RepoDetailLocalService _localService;
  final RepoDetailRemoteService _remoteService;

  RepoDetailRepository(this._localService, this._remoteService);

  /// Returns `right(null)`if there's no Internet connection.
  Future<Either<GithubFailure, Unit?>> switchStarredStatus(
      GithubRepoDetail repoDetail) async {
    try {
      final actionCompleted = await _remoteService.switchStarredStatus(
        repoDetail.fullName,
        isCurrentlyStarred: repoDetail.starred,
      );
      return right(actionCompleted);
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }

  /// Returns `right(Fresh(null))`if there's no Internet connection.
  Future<Either<GithubFailure, Fresh<GithubRepoDetail?>>> getRepoDetail(
    String fullRepoName,
  ) async {
    try {
      final htmlRemoteResponse =
          await _remoteService.getReadmeHtml(fullRepoName);
      return right(
        await htmlRemoteResponse.when(
          noConnection: () async => Fresh.no(
            await _localService
                .getRepoDetail(fullRepoName)
                .then((dto) => dto?.toDomain()),
          ),
          notModified: (_) async {
            final cached = await _localService.getRepoDetail(fullRepoName);
            final starred = await _remoteService.getStarredStatus(fullRepoName);
            final withUpdatedStarredField =
                cached?.copyWith(starred: starred ?? false);
            return Fresh.yes(withUpdatedStarredField?.toDomain());
          },
          withNewData: (html, _) async {
            final starred = await _remoteService.getStarredStatus(fullRepoName);
            final dto = GithubRepoDetailDto(
              fullName: fullRepoName,
              html: html,
              starred: starred ?? false,
            );
            await _localService.upsertRepoDetail(dto);
            return Fresh.yes(dto.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}
