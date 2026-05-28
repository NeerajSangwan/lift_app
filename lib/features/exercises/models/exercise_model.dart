class Model {
  String? _bodyPart;
  String? _equipment;
  String? _id;
  String? _name;
  String? _target;
  List<String>? _secondaryMuscles;
  List<String>? _instructions;

  Model({
    String? bodyPart,
    String? equipment,
    String? id,
    String? name,
    String? target,
    List<String>? secondaryMuscles,
    List<String>? instructions,
  }) {
    _bodyPart = bodyPart;
    _equipment = equipment;
    _id = id;
    _name = name;
    _target = target;
    _secondaryMuscles = secondaryMuscles;
    _instructions = instructions;
  }

  String? get bodyPart => _bodyPart;
  set bodyPart(String? bodyPart) => _bodyPart = bodyPart;

  String? get equipment => _equipment;
  set equipment(String? equipment) => _equipment = equipment;

  String? get id => _id;
  set id(String? id) => _id = id;

  String? get name => _name;
  set name(String? name) => _name = name;

  String? get target => _target;
  set target(String? target) => _target = target;

  List<String>? get secondaryMuscles => _secondaryMuscles;
  set secondaryMuscles(List<String>? secondaryMuscles) =>
      _secondaryMuscles = secondaryMuscles;

  List<String>? get instructions => _instructions;
  set instructions(List<String>? instructions) => _instructions = instructions;

  Model.fromJson(Map<String, dynamic> json) {
    _bodyPart = json['bodyPart'];
    _equipment = json['equipment'];
    _id = json['id'];
    _name = json['name'];
    _target = json['target'];

    if (json['secondaryMuscles'] != null) {
      _secondaryMuscles = json['secondaryMuscles'].cast<String>();
    }

    if (json['instructions'] != null) {
      _instructions = json['instructions'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'bodyPart': _bodyPart,
      'equipment': _equipment,
      'id': _id,
      'name': _name,
      'target': _target,
      'secondaryMuscles': _secondaryMuscles,
      'instructions': _instructions,
    };
  }
}
