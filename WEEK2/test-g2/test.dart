
int calculateDelivery(
  int orderPrice,
  int freeDeliveryLimit, {
  int? deliveryFee,
}) {
  if (orderPrice >= freeDeliveryLimit) {
    return 0;
  } else {
    return deliveryFee ?? 0;
  }
}

void main() {
  Map<String, int> orders = {
    "ORD001": 40,
    "ORD002": 60,
    "ORD003": 25,
    "ORD004": 80,
  };

  int? deliveryFee = 5;
  int freeDeliveryLimit = 50;

  // For each order, compute the delivery price
  // with your function and print it.
  orders.forEach((orderId, orderPrice) {
    int price = calculateDelivery(
      orderPrice,
      freeDeliveryLimit,
      deliveryFee: deliveryFee,
    );

    print("$orderId: $price");
  });
}
