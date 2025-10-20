/// https://docs.stripe.com/api/checkout/sessions/object#checkout_session_object-status
enum CheckoutSessionStatus {
  /// The checkout session is complete. Payment processing may still be in
  /// progress
  complete,

  /// The checkout session has expired. No further processing will occur
  expired,

  /// The checkout session is still in progress. Payment processing has not
  /// started
  open,
}
