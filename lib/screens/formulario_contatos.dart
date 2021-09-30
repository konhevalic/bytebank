import 'package:flutter/material.dart';

class FormularioContatos extends StatelessWidget {
  const FormularioContatos ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome completo'
              ),
              style: TextStyle(fontSize: 18.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Número da conta'
                ),
                style: TextStyle(fontSize: 18.0),
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('Criar contato')
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}