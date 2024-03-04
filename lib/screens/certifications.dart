import 'package:flutter/material.dart';

import 'package:gigamike/models/certification.dart';
import 'package:gigamike/services/certification_api.dart';
import 'package:gigamike/widgets/certifications/search_input.dart';
import 'package:gigamike/widgets/certifications/list_item.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Certifications extends StatefulWidget {
  const Certifications({super.key});
  
  @override
  _CertificationsPageState createState() => _CertificationsPageState();
}

class _CertificationsPageState extends State<Certifications> {
  static const _pageSize = 10;

  final PagingController<int, Certification> _pagingController =
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
      final newItems = await CertificationApi.getCertifications(
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
          title: const Text('Certifications'),
        ),
        body: CustomScrollView(
        slivers: <Widget>[
          SearchInput(
            onChanged: (searchTerm) => _updateSearchTerm(searchTerm),
          ),
          PagedSliverList<int, Certification>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Certification>(
              animateTransitions: true,
              itemBuilder: (context, item, index) => ListItem(
                certification: item,
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