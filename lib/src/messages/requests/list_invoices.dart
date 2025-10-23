part of '../../../messages.dart';

/// https://docs.stripe.com/api/invoices/list
@JsonSerializable()
class ListInvoicesRequest extends Message {
  /// Only return invoices for the customer specified by this customer ID.
  final String? customer;

  /// The status of the invoice, one of draft, open, paid, uncollectible, or
  /// void.
  final InvoiceStatus? status;

  /// Only return invoices for the subscription specified by this subscription ID.
  final String? subscription;

  /// The collection method of the invoice to retrieve. Either
  /// charge_automatically or send_invoice.
  final InvoiceCollectionMethod? collectionMethod;

  /// Only return invoices that were created during the given date interval.
  final CreatedRequest? created;

  /// A cursor for use in pagination. ending_before is an object ID that defines
  /// your place in the list. For instance, if you make a list request and
  /// receive 100 objects, starting with obj_bar, your subsequent call can
  /// include ending_before=obj_bar in order to fetch the previous page of the
  /// list.
  final String? endingBefore;

  /// A limit on the number of objects to be returned. Limit can range between
  /// 1 and 100, and the default is 10.
  final int? limit;

  /// A cursor for use in pagination. starting_after is an object ID that
  /// defines your place in the list. For instance, if you make a list request
  /// and receive 100 objects, ending with obj_foo, your subsequent call can
  /// include starting_after=obj_foo in order to fetch the next page of the
  /// list.
  final String? startingAfter;

  const ListInvoicesRequest({
    this.customer,
    this.status,
    this.subscription,
    this.collectionMethod,
    this.created,
    this.endingBefore,
    this.limit,
    this.startingAfter,
  });

  factory ListInvoicesRequest.fromJson(Map<String, dynamic> json) =>
      _$ListInvoicesRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ListInvoicesRequestToJson(this);
}
