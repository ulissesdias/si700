import 'package:flutter/material.dart';

import 'screens/a_sized_box.dart';
import 'screens/b_sized_box.dart';
import 'screens/c_sized_box.dart';
import 'screens/d_sized_box.dart';
import 'screens/e_center.dart';
import 'screens/f_center.dart';
import 'screens/g_center.dart';
import 'screens/h_column.dart';
import 'screens/i_column.dart';
import 'screens/j_column.dart';
import 'screens/k_column.dart';
import 'screens/l_column.dart';
import 'screens/m_container.dart';
import 'screens/n_container.dart';
import 'screens/o_container.dart';
import 'screens/p_container.dart';
import 'screens/q_container.dart';
import 'screens/r_container.dart';
import 'screens/s_cart.dart';
import 'screens/t_completa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 03',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Aula 03'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Um objeto da classe PageController gerencia a detecção do gesto de swype.
  final PageController _controller = PageController(
    initialPage: 0, // Configura a tela inicial
  );
  int localPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.blue[100],
                    builder: (_) => Text(codes[localPage]),
                  );
                },
                icon: const Icon(Icons.code),
              );
            })
          ],
        ),
        body: PageView(
          controller: _controller,
          onPageChanged: (index) {
            localPage = index;
          },
          // O parâmetro "children" recebe todas as páginas
          children: const [
            SizedBox1(),
            SizedBox2(),
            SizedBox3(),
            SizedBox4(),
            Center1(),
            Center2(),
            Center3(),
            Column1(),
            Column2(),
            Column3(),
            Column4(),
            Column5(),
            Container1(),
            Container2(),
            Container3(),
            Container4(),
            Container5(),
            Container6(),
            Card1(),
            CompleteView1()
          ],
        ));
  }
}

List<String> codes = [
  """
const SizedBox(
      width: 200,
      height: 400,
      child: Text("Child2"),
    );
  """,
  """ 
const SizedBox(
      width: 200,
      height: 400,
      child: FittedBox(
        child: Text("Child2"),
      ),
    );  
  """,
  """ 
const SizedBox.expand(
      child: FittedBox(
        child: Text("Child2"),
      ),
    );  
  """,
  """ 
ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100),
      child: const FittedBox(
        child: Text("Child2"),
      ),
    );  
  """,
  """ 
const Center(
      child: Icon(
        Icons.directions_car,
      ),
    );  
  """,
  """ 
const Center(
      widthFactor: 3.0,
      child: Icon(Icons.directions_car),
    );  
  """,
  """ 
const Center(
      heightFactor: 3.0,
      child: Icon(Icons.directions_car),
    );  
  """,
  """ 
SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("1"),
          Text("2"),
          Text("3"),
        ],
      ),
    );  
  """,
  """ 
Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("1"),
          Text("2"),
          Text("3"),
        ],
      ),
    );  
  """,
  """ 
Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("1"),
        Text("2"),
        Text("3"),
      ],
    );  
  """,
  """ 
Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("1"),
        Text("2"),
        Text("3"),
      ],
    );  
  """,
  """ 
Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("1"),
        Expanded(
          // Este filho tomará o espaço excedente.
          child: FittedBox(child: Text("2")),
        ),
        Text("3"),
      ],
    );  
  """,
  """ 
Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 240,
        width: 180,
        color: Colors.red,
        child: Image.network('https://flutter.github.io/'
            'assets-for-api-docs/assets/widgets/owl-2.jpg'),
      ),
    );  
  """,
  """ 
Center(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      height: 240,
      width: 180,
      color: Colors.red,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.network('https://flutter.github.io/'
            'assets-for-api-docs/assets/widgets/owl-2.jpg'),
      ),
    ));  
  """,
  """ 
Center(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      height: 240,
      width: 180,
      color: Colors.red,
      transform: Matrix4.rotationZ(0.1),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.network('https://flutter.github.io'
            'assets-for-api-docs/assets/widgets/owl-2.jpg'),
      ),
    ));  
  """,
  """ 
Center(
      child: Container(
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.bottomCenter,
      height: 240,
      width: 180,
      color: Colors.red,
      child: const Icon(Icons.alarm),
    ));  
  """,
  """ 
Center(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      height: 240,
      width: 180,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: const Icon(Icons.alarm),
    ));  
  """,
  """
    Tente fazer algo parecido sozinho
  """,
  """
    Tente fazer algo parecido sozinho
  """,
  """
    Tente fazer algo parecido sozinho
  """,
  """
    Tente fazer algo parecido sozinho
  """
];
