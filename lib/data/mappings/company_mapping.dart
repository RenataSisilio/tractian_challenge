import '../../models/company.dart';
import '../errors/mapping_errors.dart';

extension Mapping on Company {
  Map<String, dynamic> toMap() => {'id': id, 'name': name};
}

extension CompanyMapping on Map<String, dynamic> {
  Company toCompany() {
    return switch (this) {
      {
        "id": String id,
        "name": String name,
      } =>
        Company(
          id: id,
          name: name,
        ),
      _ => throw InvalidDataFormatError(
          data: this,
          expectedFormat: '{"id": String, "name": String}',
        ),
    };
  }
}
