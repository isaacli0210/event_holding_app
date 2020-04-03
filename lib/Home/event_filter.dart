import 'package:flutter/material.dart';

class EventFilter {
  String filterTitle;
  IconData filterIcon;

  EventFilter(this.filterTitle, this.filterIcon);
  EventFilter.noIcon(String title) {
    filterTitle = title;
    filterIcon = null;
  }
}