// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

//import 'home.dart';
import 'emailConfirm.dart';
import 'home2.dart';
import 'products.dart';
//import 'detail.dart';
//import 'login.dart';
import 'colors.dart';
import 'backdrop.dart';
import 'menu_page.dart';
import 'model/product.dart';
//import 'first_screen.dart';
//import 'register.dart';
import 'detailUi.dart';
import 'register_with_firebase.dart';
import 'login_with_firebase.dart';
import 'products_firestore.dart';
// TODO: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePink100,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineBrown900
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    // TODO: Add the text themes (103)
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    // TODO: Add the icon themes (103)
    // TODO: Decorate the inputs (103)
  );
}
// TODO: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}
// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  
  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marine Turquoise',
      // TODO: Change home: to a Backdrop with a HomePage frontLayer (104)
      home: HomePage2(),
      routes: <String, WidgetBuilder> {
        '/products': (BuildContext context) => Backdrop(
          currentCategory: Category.all,
          frontLayer: ProductsPageFS(),
          backLayer: MenuPage(
            currentCategory: _currentCategory,
             onCategoryTap: _onCategoryTap,
            ),
          frontTitle: Text('Marine Turquoise'),
          backTitle: Text('Menu'),
        ),
        //'/details': (BuildContext context) => ProductDetail(),
        '/details': (BuildContext context) => ProductDetailUI(),
        '/register': (BuildContext context) => UserRegister(),
        '/emailConfirm' : (BuildContext context) => EmailConfirmation(),
      },
      // TODO: Make currentCategory field take _currentCategory (104)
      // TODO: Pass _currentCategory for frontLayer (104)
      // TODO: Change backLayer field value to CategoryMenuPage (104)
      initialRoute: '/first_screen',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
      // TODO: Add a theme (103)
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/first_screen') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => UserLogin(),
      fullscreenDialog: true,
    );
  }
}

// TODO: Build a Shrine Theme (103)
// TODO: Build a Shrine Text Theme (103)
