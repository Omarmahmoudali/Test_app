import 'package:app/modules/home_screen.dart';
import 'package:app/vh.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  final int? index;
  final bool? isGuest;
  const Layout({
    Key? key,
    this.index = 0,
    this.isGuest = false,
  }) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int index = 0;
  String? token;
  List<Widget> screen = <Widget>[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    index = widget.index!;
  }


  GlobalKey bottomNavigationBarKey = GlobalKey(debugLabel: 'btm_app_bar');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedIndexedStack(index: index, children: screen),
        bottomNavigationBar: Container(
          height: 7.0.vh,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(232, 232, 232, 0.65),
                spreadRadius: 8,
                blurRadius: 14,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              key: bottomNavigationBarKey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              currentIndex: index,
              onTap: (s) => setState(() => index = s),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon:  Icon(Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.circle_notifications),
                  label: '',

                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.check_circle_outline),
                  label: '',

                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: '',
                )],
              unselectedLabelStyle:  TextStyle(
                fontSize: 2.8.vw,
                fontWeight: FontWeight.w500,
              ),
              selectedLabelStyle:  TextStyle(
                fontSize: 2.8.vw,
                fontWeight: FontWeight.w700,
              ),
              backgroundColor: Color(0xff000730),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
            ),
          ),
        ),
      );

  }


}

class AnimatedIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;

  const AnimatedIndexedStack({
    Key? key,
    required this.index,
    required this.children,
  }) : super(key: key);

  @override
  _AnimatedIndexedStackState createState() => _AnimatedIndexedStackState();
}

class _AnimatedIndexedStackState extends State<AnimatedIndexedStack>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  int _index = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller!,
          curve: Curves.easeIn,
          reverseCurve: Curves.bounceOut),
    );

    _index = widget.index;
    _controller?.forward();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return Opacity(
          opacity: _controller!.value,
          child: Transform.scale(
            scale: 1.015 - (_controller!.value * 0.015),
            child: child,
          ),
        );
      },
      child: IndexedStack(
        index: _index,
        children: widget.children,
      ),
    );
  }
}
