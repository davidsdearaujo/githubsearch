import 'package:flutter/material.dart';

mixin ButtonAnimation<T extends StatefulWidget> on State<T> {
  final scrollController = ScrollController();

  void onButtonAddTap();

  Duration animationDuration = Duration(milliseconds: 1000);
  bool isVisible = true;

  ButtonProperties get _bottomProperties {
    return scrollController.positions.isEmpty
        ? ButtonProperties(false)
        : ButtonProperties(scrollController.offset > 44);
  }

  Widget buttonWidget({@required Widget child}) {
    return Stack(
      children: <Widget>[
        child,
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + kToolbarHeight + 10,
          ),
          child: AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              return AnimatedContainer(
                duration: animationDuration,
                curve: Curves.easeOutExpo,
                alignment: _bottomProperties.alignment,
                padding: EdgeInsets.only(bottom: 15),
                child: FittedBox(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryTextTheme.button.color,
                    elevation: 10,
                    onPressed: onButtonAddTap,
                    shape: _bottomProperties.shape,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: _bottomProperties.padding,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add),
                          if (!_bottomProperties.isBottom) SizedBox(width: 15),
                          if (!_bottomProperties.isBottom) Text("ADD NEW USER"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ButtonProperties {
  final bool isBottom;

  Alignment get alignment {
    return isBottom ? Alignment.bottomRight : Alignment.topCenter;
  }

  double get padding {
    return isBottom ? 20 : 8;
  }

  ShapeBorder get shape {
    return isBottom
        ? CircleBorder()
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          );
  }

  ButtonProperties(bool isBottom) : isBottom = isBottom;
}
