import 'package:d_widgets_intro/screens/widget_with_code.dart';
import 'package:flutter/gestures.dart';
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
  final PageController _pageViewController = PageController(
    initialPage: 0, // Configura a tela inicial
  );
  final ScrollController _navBarController = ScrollController();

  final List<WidgetWithCode> widgetWithCode = [
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
  ];
  int localPage = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
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
                  builder: (_) => Text(widgetWithCode[localPage].getCode()),
                );
              },
              icon: const Icon(Icons.code),
            );
          })
        ],
      ),
      body: Column(
        children: [
          navigationBarButtons(),
          Expanded(child: pageViewSlides()),
        ],
      ),
    );
  }

  Widget pageViewSlides() {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: PageView(
        controller: _pageViewController,
        onPageChanged: (index) {
          setState(() {
            localPage = index;
            double offset = (index + 1) *
                _navBarController.positions.last.maxScrollExtent /
                20;
            _navBarController.jumpTo(offset);
          });
        },
        // O parâmetro "children" recebe todas as páginas
        children: List.generate(widgetWithCode.length,
            (index) => widgetWithCode[index].getWidget()),
      ),
    );
  }

  Widget navigationBarButtons() {
    return SingleChildScrollView(
        controller: _navBarController,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(20, (int index) {
            return buildIndexButtons(index);
          }),
        ));
  }

  TextButton buildIndexButtons(int index) {
    return TextButton(
      onPressed: () {
        // Movendo a página sendo mostrada
        _pageViewController.jumpToPage(index);
        /*
        // Também podemos usar o animateToPage
        _controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );*/

        // Movendo a posição da barra de navegação:
        double offset = index *
            _navBarController.positions.last.maxScrollExtent /
            widgetWithCode.length;
        _navBarController.jumpTo(offset);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 20.0,
        width: 20.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              index == localPage ? Colors.blue : Colors.grey.withOpacity(0.5),
        ),
        child: Center(
          child: Text(
            '${index + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
