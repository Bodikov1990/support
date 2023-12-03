import 'package:support/src/ticket_search_page/domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  const CustomerModel({
    required super.id,
    required super.phone,
    required super.email,
  });
}
