import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jxchat/pages/home/home_page.dart';

import 'utils/app_route.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  late Future<Widget> initDataFuture;

  final title = "JiangXia IM";

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody(){
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      navigatorObservers: [ClearFocusOnPush(), MyApp.routeObserver],
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          platform: TargetPlatform.iOS,
          scaffoldBackgroundColor: Colors.white),
      routes: appRoutes,
      onGenerateRoute: onGenerateRoute,
      builder: (ctx, widget) {
        return Listener(
          child: widget,
          onPointerUp: (event) {

          },
        );
      },
      home: SplashScreen.future(
        navigateAfterFuture: initDataFuture,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
        ),
        useLoader: false,
        backgroundColor: Colors.white,
        loaderColor: Colors.red,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initDataFuture = loadFromFuture();
  }

  Future<Widget> loadFromFuture() async {
    await Future.delayed(const Duration(milliseconds: 3000), (){});
    return MyHomePage(title: title);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<Widget> loadFromFuture() async {
    return MyHomePage(
      title: widget.title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const HomePage()
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}

class ClearFocusOnPush extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    final focus = FocusManager.instance.primaryFocus;
    focus?.unfocus();
  }
}
