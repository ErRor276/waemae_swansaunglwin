class Job {
  final String name;
  final String location;
  final List days;

  Job({
    required this.name,
    required this.location,
    required this.days,
  });

  Job.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          location: json['location']! as String,
          days: json['days']! as List,
        );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'location': location,
      'days': days,
    };
  }

  @override
  String toString() {
    return "Job{ name: $name, location: $location, days: $days }";
  }
}
