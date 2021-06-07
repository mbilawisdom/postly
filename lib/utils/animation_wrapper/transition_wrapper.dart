import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TransitionWrapper extends StatelessWidget {
  const TransitionWrapper({
    @required this.closedBuilder,
    @required this.transitionType,
    @required this.onClosed,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,

      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
