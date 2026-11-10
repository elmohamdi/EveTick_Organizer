class TicketTierModel {
  final String ticketName;
  final double ticketPrice;
  final int ticketQuantity;
  final String? ticketDescription;

  const TicketTierModel({
    required this.ticketName,
    required this.ticketPrice,
    required this.ticketQuantity,
    this.ticketDescription,
  });
  // i need to json
  Map<String, dynamic> toJson() {
    return {
      'ticketName': ticketName,
      'ticketPrice': ticketPrice,
      'ticketQuantity': ticketQuantity,
      'ticketDescription': ticketDescription,
    };
  }
}
