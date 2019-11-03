import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'model/product.dart';
import 'home2.dart';
import 'package:url_launcher/url_launcher.dart';
const double _kFlingVelocity = 2.0;
class Backdrop extends StatefulWidget{
  final Category currentCategory ;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
   @required this.currentCategory,
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
}) : assert(currentCategory != null),
    assert(frontLayer != null),
    assert(backLayer != null),
  assert(backTitle != null),
  assert(frontTitle !=null);

  _BackdropState createState() => _BackdropState();

}

// TODO: Add _FrontLayer class (104)
class _FrontLayer extends StatelessWidget {
  // TODO: Add on-tap callback (104)
  const _FrontLayer({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Material(
      elevation: 16.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              Text("Veuillez choisir un produit",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Quicksand",
                    ),)
            ],
          ),

          // TODO: Add a GestureDetector (104)
          SizedBox(
          height: 15,
      ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
// TODO: Add _BackdropTitle class (104)
// TODO: Add _BackdropState class (104)

class _BackdropState extends State<Backdrop>
  with SingleTickerProviderStateMixin{
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
// TODO: Add AnimationController widget (104)
// TODO: Add AnimationController widget (104)
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  // TODO: Add functions to get and change front layer visibility (104)
  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropLayerVisibility() {
    _controller.fling(
        velocity: _frontLayerVisible ? -_kFlingVelocity : _kFlingVelocity);
  }
  // TODO: Add override for didUpdateWidget (104)
  @override
  void didUpdateWidget(Backdrop old) {
    super.didUpdateWidget(old);

    if (widget.currentCategory != old.currentCategory) {
      _toggleBackdropLayerVisibility();
    } else if (!_frontLayerVisible) {
      _controller.fling(velocity: _kFlingVelocity);
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
// TODO: Add BuildContext and BoxConstraints parameters to _buildStack (104)
  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    // TODO: Create a RelativeRectTween Animation (104)
    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        ExcludeSemantics(
          child: widget.backLayer,
          excluding: _frontLayerVisible,
        ),
        // TODO: Add a PositionedTransition (104)
        PositionedTransition(
          rect: layerAnimation,
          child: _FrontLayer(
            // TODO: Implement onTap property on _BackdropState (104)
            child: widget.frontLayer,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    sdata D = ModalRoute.of(context).settings.arguments;
    Category categ = D.title;
    String profil = D.userCateg;
    // TODO: implement build
    var appBar = AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      titleSpacing: 0.0,
      // TODO: Replace leading menu icon with IconButton (104)
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: _toggleBackdropLayerVisibility,
      ),
      // TODO: Remove leading property (104)
      // TODO: Create title with _BackdropTitle parameter (104)
      title:  Image.asset('assets/mosaic_logo.png',width: 150,),
      actions: <Widget>[
        // TODO: Add shortcut to login screen from trailing icons (104)
       IconButton(
          icon: new Image.asset('assets/wtsp50.png'),
          onPressed:  () async {
            await Firestore.instance.collection('infosApp').document('dlHVwrMgcCpANTR1A4gX').get().then((DocumentSnapshot ds) {
              var phone = ds["Tel"].toString();
              if (canLaunch("whatsapp://send?phone=$phone") != null){
                launch("whatsapp://send?phone=$phone");
              }
            });
           },
       )],
    );
    return Scaffold(
      appBar: appBar,
      // TODO: Return a LayoutBuilder widget (104)
      body: LayoutBuilder(builder: _buildStack),
    );
  }

}