import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

OpenContainer createOpenContainer(Widget openWidget, Widget closedWidget, Function(Never?) onClosed) {
  return OpenContainer(
    onClosed: (_) {
      onClosed(null);
    },
    openElevation: 0,
    middleColor: Colors.transparent,
    transitionType: ContainerTransitionType.fade,
    transitionDuration: const Duration(milliseconds: 200),
    openBuilder: (context, _) =>
    openWidget,
    closedElevation: 0,
    closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    closedColor: Colors.transparent,
    closedBuilder: (context, openContainer) {
      return GestureDetector(
        onTap: openContainer,
        child: closedWidget,
      );
    },
  );
}