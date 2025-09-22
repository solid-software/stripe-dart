part of '../../../messages.dart';

@JsonSerializable()
class ListCheckoutSessionsRequest extends Message {
  final String? paymentIntent;
  final String? subscription;
  final CreatedRequest? created;
  final String? customer;
  final String? endingBefore;
  final int? limit;
  final String? paymentLink;
  final String? startingAfter;
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
