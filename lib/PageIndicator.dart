import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  PageIndicator(this.currentIndex, this.pageCount);
  Widget _indicator(bool isActive){
    return Expanded(
      child: Container(
        width: 14.0,
        height: 14.0,
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF666a84) : Color(0xFFb9bcca),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
            color : Colors.black12,
            offset: Offset(0.0, 3.0),
              blurRadius: 3.0,
            )
          ]
        ),
      ),
    );
  }

    _buildIndicators(){
    List<Widget> indicatorList=[];
    for(int i = 0 ; i< pageCount;i++){
      indicatorList.add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
    }

  Widget build(BuildContext context){
    // TODO: implement createState
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildIndicators(),
    );
  }


//3:46
}