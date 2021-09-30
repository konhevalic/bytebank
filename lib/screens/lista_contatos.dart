import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  const ListaContatos({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.blueAccent[700]),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contatos'
            ),
          ),
        body: ListView(
          children: const [
            Card(
              child: ListTile(
                title: Text('Alão gatão'),
                subtitle: Text('1000'),
                ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}