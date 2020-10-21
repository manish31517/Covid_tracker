import 'package:Covid_tracker/config/palette.dart';
import 'package:Covid_tracker/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            _buildHeader(screenHeight),
          ],
      ) ,
    );
  }
  SliverToBoxAdapter _buildHeader(double screenHeight)
  {
     return SliverToBoxAdapter(
       child: Container(
         padding: const EdgeInsets.all(20.0),
         decoration: BoxDecoration(
           color: Palette.primaryColor,
           borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(40.0),
             bottomRight: Radius.circular(40.0),
           )
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'COVID-19',
                  style:const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                  ),
                )
             CountryDropDown(),
              ],
            )
           ],
         ),
       ),
     );
  }
}
