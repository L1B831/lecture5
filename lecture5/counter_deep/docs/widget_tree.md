# counter_deep Widget 树手绘图

按讲义要求先在纸上画的，这里整理成文字版，方便以后对照。

从 runApp 进去，一层层往下嵌：

```
runApp(const MyApp())
└── MyApp（StatelessWidget）
    └── MaterialApp
        ├── title: 'counter_deep'
        ├── theme: ThemeData（种子色 teal）
        └── home: MyHomePage（StatefulWidget）
            └── Scaffold
                ├── AppBar
                │   └── Text（标题）
                ├── body
                │   └── Center
                │       └── Column
                │           ├── Image（空状态才有的logo.jpg）
                │           ├── Text（提示文字）
                │           └── Text（计数数字）
                └── FloatingActionButton
                    └── Icon（Icons.add）
```

标注：

- StatelessWidget：MyApp 这种，build 完就不变了
- StatefulWidget：MyHomePage，计数要变，所以它得带 State

我画完之后的结论：Stateless 和 Stateful 的分界线就是"这块界面要不要自己变"。整条链路上真正会重建的只有 MyHomePage 那部分，setState 之后框架把标脏的重新 build 一遍，上面的 MyApp 和 MaterialApp 都没动。

（哪里画错了后面手写的时候再改。）
