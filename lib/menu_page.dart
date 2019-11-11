import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'home2.dart';
import 'colors.dart';
import 'model/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuPage extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;
  final List<Category> _categories = Category.values;

  const MenuPage({
    Key key,
    @required this.currentCategory,
    @required this.onCategoryTap,
  })  : assert(currentCategory != null),
        assert(onCategoryTap != null);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString =
    category.toString().replaceAll('Category.', '').toUpperCase();
    final ThemeData theme = Theme.of(context);
    sdata D = ModalRoute.of(context).settings.arguments;
    Category categ = D.title;
    String profil = D.userCateg;

    FirebaseUser user1;
    return GestureDetector(
      onTap: () async => {

        if (category == Category.Contact){
          Navigator.pushNamed(context, '/contactus' )// contact us
      }else if (category == Category.Deconnexion){
          user1 = await FirebaseAuth.instance.currentUser(),
        if(user1!=null){
        Firestore.instance.collection("utilisateurs").document(user1.uid).updateData({ 'devtoken': "",}),
      },
      FirebaseAuth.instance.signOut(),
        Navigator.of(context).pushNamed('/first_screen')
      }else
          {
            D.title = category,
            Navigator.pushNamed(context, '/products', arguments: D)
          }
      },
      child:
        Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          categoryString,
          style: theme.textTheme.body2.copyWith(
              color: kShrineBrown900
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        color: kShrinePink100,
        child: ListView(
            children: _categories
                .map((Category c) => _buildCategory(c, context))
                .toList()),
      ),
    );
  }
}