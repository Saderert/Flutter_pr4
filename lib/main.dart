import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/search': (context) => ProductSearch(),
        '/screen3': (context) => Screen3(),
        '/screen4': (context) => Screen4(),
        '/screen5': (context) => Screen5(),

      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Домашняя страница'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Перейти к поиску'),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            ElevatedButton(
              child: Text('Желаемое'),
              onPressed: () {
                Navigator.pushNamed(context, '/screen3');
              },
            ),
            ElevatedButton(
              child: Text('Заметки'),
              onPressed: () {
                Navigator.pushNamed(context, '/screen4');
              },
            ),
            ElevatedButton(
              child: Text('Корзина'),
              onPressed: () {
                Navigator.pushNamed(context, '/screen5');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductSearch extends StatefulWidget {
  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  final TextEditingController _controller = TextEditingController();
  final Map<String, int> _products = {
    'PlayStation5': Random().nextInt(100),
    'IPhone 15': Random().nextInt(100),
    'IPhone 15 Pro': Random().nextInt(100),
    'MacBook Air': Random().nextInt(100),
  };
  String _message = '';

  void _searchProduct() {
    setState(() {
      var product = _controller.text;
      if (_products.containsKey(product)) {
        var productAmount = _products[product];
        if (productAmount! > 0) {
          _message = '"$product" есть в наличии, количество: "$productAmount"';
        } else {
          _message = 'Такого продукта нет в нашем асортименте или он закончился';
        }
      } else {
        _message = 'Такого продукта нет в нашем асортименте или он закончился';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поиск продукта'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Введите название продукта'),
            ),
            ElevatedButton(
              onPressed: _searchProduct,
              child: Text('Найти'),
            ),
            Text(_message),
          ],
        ),
      ),
    );
  }
}


class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  List<String> _items = [];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Желаемое'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Введите текст',
            ),
          ),
          ElevatedButton(
            child: Text('Добавить'),
            onPressed: () {
              setState(() {
                _items.add(_controller.text);
                _controller.clear();
              });
            },
          ),
          ..._items.map((item) => Text(item)).toList(),
        ],
      ),
    );
  }
}

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  List<String> _items = [];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заметки'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Введите текст',
            ),
          ),
          ElevatedButton(
            child: Text('Добавить'),
            onPressed: () {
              setState(() {
                _items.add(_controller.text);
                _controller.clear();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class Screen5 extends StatefulWidget {
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  List<String> _items = [];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Введите текст',
            ),
          ),
          ElevatedButton(
            child: Text('Добавить'),
            onPressed: () {
              setState(() {
                _items.add(_controller.text);
                _controller.clear();
              });
            },
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _items.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}