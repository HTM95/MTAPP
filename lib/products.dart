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

/*import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'supplemental/asymmetric_view.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsPage extends StatefulWidget{
  _ProductsPageState createState()=> _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context){

   List<Product> products = ProductsRepository.loadProducts(Category.all);

    if(products == null || products.isEmpty){
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child : GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/details',
             arguments: product.id,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18/10,
                child : Image.asset(
                  product.assetName,
                  package: product.assetPackage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        product == null ? '' : product.name,
                        style: theme.textTheme.button,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 1.0),
                      Text(
                        product == null ? '' : formatter.format(product.price),
                        style: theme.textTheme.caption,

                      ),
                      IconButton(
                        // padding: EdgeInsets.fromLTRB(130.0, 0.0, 0.0, 0.0),
                        //iconSize: 25.0,
                        icon: Icon(
                          Icons.shopping_basket,
                          size:  MediaQuery.of(context).size.height * 0.035,
                          color: Color(0xFF0D47A1),
                          semanticLabel: 'search',
                        ),
                        //TODO : Add popup to select qte
                        onPressed: (){
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }).toList();

  }
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
  // return  AsymmetricView(products: ProductsRepository.loadProducts(Category.all));
   return GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        //Size
        childAspectRatio: 8.0/9.5,
        //TODO : Build a gride of cards
        children: _buildGridCards(context)
    );

    // TODO: Pass Category variable to AsymmetricView (104)
   /* return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu ,
              semanticLabel: 'menu',),
            onPressed: (){
              print('Menu button');
            }),
        title: Text('Marine Turquoise'),

        // TODO: Add trailing buttons (102)
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: (){},
          )
        ],
      ),
      // TODO: Add a grid view (102)
      // TODO : Grid View
      body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          //Size
          childAspectRatio: 8.0/9.0,
          //TODO : Build a gride of cards
          children: _buildGridCards(context)
      ),
      //body :  AsymmetricView(products: ProductsRepository.loadProducts(Category.all)),
      // TODO: Set resizeToAvoidBottomInset (101)
      resizeToAvoidBottomInset: false,
    );*/
  }
}
*/