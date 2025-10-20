part of '../../../messages.dart';

/// https://docs.stripe.com/api/checkout/sessions/list
@JsonSerializable()
class ListCheckoutSessionsRequest extends Message {
  /// Only return the Checkout Session for the PaymentIntent specified.
  final String? paymentIntent;

  /// Only return the Checkout Session for the subscription specified.
  final String? subscription;

  /// Only return Checkout Sessions that were created during the given date
  /// interval.
  final CreatedRequest? created;

  /// Only return the Checkout Sessions for the Customer specified.
  final String? customer;

  /// A cursor for use in pagination. ending_before is an object ID that
  /// defines your place in the list. For instance, if you make a list request
  /// and receive 100 objects, starting with obj_bar, your subsequent call can
  /// include ending_before=obj_bar in order to fetch the previous page of the
  /// list.
  final String? endingBefore;

  /// A limit on the number of objects to be returned. Limit can range between
  /// 1 and 100, and the default is 10.
  final int? limit;

  /// Only return the Checkout Sessions for the Payment Link specified.
  final String? paymentLink;

  /// A cursor for use in pagination. starting_after is an object ID that
  /// defines your place in the list. For instance, if you make a list request
  /// and receive 100 objects, ending with obj_foo, your subsequent call can
  /// include starting_after=obj_foo in order to fetch the next page of the
  /// list.
  final String? startingAfter;

  /// Only return the Checkout Sessions matching the given status.
  final CheckoutSessionStatus? status;

  const ListCheckoutSessionsRequest({
    this.paymentIntent,
    this.subscription,
    this.created,
    this.customer,
    this.endingBefore,
    this.limit,
    this.paymentLink,
    this.startingAfter,
    this.status,
  });

  factory ListCheckoutSessionsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListCheckoutSessionsRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ListCheckoutSessionsRequestToJson(this);
}
