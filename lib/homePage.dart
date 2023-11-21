import 'package:flutter/material.dart';

import 'package:namhla2/Tabs/firstTab.dart';
import 'package:namhla2/Tabs/secondTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 130,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Explore\nOur collections',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              ),
               
            
            ),
          ),
          extendBody: true,
          body: const Column(
            children: [
            TabBar(
              tabs: [
             
              Tab(
                icon: Icon(Icons.home, color: Colors.indigo),
              ),
               Tab(
                icon: Icon(Icons.photo_size_select_actual_rounded, color: Colors.indigo),
              )
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  // 1st Tab
               
                  FirstTab(),
                  //2nd Tab
                    SecondTab(),
                  
                ] ),
            )
          ]),
        ));
  }
}
