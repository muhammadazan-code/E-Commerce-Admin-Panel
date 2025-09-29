class TPricingCalculator {
  // Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String locations) {
    double taxRate = getTaxRateForLocation(locations);
    double taxAmount = productPrice + taxRate;

    double shippingCost = getShippingCost(locations);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  // Calculate shipping cost
  static String calculateShippingCost(double productPrice, String locations) {
    double shippingCost = getShippingCost(locations);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getShippingCost(String location) {
    return 5.00;
  }

  static double getTaxRateForLocation(String location) {
    return 0.10;
  }

  // static double calculateCartTotal(CartModel cart){
  //   return cart.items.map((e) => e.price).fold(0,(prevoiusPrice, currentPrice) => prevoiusPrice + (currentPrice ?? 0));
  // }
}
