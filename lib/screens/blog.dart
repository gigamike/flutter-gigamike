import 'package:flutter/material.dart';

import 'package:gigamike/models/post.dart';
import 'package:gigamike/services/post_api.dart';
import 'package:gigamike/widgets/blog/search_input.dart';
import 'package:gigamike/widgets/blog/list_item.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});
  
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<Blog> {
  static const _pageSize = 10;

  final PagingController<int, Post> _pagingController =
      PagingController(firstPageKey: 1);

  String? _searchTerm;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    _pagingController.addStatusListener((status) {
      if (status == PagingStatus.subsequentPageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Something went wrong while fetching a new page.',
            ),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () => _pagingController.retryLastFailedRequest(),
            ),
          ),
        );
      }
    });

    super.initState();
  }

  Future<void> _fetchPage(pageKey) async {
    try {
      final newItems = await PostApi.getPost(
        pageKey,
        _pageSize,
        searchTerm: _searchTerm,
      );

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Blog'),
        ),
        body: CustomScrollView(
        slivers: <Widget>[
          SearchInput(
            onChanged: (searchTerm) => _updateSearchTerm(searchTerm),
          ),
          PagedSliverList<int, Post>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Post>(
              animateTransitions: true,
              itemBuilder: (context, item, index) => ListItem(
                post: item,
              ),
            ),
          ),
        ],
        ),
    );
  }

  void _updateSearchTerm(String searchTerm) {
    _searchTerm = searchTerm;
    _pagingController.refresh();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}