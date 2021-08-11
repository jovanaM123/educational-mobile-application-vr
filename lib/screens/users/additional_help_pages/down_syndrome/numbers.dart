import 'package:flutter/material.dart';

class Numbers extends StatelessWidget {
  static const routeName = "/numbers";
  final String name = "assets/images/spongebob.png";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    GlobalKey<FormState> _homeKey = GlobalKey<FormState>(debugLabel: '_homeScreenkey');

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
              child: Image.asset(
            name,
            width: 200,
            height: 200,
          )),
          Center(
            child: Container(
              key: _homeKey,
              margin: EdgeInsets.only(top: 80),
              child: CustomScrollView(slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      ),
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      ),
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Center(
            child: Container(
              key: _homeKey,
              margin: EdgeInsets.only(top: 80),
              child: CustomScrollView(slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      ),
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      ),
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      ),
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      ),
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Center(
            child: Container(
              key: _homeKey,
              margin: EdgeInsets.only(top: 80),
              child: CustomScrollView(slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      ),
                      Image.asset(
                        name,
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
