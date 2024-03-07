import 'package:flutter/material.dart';

import 'package:gigamike/models/portfolio.dart';
import 'package:gigamike/services/portfolio_api.dart';
import 'package:gigamike/widgets/portfolios/search_input.dart';
import 'package:gigamike/widgets/portfolios/list_item.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Portfolios extends StatefulWidget {
  const Portfolios({super.key});
  
  @override
  _PortfoliosPageState createState() => _PortfoliosPageState();
}

class _PortfoliosPageState extends State<Portfolios> {
  static const _pageSize = 10;

  final PagingController<int, Portfolio> _pagingController =
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
      final newItems = await PortfolioApi.getPortfolios(
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
          title: const Text('Portfolios'),
        ),
        body: CustomScrollView(
        slivers: <Widget>[

          // SearchInput(
          //   onChanged: (searchTerm) => _updateSearchTerm(searchTerm),
          // ),

          PagedSliverList<int, Portfolio>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Portfolio>(
              animateTransitions: true,
              itemBuilder: (context, item, index) => ListItem(
                portfolio: item,
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