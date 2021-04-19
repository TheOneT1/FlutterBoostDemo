import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost_app.dart';
import 'flutter_page.dart';
import 'simple_page_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(routeFactory);
    // return MaterialApp(
    //   home: PushWidget(),
    // );
  }

  static Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
    );
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}

  Route<dynamic> routeFactory(RouteSettings settings, String uniqueId) {
    FlutterBoostRouteFactory func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  static Map<String, FlutterBoostRouteFactory> routerMap = {
    '/': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => PushWidget());
    },

    'embedded': (setting, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: setting,
          pageBuilder: (_, __, ___) => EmbeddedFirstRouteWidget());
    },

    ///可以在native层通过 getContainerParams 来传递参数
    'flutterPage': (settings, uniqueId) {
      print('flutterPage settings:$settings, uniqueId:$uniqueId');
      return PageRouteBuilder<dynamic>(
        settings: settings,
        pageBuilder: (_, __, ___) => FlutterRouteWidget(
          params: settings.arguments,
          uniqueId: uniqueId,
        ),
      );
    },

    'secondStateful': (setting, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: setting,
          pageBuilder: (_, __, ___) => SecodeStatefuleRouteWidget());
    },

    'tab_friend': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimpleWidget(
                params: settings.arguments,
                messages: "This is a flutter fragment",
                uniqueId: uniqueId,
              ));
    },
  };
}

// 监听
class BoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didPush' + route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didPop' + route.settings.name);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didRemove' + route.settings.name);
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didStartUserGesture' + route.settings.name);
  }
}

// Widget _widgetForRoute(String route) {
//   if (route == 'home') {
//     return MyHomePage();
//   }
//   return MyApp();
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter ',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter&iOS相互传值'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String title = '标题';
//   String content = '初始值';
//   final platform = const MethodChannel('samples.flutter.io/test');

//   @override
//   void initState() {
//     super.initState();
//     platform.setMethodCallHandler(invokeFlutterMethod);
//   }

//   Future<Null> invokeFlutterMethod(MethodCall call) async {
//     setState(() {
//       content = call.arguments['text'];
//     });
//   }

//   Future _invokeIOSMethod() async {
//     try {
//       title = await platform
//           .invokeMethod('invokeIOSMethod', {'text': 'flutter传过来的参数'});
//       setState(() {});
//     } on PlatformException catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '$title',
//               style: TextStyle(fontSize: 25, color: Colors.black87),
//             ),
//             Text(
//               '$content',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _invokeIOSMethod,
//         tooltip: 'diss',
//         child: Icon(Icons.arrow_circle_down_rounded),
//       ),
//     );
//   }
// }
