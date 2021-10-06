import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';

class FormularioContatos extends StatefulWidget {
  const FormularioContatos ({ Key? key }) : super(key: key);

  @override
  State<FormularioContatos> createState() => _FormularioContatosState();
}

class _FormularioContatosState extends State<FormularioContatos> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome completo'
              ),
              style: const TextStyle(fontSize: 18.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: const InputDecoration(
                  labelText: 'Número da conta'
                ),
                style: const TextStyle(fontSize: 18.0),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Criar contato'),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? accountNumber = int.tryParse(_accountNumberController.text);
                    final Contato novoContato = Contato(0, name, accountNumber!);
                    salvar(novoContato).then((id) => Navigator.pop(context));
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}