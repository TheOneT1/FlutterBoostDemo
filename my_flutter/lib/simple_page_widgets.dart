import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_boost/page_visibility.dart';

// 简单页面
class SimpleWidget extends StatefulWidget {
  final Map params;
  final String messages;
  final String uniqueId;

  SimpleWidget({Key key, this.params, this.messages, this.uniqueId})
      : super(key: key);

  @override
  _SimpleWidgetState createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleWidget>
    with PageVisibilityObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tab_example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80.0),
              child: Text(
                widget.messages,
                style: TextStyle(fontSize: 28.0, color: Colors.blue),
              ),
              alignment: AlignmentDirectional.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: Text(
                widget.uniqueId,
                style: TextStyle(fontSize: 22.0, color: Colors.red),
              ),
              alignment: AlignmentDirectional.center,
            ),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(30.0),
                  color: Colors.yellow,
                  child: Text(
                    'open native page 1',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  )),
              onTap: () => {
                BoostNavigator.of().push("native", arguments: {'key': 'call2'})
              },
            ),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(30.0),
                  color: Colors.yellow,
                  child: Text(
                    'open flutter page',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  )),
              onTap: () => BoostNavigator.of().push("flutterPage",
                  arguments: <String, String>{'from': widget.uniqueId}),
            ),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(30.0),
                  color: Colors.yellow,
                  child: Text(
                    'open flutter page with FlutterView',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  )),
              onTap: () => BoostNavigator.of().push("flutterPage",
                  withContainer: true,
                  arguments: <String, String>{'from': widget.uniqueId}),
            ),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(30.0),
                  color: Colors.yellow,
                  child: Text(
                    'Navigator.push',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  )),
              onTap: () => Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(title: Text('Navigator.push')),
                    body: Center(
                      child: TextButton(
                        child: Text('POP'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              )),
            ),
            Container(
              height: 300,
              width: 200,
              child: Text(
                '',
                style: TextStyle(fontSize: 22.0, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onPageCreate() {
    // TODO: implement onPageCreate
  }

  @override
  void onPageDestroy() {
    // TODO: implement onPageDestroy
  }

  @override
  void onPageHide({bool isBackgroundEvent}) {
    // TODO: implement onPageHide
  }

  @override
  void onPageShow({bool isForegroundEvent}) {
    // TODO: implement onPageShow
  }
}

// 嵌入页面
class EmbeddedFirstRouteWidget extends StatefulWidget {
  EmbeddedFirstRouteWidget({Key key}) : super(key: key);

  @override
  _EmbeddedFirstRouteWidgetState createState() =>
      _EmbeddedFirstRouteWidgetState();
}

class _EmbeddedFirstRouteWidgetState extends State<EmbeddedFirstRouteWidget> {
  @override
  Widget build(BuildContext context) {
    print('_EmbeddadFirstRouteWidgetState build called');
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              print("open second page");
              Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) => SecodeStatefuleRouteWidget()));
            },
            child: Text('Open second route2')),
      ),
    );
  }

  @override
  void dispose() {
    print('[XDEBUG]:_EmbeddedFirstRouteWidgetState disposing~');
    super.dispose();
  }
}

//
class SecodeStatefuleRouteWidget extends StatefulWidget {
  SecodeStatefuleRouteWidget({Key key}) : super(key: key);

  @override
  _SecodeStatefuleRouteWidgetState createState() =>
      _SecodeStatefuleRouteWidgetState();
}

class _SecodeStatefuleRouteWidgetState
    extends State<SecodeStatefuleRouteWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondStateful Route'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              PageInfo pageInfo = BoostNavigator.of().getTopPageInfo();
              BoostNavigator.of().pop();
            },
            child: Text('Go back with result')),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('[XDEBU]:secondStatefyulRouteWidget dispposing~');
    super.dispose();
  }
}
