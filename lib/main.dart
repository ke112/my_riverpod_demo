import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_riverpod_demo/page_info.dart';
import 'package:my_riverpod_demo/pages/async_notifier_provider_page.dart';
import 'package:my_riverpod_demo/pages/counter_state_provider_page.dart';
import 'package:my_riverpod_demo/pages/futuer_provider_page.dart';
import 'package:my_riverpod_demo/pages/notifier_provider_page.dart';
import 'package:my_riverpod_demo/pages/provider_page.dart';
import 'package:my_riverpod_demo/pages/timer_stream_provider_page.dart';
import 'package:my_riverpod_demo/test/AppDemo/Views/user_products_page.dart';
import 'package:my_riverpod_demo/test/demo/family_provider_page.dart';
import 'package:my_riverpod_demo/test/demo/life_cycle_provider_page.dart';
import 'package:my_riverpod_demo/test/demo/my_counter_test.dart';
import 'package:my_riverpod_demo/test/demo/products_list_page.dart';
import 'package:my_riverpod_demo/test/demo/test_page.dart';
import 'package:my_riverpod_demo/test/demo/user_infos_page.dart';

// @riverpod
// String helloWorld(WidgetRef ref) {
//   return 'hello world';
// }

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(
          title: '主页',
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'provider',
          builder: (BuildContext context, GoRouterState state) {
            return const ProviderPage(
              pageName: 'provider 演示',
            );
          },
        ),
        GoRoute(
          path: 'sateprovider',
          builder: (BuildContext context, GoRouterState state) {
            return const CounterStateProviderPage();
          },
        ),
        GoRoute(
          path: 'futureprovider',
          builder: (BuildContext context, GoRouterState state) {
            return const FutuerProviderPage(
              pageName: 'future provider 演示',
            );
          },
        ),
        GoRoute(
          path: 'streamprovider',
          builder: (BuildContext context, GoRouterState state) {
            return const TimerStreamProviderPage(
              pageName: 'stream provider 演示',
            );
          },
        ),
        GoRoute(
          path: 'notifierprovider',
          builder: (BuildContext context, GoRouterState state) {
            return const NotifierProviderPage(
              pageName: 'notifier provider 演示',
            );
          },
        ),
        GoRoute(
          path: 'asyncnotifierprovider',
          builder: (BuildContext context, GoRouterState state) {
            return const AsyncNotifierProviderPage();
          },
        ),
        GoRoute(
          path: 'myfuture',
          builder: (BuildContext context, GoRouterState state) {
            return const UserInfosPage();
          },
        ),
        GoRoute(
          path: 'mytest',
          builder: (BuildContext context, GoRouterState state) {
            return const TestPage();
          },
        ),
        GoRoute(
          path: 'network',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductsListPage();
          },
        ),
        GoRoute(
          path: 'mycounter',
          builder: (BuildContext context, GoRouterState state) {
            return const MyCounterTest();
          },
        ),
        GoRoute(
          path: 'productlist',
          builder: (BuildContext context, GoRouterState state) {
            return const UserProductsPage();
          },
        ),
        GoRoute(
          path: 'productdetail',
          builder: (BuildContext context, GoRouterState state) {
            final String pid = state.extra as String; // 获取传递的参数
            return FamilyProviderPage(pid: pid);
          },
        ),
        GoRoute(
          path: 'lifecycle',
          builder: (BuildContext context, GoRouterState state) {
            final String pid = state.extra as String; // 获取传递的参数
            return LifeCycleProviderPage(postId: pid);
          },
        ), //LifeCycleProviderPage
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // TRY THIS: Try running your application with "flutter run". You'll see
    //     // the application has a purple toolbar. Then, without quitting the app,
    //     // try changing the seedColor in the colorScheme below to Colors.green
    //     // and then invoke "hot reload" (save your changes or press the "hot
    //     // reload" button in a Flutter-supported IDE, or press "r" if you used
    //     // the command line to start the app).
    //     //
    //     // Notice that the counter didn't reset back to zero; the application
    //     // state is not lost during the reload. To reset the state, use hot
    //     // restart instead.
    //     //
    //     // This works for code too, not just values: Most code changes can be
    //     // tested with just a hot reload.
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageItems = <PageInfo>[
      PageInfo(name: 'provider 演示', tapActionCallback: () => context.push('/provider')),
      PageInfo(name: 'stateProvider 演示', tapActionCallback: () => context.push('/sateprovider')),
      PageInfo(name: 'futureProvider 演示', tapActionCallback: () => context.push('/futureprovider')),
      PageInfo(name: 'streamProvider 演示', tapActionCallback: () => context.push('/streamprovider')),
      PageInfo(name: 'notifierProvider 演示', tapActionCallback: () => context.push('/notifierProvider')),
      PageInfo(name: 'asyncnotifierProvider 演示', tapActionCallback: () => context.push('/asyncnotifierprovider')),
      // PageInfo(name: 'myfuture', tapActionCallback: () => context.push('/myfuture')),
      // PageInfo(name: 'mytest', tapActionCallback: () => context.push('/mytest')),
      // PageInfo(name: 'appdemo', tapActionCallback: () => context.push('/network')),
      // PageInfo(name: 'mycounter', tapActionCallback: () => context.push('/mycounter')),
      PageInfo(name: '商品列表展示', tapActionCallback: () => context.push('/productlist')),
      PageInfo(
          name: '商品详情页：同一个商品详情页（widget）使用同一个类型的provider（不同的商品id）',
          tapActionCallback: () {
            String pid = '12345';
            GoRouter.of(context).go('/productdetail', extra: pid);
          }),
      PageInfo(
          name: '生命周期',
          tapActionCallback: () {
            String pid = '88888';
            GoRouter.of(context).go('/lifecycle', extra: pid);
          }),
    ];

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, index) {
                return _buildListItems(pageItems, index);
              },
              itemCount: pageItems.length,
              shrinkWrap: true,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildListItems(List<PageInfo> pageInfos, int index) {
    final pageInfo = pageInfos[index];
    return MaterialButton(
      height: 60,
      onPressed: pageInfo.tapActionCallback,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          pageInfo.name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
