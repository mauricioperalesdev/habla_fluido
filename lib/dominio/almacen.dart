typedef MapaAvance = Map<String, Object?>;

/// Dónde se guarda el avance (JSON). En el teléfono: shared_preferences.
abstract class AlmacenAvance {
  Future<MapaAvance?> cargar();
  Future<void> guardar(MapaAvance datos);
}