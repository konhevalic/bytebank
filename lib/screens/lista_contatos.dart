import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/formulario_contatos.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({ Key? key }) : super(key: key);

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}
class _ListaContatosState extends State<ListaContatos> {
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
        body: FutureBuilder<List<Contato>>(
          initialData: const [],
          future: buscarTodosContatos(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contato> contacts = snapshot.data as List<Contato>;
              return ListView.builder(
                itemBuilder: (context, index) {
                final Contato contact = contacts[index];
                return _ContactItem(contact);
              },
              itemCount: contacts.length
              );
            }
            return const Text('Erro interno.');
          }            
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const FormularioContatos()))
            .then((value) => setState(() {}));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contato contact;
  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
              child: ListTile(
                title: Text(
                  contact.name, 
                  style: const TextStyle(fontSize: 24.0)),
                subtitle: Text(
                  contact.accountNumber.toString(),
                  style: const TextStyle(fontSize: 16.0)),
                ),
            );
  }
  
}