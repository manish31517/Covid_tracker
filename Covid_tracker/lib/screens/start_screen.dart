import 'package:Covid_tracker/config/palette.dart';
import 'package:Covid_tracker/config/styles.dart';
import 'package:Covid_tracker/data/data.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:Covid_tracker/widgets/widget.dart';
class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatusTabBar(),
          SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal:10.0
              ),
         sliver: SliverToBoxAdapter(
           child: StatsGrid(),
         ),
          ),
          SliverPadding(
              padding: const EdgeInsets.only(top: 20),
         sliver: SliverToBoxAdapter(
           child: CovidBarChart(covidCases: covidUSADailyNewCases),
         ),
          )
        ],
      ),
    );
  }
  SliverPadding _buildHeader(){
    return SliverPadding(
      padding: const EdgeInsets.all(
        20.0
      ),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
  SliverToBoxAdapter _buildRegionTabBar(){
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
          child:Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0
            ),
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(25.0)
            ),
            child: TabBar(
              indicator: BubbleTabIndicator(
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorHeight: 40.0,
                indicatorColor: Colors.white,
              ),
              labelStyle: Styles.tabTextStyle,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[
                Text('My Country'),
                Text('Global'),
              ],
              onTap:(index){

              }
            ),
          ),
      ),
    );
  }
  SliverPadding _buildStatusTabBar()
  {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Total'),
              Text('Today'),
              Text('Yesterday')
            ],
              onTap: (index){},
          ),
        ),
      ),
    );
  }
}
