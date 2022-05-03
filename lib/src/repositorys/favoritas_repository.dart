import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../banco/db_firestore.dart';
import '../models/mesa.dart';
import '../services/auth_services.dart';
import 'mesas_repo.dart';

class FavoritasRepository extends ChangeNotifier {
  final List<Mesa> _lista = [];
  late FirebaseFirestore db;
  late AuthService auth;

  FavoritasRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readFavoritas();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readFavoritas() async {
    if (auth.usuario != null && _lista.isEmpty) {
      final snapshot =
          await db.collection('usuarios/${auth.usuario!.uid}/favoritas').get();

      snapshot.docs.forEach((doc) {
        Mesa mesa = MesaRepository.tabela
            .firstWhere((mesa) => mesa.nome == doc.get('nome'));
        _lista.add(mesa);
        notifyListeners();
      });
    }
  }

  UnmodifiableListView<Mesa> get lista => UnmodifiableListView(_lista);

  saveAll(List<Mesa> mesa) {
    mesa.forEach((mesa) async {
      if (!_lista.any((atual) => atual.nome == mesa.nome)) {
        _lista.add(mesa);
        await db
            .collection('usuarios/${auth.usuario!.uid}/favoritas')
            .doc(mesa.nome)
            .set({
          'moeda': mesa.nome,
        });
      }
    });
    notifyListeners();
  }

  remove(Mesa mesa) async {
    await db
        .collection('usuarios/${auth.usuario!.uid}/favoritas')
        .doc(mesa.nome)
        .delete();
    _lista.remove(mesa);
    notifyListeners();
  }
}
