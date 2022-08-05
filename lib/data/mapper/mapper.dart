import 'package:flutter_clean_architecture/app/constants.dart';
import 'package:flutter_clean_architecture/app/extensions.dart';
import 'package:flutter_clean_architecture/data/response/responses.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';

extension CustomerResponseMapper on CustomerResponse {
  Customer toDomain() {
    return Customer(
        id.orEmpty(), name.orEmpty(), numberOfNotifications.orZero());
  }
}

extension ContactsResponseMapper on ContactsResponse {
  Contacts toDomain() {
    return Contacts(email.orEmpty(), phone.orEmpty(), link.orEmpty());
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse {
  Authentication toDomain() {
    return Authentication(customer?.toDomain(), contacts?.toDomain());
  }
}
