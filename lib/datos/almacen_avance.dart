import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../dominio/almacen.dart';

class AlmacenAvanceMemoria implements AlmacenAvance {
  MapaAvance? _datos;

  @override
  Future<MapaAvance?> cargar() async => _datos;

  @override
  Future<void> guardar(MapaAvance datos) async =>
      _datos = jsonDecode(jsonEncode(datos)) as MapaAvance;
}

class AlmacenAvancePrefs implements AlmacenAvance {
  static const _clave = 'avance_v1';

  @override
  Future<MapaAvance?> cargar() async {
    final t = (await SharedPreferences.getInstance()).getString(_clave);
    if (t == null) return null;
    try {
      return (jsonDecode(t) as Map).cast<String, Object?>();
    } catch (_) {
      return null; // archivo dañado: empezamos limpio
    }
  }

  @override
  Future<void> guardar(MapaAvance datos) async =>
      (await SharedPreferences.getInstance()).setString(_clave, jsonEncode(datos));
}