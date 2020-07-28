import 'package:flutter/material.dart';

import 'stateful_list_view.dart';

class ChallengeList extends StatefulWidget {
  @override
  _ChallengeListState createState() => _ChallengeListState();
}

class _ChallengeListState extends State<ChallengeList> with SingleTickerProviderStateMixin {
  PageController _pageController;
  int _page = 0;
  Widget _list;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_list == null){
      _list = StatefulListView(19, getBuilder);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges'),
      ),
      body: _list,
    );
  }


  Widget getBuilder(BuildContext context, int index){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'Challenge${index+1}');
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Text('Challenge ${index+1}'),
        ),
      ),
    );
  }
}