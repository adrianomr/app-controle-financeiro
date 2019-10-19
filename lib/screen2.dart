import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  Screen2State createState() => Screen2State();
}

class Screen2State extends State<Screen2> {
  List itens = new List();
  String item = "";

  @override
  void initState() {
    super.initState();
    itens.add("Teste 1");
    itens.add("Teste 2");
    itens.add("Teste 3");
    itens.add("Teste 4");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Market List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            itens.add(item);
            print("added item -> " + item);
          });
        },
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Add new item'),
          onChanged: (item){
            setState(() {
              this.item = item;
            });
          },
        ),
      Expanded(
          child: SizedBox(
              height: 200.0,
              child: ListView.builder(
            itemCount: itens.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(index.toString()),
                child: Text(itens[index]),
                onDismissed: (direction){
                  itens.removeAt(index);
                },
              );
            }),
          )
      )
      ])), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
