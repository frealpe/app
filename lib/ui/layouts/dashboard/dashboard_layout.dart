import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {

    

  final Widget child;
  const DashboardLayout({
    Key? key,
    required this.child,
    }) : super(key: key);
  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duration: Duration(microseconds: 300);
  }
  @override
  Widget build(BuildContext context) {
    return DashboardView();

  }
}