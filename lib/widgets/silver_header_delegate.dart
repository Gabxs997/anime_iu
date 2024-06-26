import 'package:flutter/material.dart';

class SilverCustomHeaderDeLegate extends SliverPersistentHeaderDelegate{

  SilverCustomHeaderDeLegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

@override
Widget build(BuildContext context, double shrinkOffset, bool overlapsContent){
  return SizedBox.expand(child: child);
}

@override
double get maxExtent => maxHeight;

@override
double get minExtent => minHeight;

@override
bool shouldRebuild(SilverCustomHeaderDeLegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

}