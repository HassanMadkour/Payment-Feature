class StripeCustomerInputEntity {
  final String? cEmail, cPhone, cAddress, cName;

  StripeCustomerInputEntity(
      {this.cEmail, this.cPhone, this.cName, this.cAddress});

  Map<String, dynamic> toJson() {
    return {'address': cAddress, 'name': cName, 'email': cEmail};
  }
}
