/// A single named zone in a [VenueLayoutType.sections] layout,
/// e.g. "Stage A", "Standing Area", "VIP Zone" with a total capacity.
class VenueSectionModel {
  final String sectionName;
  final int capacity;

  const VenueSectionModel({required this.sectionName, required this.capacity});

  Map<String, dynamic> toJson() {
    return {'sectionName': sectionName, 'capacity': capacity};
  }
}
