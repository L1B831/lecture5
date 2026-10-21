import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 根组件，整个应用从这进
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'counter_deep',
      theme: ThemeData(
        // 种子色换成teal，全局的颜色都跟着变
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '计数器'),
    );
  }
}

// 首页，计数的逻辑都在这
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // 步长，每点一次加2
  static const int _step = 2;

  @override
  void initState() {
    super.initState();
    // 只执行一次
    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  void _incrementCounter() {
    setState(() {
      _counter += _step;
    });
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 父级重建传新配置才会触发
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    // 每次重建都会走
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _counter == 0
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo.jpg'),
                    width: 120,
                  ),
                  SizedBox(height: 12),
                  Text('点右下角的按钮开始计数'),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('每点一次加2：'),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    // 页面销毁才会走到这
    print('dispose');
    super.dispose();
  }
}
