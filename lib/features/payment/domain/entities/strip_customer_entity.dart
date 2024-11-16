class StripeCustomerEntity {
  final String customerID;
  final String? cEmail, cPhone, cAddress, cName;

  StripeCustomerEntity(
      {required this.customerID,
      this.cEmail,
      this.cPhone,
      this.cName,
      this.cAddress});

  Map<String, dynamic> toJson() {
    return {
      'id': customerID,
      'address': cAddress,
      'name': cName,
      'email': cEmail
    };
  }
}
