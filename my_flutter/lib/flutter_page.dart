import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_boost/page_visibility.dart';

class FlutterRouteWidget extends StatefulWidget {
  final Map params;
  final String message;
  final String uniqueId;
  FlutterRouteWidget({Key key, this.message, this.uniqueId, this.params})
      : super(key: key);

  @override
  _FlutterRouteWidgetState createState() => _FlutterRouteWidgetState();
}

class _FlutterRouteWidgetState extends State<FlutterRouteWidget>
    with PageVisibilityObserver {
  final TextEditingController _usernameController = TextEditingController();
  static const String _kTag = 'page_visibility';
  @override
  void initState() {
    // TODO: implement initState
    Logger.log('$_kTag#initState,${widget.uniqueId},$this');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Logger.log("$_kTag#didChangeDependencies,${widget.uniqueId},$this");
    PageVisibilityBinding.instance.addObserver(this, ModalRoute.of(context));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    PageVisibilityBinding.instance.removeObserver(this);
    Logger.log('$_kTag#dispose~,${widget.uniqueId},$this');
    super.dispose();
  }

  @override
  void onPageCreate() {
    // TODO: implement onPageCreate
    Logger.log('$_kTag#onPageCreate, ${widget.uniqueId}, $this');
  }

  @override
  void onPageDestroy() {
    // TODO: implement onPageDestroy
    Logger.log('$_kTag#onPageDestory, ${widget.uniqueId}, $this');
  }

  @override
  void onPageShow({bool isForegroundEvent}) {
    // TODO: implement onPageShow
    Logger.log(
        '$_kTag#onPageShow, ${widget.uniqueId}, isForegroundEvent=$isForegroundEvent, $this');
  }

  @override
  void onPageHide({bool isBackgroundEvent}) {
    // TODO: implement onPageHide
    Logger.log(
        '$_kTag#onPageHide, ${widget.uniqueId}, isBackgroundEvent=$isBackgroundEvent, $this');
  }

  @override
  Widget build(BuildContext context) {
    Logger.log(
        '${MediaQuery.of(context).padding.top} uniqueId=${widget.uniqueId}');
    Logger.log(
        '${MediaQuery.of(context).padding.bottom} uniqueId=${widget.uniqueId}');
    Logger.log(
        '${MediaQuery.of(context).size.width} uniqueId=${widget.uniqueId}');
    Logger.log(
        '${MediaQuery.of(context).size.height} uniqueId=${widget.uniqueId}');

    final String message = widget.message;
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_boost_example'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          margin: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                child: Text.rich(TextSpan(text: '', children: [
                  TextSpan(
                      text: message ??
                          'This is a Flutter VC uniqueId:${widget.uniqueId}'),
                  TextSpan(
                      text: '\n params:${widget.params}',
                      style: TextStyle(fontStyle: FontStyle.italic))
                ])),
                alignment: AlignmentDirectional.center,
              ),
              const CupertinoTextField(
                prefix: Icon(
                  CupertinoIcons.person_solid,
                  color: CupertinoColors.lightBackgroundGray,
                  size: 28.0,
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
                clearButtonMode: OverlayVisibilityMode.editing,
                textCapitalization: TextCapitalization.words,
              ),
              TextField(
                  enabled: true,
                  autocorrect: true,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff222222),
                    fontWeight: FontWeight.w500,
                  )),
              TextField(
                controller: new TextEditingController(),
                focusNode: FocusNode(),
                enabled: true,
                autocorrect: false,
                style: TextStyle(
                  fontSize: 20.0,
                  color: const Color(0xff222222),
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.yellow,
                    child: Text(
                      'open native page',
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    )),
                onTap: () => {
                  BoostNavigator.of().push("native", arguments: {'key': 'call'})
                },
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  color: Colors.yellow,
                  child: Text(
                    'open imagepick demo',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                ),
                onTap: () => {
                  BoostNavigator.of().push('imagepick', withContainer: true),
                },
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  color: Colors.yellow,
                  child: Text(
                    'open willPop demo',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                ),
                onTap: () => {
                  BoostNavigator.of().push('willPop', withContainer: true),
                },
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  color: Colors.yellow,
                  child: Text(
                    'mediaquery demo',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                ),
                onTap: () => {
                  BoostNavigator.of().push('mediaquery', withContainer: true),
                },
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.yellow,
                    child: Text(
                      'push flutter widget',
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    )),
                onTap: () {
                  Navigator.push<dynamic>(context,
                      MaterialPageRoute<dynamic>(builder: (_) => PushWidget()));
                },
              ),
              InkWell(
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Text(
                        'back',
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      )),
                  // onTap: () async {
                  //   final result = await BoostNavigator.of()
                  //       .push("returnData", withContainer: true);
                  //   print('Get result: $result');
                  // }),
                  onTap: () => BoostNavigator.of().pop()),
            ],
          ),
        ),
      ),
    );
  }
}

class Logger {
  static void log(String msg) {
    assert(() {
      print('FlutterBoost#$msg');
      return true;
    }());
    //print('FlutterBoost=>$msg');
  }

  static void error(String msg) {
    print('FlutterBoost#$msg');
  }
}

//

class PushWidget extends StatefulWidget {
  PushWidget({Key key}) : super(key: key);

  @override
  _PushWidgetState createState() => _PushWidgetState();
}

class _PushWidgetState extends State<PushWidget> {
  VoidCallback _backPressedListenerUnsub;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _backPressedListenerUnsub.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              // 如果有抽屉的话的就打开
              onPressed: () {
                BoostNavigator.of().pop();
              },
              // 显示描述信息
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }),
          title: Text('flutter_boost_example'),
        ),
        body: Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ));
  }
}
