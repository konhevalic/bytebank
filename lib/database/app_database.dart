import 'package:bytebank/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath){
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'account_number INTEGER)');
    }, version: 1,
    //versao 3
    //onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> salvar(Contato contato){
  return createDatabase().then((db) {
    final Map<String, dynamic> mapaContato = {};
    mapaContato['name'] = contato.name;
    mapaContato['account_number'] = contato.accountNumber;
    return db.insert('contatos', mapaContato);
  });       
}

Future<List<Contato>> buscarTodosContatos() {
  return createDatabase().then((db){
    return db.query('contatos').then((maps) {
      final List<Contato> contatos = [];
      for(Map<String, dynamic> map in maps) {
        final Contato contato = Contato(
          map['id'], 
          map['name'], 
          map['account_number'],
          );
        contatos.add(contato);
      }
      return contatos;
    });
  });
}