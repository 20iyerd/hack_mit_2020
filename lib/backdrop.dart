import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _BackdropState extends State<Backdrop> //added backdrop for added functionality, especially with layers
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop'); //label

  // TODO: Add AnimationController widget (104)

  // TODO: Add BuildContext and BoxConstraints parameters to _buildStack (104)
  Widget _buildStack() { //stack of back, front layers
    return Stack(
      key: _backdropKey,
      children: <Widget>[
        widget.backLayer,
        widget.frontLayer,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      brightness: Brightness.dark, //make top status bar of phone icons appear white for contrast
      elevation: 0.0,
      titleSpacing: 0.0,
      backgroundColor: Colors.blueGrey,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Navigator.of(context).pushNamed('/menu'); //navigate to menu
        },
      ),
      title: Text('Explore'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            
          },
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            semanticLabel: 'settings',
          ),
          onPressed: () {

          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      // TODO: Return a LayoutBuilder widget (104)
      body: _buildStack(),
    );
  }
}

class Backdrop extends StatefulWidget { //easy accessibility
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
  })  : assert(frontLayer != null),
        assert(backLayer != null),
        assert(frontTitle != null),
        assert(backTitle != null);

  @override
  _BackdropState createState() => _BackdropState();
}
