import 'dart:developer';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // ignore: prefer_final_fields
  int _selectedPage = 0;
  final _pageOptions = [
    const Home(),
    const Work(),
    const Landscape(),
  ];

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _selectedPage = _tabController!.index;
    });
  }

  @override
  void initState() {
    log("handleTabSelection");
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0);
    _tabController?.addListener(_handleTabSelection);
    // _tabController?.animation?.addListener(() {
    //   final aniValue = _tabController?.animation?.value;
    //   if (aniValue! - _selectedPage > 0.5) {
    //     setState(() {
    //       _selectedPage = _selectedPage + 1;
    //     });
    //   } else if (aniValue - _selectedPage < -0.5) {
    //     setState(() {
    //       _selectedPage = _selectedPage - 1;
    //     });
    //   }
    // });

    super.initState();
  }

  onTapped(value) {
    setState(() {
      _selectedPage = value;
      _tabController?.index = value;
    });
  }

  @override
  dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buttom Navigation Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bootom Navigation Bar'),
        ),
        body: _pageOptions[_selectedPage],
        // bottomNavigationBar: BottomAppBar(
        //     child: TabBar(
        //   controller: _tabController,
        //   indicator: TopIndicator(),
        //   tabs: const [
        //     Tab(icon: Icon(Icons.home), text: 'Home'),
        //     Tab(icon: Icon(Icons.work), text: 'Work'),
        //     Tab(icon: Icon(Icons.landscape), text: 'Landscape'),
        //   ],
        // )),
        bottomNavigationBar: DefaultTabController(
          length: 3,
          child: Material(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              // indicator: TopIndicator(),
              indicatorColor: Colors.transparent,
              tabs: [
                Stack(
                  children: [
                    Positioned(
                      top: 4,
                      child: Container(
                        height: 4,
                        width: _selectedPage == 0 ? 40 : 0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      // child: AnimatedContainer(
                      //   duration: const Duration(milliseconds: 200),
                      //   height: 4,
                      //   width: _selectedPage == 0 ? 40 : 0,
                      //   decoration: BoxDecoration(
                      //     color: Colors.blue,
                      //     borderRadius: BorderRadius.circular(2),
                      //   ),
                      // ),
                    ),
                    const Tab(icon: Icon(Icons.home), text: 'Home')
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 4,
                      child: Container(
                        height: 4,
                        width: _selectedPage == 1 ? 40 : 0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      // child: AnimatedContainer(
                      //   duration: const Duration(milliseconds: 200),
                      //   height: 4,
                      //   width: _selectedPage == 1 ? 40 : 0,
                      //   decoration: BoxDecoration(
                      //     color: Colors.blue,
                      //     borderRadius: BorderRadius.circular(2),
                      //   ),
                      // ),
                    ),
                    const Tab(icon: Icon(Icons.work), text: 'Work')
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 4,
                      left: 14,
                      child: Container(
                        height: 4,
                        width: _selectedPage == 2 ? 40 : 0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      // child: AnimatedContainer(
                      //   duration: const Duration(milliseconds: 200),
                      //   height: 4,
                      //   width: _selectedPage == 2 ? 40 : 0,
                      //   decoration: BoxDecoration(
                      //     color: Colors.blue,
                      //     borderRadius: BorderRadius.circular(2),
                      //   ),
                      // ),
                    ),
                    const Tab(icon: Icon(Icons.landscape), text: 'Landscape')
                  ],
                ),
                // Tab(icon: Icon(Icons.home), text: 'Home'),
                // const Tab(icon: Icon(Icons.work), text: 'Work'),
                // const Tab(icon: Icon(Icons.landscape), text: 'Landscape'),
              ],
            ),
          ),
        ),

        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _selectedPage,
        //   onTap: (int index) {
        //     setState(() {
        //       _selectedPage = index;
        //     });
        //   },
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //     BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Work'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.landscape), label: 'Landscape'),
        //   ],
        // ),
      ),
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = Colors.cyan
      ..strokeWidth = 5
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), paint);
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.all(65),
        color: Colors.green,
        child: const Center(
          child: Text(
            'This is Home Page',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}

class Work extends StatelessWidget {
  const Work({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.all(65),
        color: Colors.red,
        child: const Center(
          child: Text(
            'This is Work Page',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}

class Landscape extends StatelessWidget {
  const Landscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.all(65),
        color: Colors.blue,
        child: const Center(
          child: Text(
            'This is Landscape Page',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}
