import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resocoder_repo_viewer/auth/shared/provider.dart';
import 'package:resocoder_repo_viewer/core/presentation/routes/app_router.gr.dart';
import 'package:resocoder_repo_viewer/github/core/shared/providers.dart';
import 'package:resocoder_repo_viewer/github/repos/core/presentation/paginated_repos_list_view.dart';
import 'package:resocoder_repo_viewer/search/presentation/search_bar.dart';

class SearchedReposPage extends ConsumerStatefulWidget {
  final String searchTerm;
  const SearchedReposPage({Key? key, required this.searchTerm})
      : super(key: key);

  @override
  _SearchedReposPageState createState() => _SearchedReposPageState();
}

class _SearchedReposPageState extends ConsumerState<SearchedReposPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref.refresh(searchedReposNotifierProvider);
        ref
            .read(searchedReposNotifierProvider.notifier)
            .getFirstSearchedReposPage(
              widget.searchTerm,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBar(
        title: widget.searchTerm,
        hint: 'Search all repositories...',
        onShouldNavigateToResultPage: (searchTerm) {
          AutoRouter.of(context).pushAndPopUntil(
            SearchedReposRoute(searchTerm: searchTerm),
            predicate: (route) => route.settings.name == StarredReposRoute.name,
          );
        },
        onSignOutButtonPressed: () {
          ref.read(authNotifierProvider.notifier).signOut();
        },
        body: PaginatedReposListView(
          paginatedReposNotifierProvider: searchedReposNotifierProvider,
          getNextPage: (ref) {
            ref
                .read(searchedReposNotifierProvider.notifier)
                .getNextSearchedReposPage(widget.searchTerm);
          },
          noResultMessage:
              'This is all we could find for your search term. Really...',
        ),
      ),
    );
  }
}
