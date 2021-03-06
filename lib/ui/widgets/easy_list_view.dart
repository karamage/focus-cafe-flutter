import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/ui/widgets/empty.dart';

class EasyListView<T> extends HookWidget {
  final List<T> items;
  final Future<void> Function() onRefresh;
  final VoidCallback? onNext;
  final List<Widget> Function(List<T> items) buildCells;
  final isLoading;
  final Widget? loading;
  final Widget? header;
  final Widget? emptyState;
  final double? paddingTop;

  EasyListView({
    required this.items,
    required this.onRefresh,
    this.onNext,
    required this.buildCells,
    this.isLoading,
    this.loading,
    this.header,
    this.emptyState,
    this.paddingTop,
  });

  @override
  Widget build(BuildContext context) {
    final sc = useScrollController();
    useEffect((){
      _setOnScroll(sc);
      return null;
    }, []);
    return Column(
      children: [
        Flexible(
            child: _buildRefreshList(sc)
        ),
        if (_isShowLoading()) loading ?? Empty(),
      ],
    );
  }

  _isShowLoading() => /*items.length == 0 &&*/ isLoading == true && loading != null;

  Widget _buildRefreshList(ScrollController sc) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: header != null ? _buildHeaderListView(sc) : _buildListView(sc),
    );
  }

  Widget _buildListView(ScrollController sc) {
    if (isLoading != true && items.length == 0 && emptyState != null) {
      return emptyState ?? Empty();
    }
    return ListView(
      controller: sc,
      padding: EdgeInsets.only(top: paddingTop ?? 20.0),
      scrollDirection: Axis.vertical,
      children: buildCells(items),
    );
  }

  Widget _buildHeaderListView(ScrollController sc) {
    final cells = buildCells(items);
    return ListView.builder(
      controller: sc,
      scrollDirection: Axis.vertical,
      itemCount: items.length + 1,                          //new
      itemBuilder: (_, int index) {
        return index == 0 ? header ?? Empty() : cells[index - 1];
      },
    );
  }

  _setOnScroll(ScrollController sc) {
    sc.addListener(() {
      final maxScrollExtent = sc.position.maxScrollExtent;
      final currentPosition = sc.position.pixels;
      if (maxScrollExtent > 0 &&
          (maxScrollExtent - 20.0) <= currentPosition) {
        if (onNext != null) {
          onNext!();
        }
      }
    });
  }
}
