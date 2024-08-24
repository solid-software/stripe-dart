import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stripe/src/client.dart';
import 'package:stripe/src/expanded/discount_expanded.dart';
import 'package:stripe/src/resources/subscription.dart';
import 'package:stripe/src/utils/expandable_fields/customer_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/latest_invoice_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/payment_intent_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/subscription_expandable_field.dart';
import 'package:test/test.dart';

void main() {
  late DioClient client;
  late SubscriptionResource subscriptionResource;
  setUp(() {
    // We set the baseUrl to something unreachable, because we define
    // interceptors in the tests.
    client = DioClient(apiKey: 'sk_foobar', baseUrl: 'http://void/');
    subscriptionResource = SubscriptionResource(client);
  });
  group('SubscriptionExpanded', () {
    test('properly decodes all values', () async {
      const subscriptionId = 'sub_testSubscriptionId';
      final expansionSpec = SubscriptionExpandableField(
        customerExpansion: CustomerExpandableField(),
        discountsExpansion: DiscountsExpandableField(),
        latestInvoiceExpansion: LatestInvoiceExpandableField(
          discountsExpansion: DiscountsExpandableField(),
          paymentIntentExpansion: PaymentIntentExpandableField(),
        ),
      );

      client.dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          expect(options.method, 'GET');
          expect(options.data, null);
          expect(
              options.queryParameters.values.toSet(),
              containsAll({
                'latest_invoice.payment_intent',
                'latest_invoice.discounts',
                'customer',
                'discounts',
              }));
          handler.resolve(
            Response(
              requestOptions: options,
              data: jsonDecode(retrieveExpandedSubscriptionResponse),
              statusCode: HttpStatus.ok,
            ),
          );
        },
      ));

      final subscriptionExpanded = await subscriptionResource.retrieveExpanded(
        subscriptionId,
        expand: expansionSpec,
      );

      final subscription = subscriptionExpanded.subscription;
      expect(subscription.id, subscriptionId);
      expect(subscription.items.data.length, 1);

      final subscriptionItem = subscription.items.data.first;
      expect(subscriptionItem.id, 'si_testSubscriptionItemId');
      expect(subscriptionItem.price.id, 'price_testPlanPriceId');
      expect(subscriptionItem.price.active, isTrue);

      expect(
        subscriptionExpanded.discounts,
        isA<List<DiscountExpanded>>()
            .having((l) => l.isEmpty, 'isEmpty', isTrue),
      );

      final customer = subscriptionExpanded.customer?.customer;
      if (customer == null) fail('Customer is null');
      expect(customer.id, 'cus_testCustomerId');
      expect(customer.email, 'testmail@test.com');

      final latestInvoice = subscriptionExpanded.latestInvoice?.invoice;
      if (latestInvoice == null) fail('latestInvoice is null');
      expect(latestInvoice.id, 'in_testInvoiceId');
      expect(latestInvoice.accountName, 'A very profitable company');

      final paymentIntent = subscriptionExpanded.latestInvoice?.paymentIntent;
      if (paymentIntent == null) fail('latestInvoice.paymentIntent is null');
      expect(paymentIntent.id, 'pi_testPaymentIntentId');
      expect(paymentIntent.amount, 29900);

      final invoiceDiscounts = subscriptionExpanded.latestInvoice?.discounts;
      if (invoiceDiscounts == null) fail('latestInvoice.discounts is null');
      expect(invoiceDiscounts, isEmpty);
    });
  });
}

const retrieveExpandedSubscriptionResponse = r'''
{
    "id": "sub_testSubscriptionId",
    "object": "subscription",
    "application": null,
    "application_fee_percent": null,
    "automatic_tax": {
        "enabled": false,
        "liability": null
    },
    "billing_cycle_anchor": 1727074800,
    "billing_cycle_anchor_config": {
        "day_of_month": 23,
        "hour": 7,
        "minute": 0,
        "month": null,
        "second": 0
    },
    "billing_thresholds": null,
    "cancel_at": null,
    "cancel_at_period_end": false,
    "canceled_at": null,
    "cancellation_details": {
        "comment": null,
        "feedback": null,
        "reason": null
    },
    "collection_method": "charge_automatically",
    "created": 1724414109,
    "currency": "usd",
    "current_period_end": 1727074800,
    "current_period_start": 1724414109,
    "customer": {
        "id": "cus_testCustomerId",
        "object": "customer",
        "address": null,
        "balance": 0,
        "created": 1721299529,
        "currency": "usd",
        "default_currency": "usd",
        "default_source": null,
        "delinquent": false,
        "description": null,
        "discount": null,
        "email": "testmail@test.com",
        "invoice_prefix": "EADE9237",
        "invoice_settings": {
            "custom_fields": null,
            "default_payment_method": "pm_testPaymentMethodId",
            "footer": null,
            "rendering_options": null
        },
        "livemode": false,
        "metadata": {},
        "name": "John Doe",
        "next_invoice_sequence": 59,
        "phone": null,
        "preferred_locales": [],
        "shipping": null,
        "tax_exempt": "none",
        "test_clock": null
    },
    "days_until_due": null,
    "default_payment_method": null,
    "default_source": null,
    "default_tax_rates": [],
    "description": null,
    "discount": null,
    "discounts": [],
    "ended_at": null,
    "invoice_settings": {
        "account_tax_ids": null,
        "issuer": {
            "type": "self"
        }
    },
    "items": {
        "object": "list",
        "data": [
            {
                "id": "si_testSubscriptionItemId",
                "object": "subscription_item",
                "billing_thresholds": null,
                "created": 1724414109,
                "discounts": [],
                "metadata": {},
                "plan": {
                    "id": "price_testPlanPriceId",
                    "object": "plan",
                    "active": true,
                    "aggregate_usage": null,
                    "amount": 29900,
                    "amount_decimal": "29900",
                    "billing_scheme": "per_unit",
                    "created": 1720570375,
                    "currency": "usd",
                    "interval": "month",
                    "interval_count": 1,
                    "livemode": false,
                    "metadata": {},
                    "meter": null,
                    "nickname": null,
                    "product": "prod_testProductId",
                    "tiers_mode": null,
                    "transform_usage": null,
                    "trial_period_days": null,
                    "usage_type": "licensed"
                },
                "price": {
                    "id": "price_testPlanPriceId",
                    "object": "price",
                    "active": true,
                    "billing_scheme": "per_unit",
                    "created": 1720570375,
                    "currency": "usd",
                    "custom_unit_amount": null,
                    "livemode": false,
                    "lookup_key": null,
                    "metadata": {},
                    "nickname": null,
                    "product": "prod_testProductId",
                    "recurring": {
                        "aggregate_usage": null,
                        "interval": "month",
                        "interval_count": 1,
                        "meter": null,
                        "trial_period_days": null,
                        "usage_type": "licensed"
                    },
                    "tax_behavior": "unspecified",
                    "tiers_mode": null,
                    "transform_quantity": null,
                    "type": "recurring",
                    "unit_amount": 29900,
                    "unit_amount_decimal": "29900"
                },
                "quantity": 1,
                "subscription": "sub_testSubscriptionId",
                "tax_rates": []
            }
        ],
        "has_more": false,
        "total_count": 1,
        "url": "/v1/subscription_items?subscription=sub_testSubscriptionId"
    },
    "latest_invoice": {
        "id": "in_testInvoiceId",
        "object": "invoice",
        "account_country": "US",
        "account_name": "A very profitable company",
        "account_tax_ids": null,
        "amount_due": 29900,
        "amount_paid": 29900,
        "amount_remaining": 0,
        "amount_shipping": 0,
        "application": null,
        "application_fee_amount": null,
        "attempt_count": 1,
        "attempted": true,
        "auto_advance": false,
        "automatic_tax": {
            "enabled": false,
            "liability": null,
            "status": null
        },
        "automatically_finalizes_at": null,
        "billing_reason": "subscription_create",
        "charge": "ch_testChargeId",
        "collection_method": "charge_automatically",
        "created": 1724414109,
        "currency": "usd",
        "custom_fields": null,
        "customer": "cus_testCustomerId",
        "customer_address": null,
        "customer_email": "testmail@test.com",
        "customer_name": "John Doe",
        "customer_phone": null,
        "customer_shipping": null,
        "customer_tax_exempt": "none",
        "customer_tax_ids": [],
        "default_payment_method": null,
        "default_source": null,
        "default_tax_rates": [],
        "description": null,
        "discount": null,
        "discounts": [],
        "due_date": null,
        "effective_at": 1724414109,
        "ending_balance": 0,
        "footer": null,
        "from_invoice": null,
        "hosted_invoice_url": "https://void",
        "invoice_pdf": "https://void",
        "issuer": {
            "type": "self"
        },
        "last_finalization_error": null,
        "latest_revision": null,
        "lines": {
            "object": "list",
            "data": [
                {
                    "id": "il_testLineItemId",
                    "object": "line_item",
                    "amount": 29900,
                    "amount_excluding_tax": 29900,
                    "currency": "usd",
                    "description": "Time on a subscription plan from 23 Aug 2024 until 23 Sep 2024",
                    "discount_amounts": [],
                    "discountable": false,
                    "discounts": [],
                    "invoice": "in_testInvoiceId",
                    "invoice_item": "ii_testInvoiceItemId",
                    "livemode": false,
                    "metadata": {},
                    "period": {
                        "end": 1727074800,
                        "start": 1724396400
                    },
                    "plan": {
                        "id": "price_testPlanPriceId",
                        "object": "plan",
                        "active": true,
                        "aggregate_usage": null,
                        "amount": 29900,
                        "amount_decimal": "29900",
                        "billing_scheme": "per_unit",
                        "created": 1720570375,
                        "currency": "usd",
                        "interval": "month",
                        "interval_count": 1,
                        "livemode": false,
                        "metadata": {},
                        "meter": null,
                        "nickname": null,
                        "product": "prod_testProductId",
                        "tiers_mode": null,
                        "transform_usage": null,
                        "trial_period_days": null,
                        "usage_type": "licensed"
                    },
                    "price": {
                        "id": "price_testPlanPriceId",
                        "object": "price",
                        "active": true,
                        "billing_scheme": "per_unit",
                        "created": 1720570375,
                        "currency": "usd",
                        "custom_unit_amount": null,
                        "livemode": false,
                        "lookup_key": null,
                        "metadata": {},
                        "nickname": null,
                        "product": "prod_testProductId",
                        "recurring": {
                            "aggregate_usage": null,
                            "interval": "month",
                            "interval_count": 1,
                            "meter": null,
                            "trial_period_days": null,
                            "usage_type": "licensed"
                        },
                        "tax_behavior": "unspecified",
                        "tiers_mode": null,
                        "transform_quantity": null,
                        "type": "recurring",
                        "unit_amount": 29900,
                        "unit_amount_decimal": "29900"
                    },
                    "proration": true,
                    "proration_details": {
                        "credited_items": null
                    },
                    "quantity": 1,
                    "subscription": "sub_testSubscriptionId",
                    "subscription_item": "si_testSubscriptionItemId",
                    "tax_amounts": [],
                    "tax_rates": [],
                    "type": "invoiceitem",
                    "unit_amount_excluding_tax": "29900"
                }
            ],
            "has_more": false,
            "total_count": 1,
            "url": "/v1/invoices/in_testInvoiceId/lines"
        },
        "livemode": false,
        "metadata": {},
        "next_payment_attempt": null,
        "number": "XXXXXX-XXXX",
        "on_behalf_of": null,
        "paid": true,
        "paid_out_of_band": false,
        "payment_intent": {
            "id": "pi_testPaymentIntentId",
            "object": "payment_intent",
            "amount": 29900,
            "amount_capturable": 0,
            "amount_details": {
                "tip": {}
            },
            "amount_received": 29900,
            "application": null,
            "application_fee_amount": null,
            "automatic_payment_methods": null,
            "canceled_at": null,
            "cancellation_reason": null,
            "capture_method": "automatic",
            "charges": {
                "object": "list",
                "data": [
                    {
                        "id": "ch_testChargeId",
                        "object": "charge",
                        "amount": 29900,
                        "amount_captured": 29900,
                        "amount_refunded": 0,
                        "application": null,
                        "application_fee": null,
                        "application_fee_amount": null,
                        "balance_transaction": "txn_testTransactionId",
                        "billing_details": {
                            "address": {
                                "city": null,
                                "country": "GE",
                                "line1": null,
                                "line2": null,
                                "postal_code": null,
                                "state": null
                            },
                            "email": null,
                            "name": null,
                            "phone": null
                        },
                        "calculated_statement_descriptor": "TEST.COM",
                        "captured": true,
                        "created": 1724414114,
                        "currency": "usd",
                        "customer": "cus_testCustomerId",
                        "description": "Subscription creation",
                        "destination": null,
                        "dispute": null,
                        "disputed": false,
                        "failure_balance_transaction": null,
                        "failure_code": null,
                        "failure_message": null,
                        "fraud_details": {},
                        "invoice": "in_testInvoiceId",
                        "livemode": false,
                        "metadata": {},
                        "on_behalf_of": null,
                        "order": null,
                        "outcome": {
                            "network_status": "approved_by_network",
                            "reason": null,
                            "risk_level": "normal",
                            "risk_score": 51,
                            "seller_message": "Payment complete.",
                            "type": "authorized"
                        },
                        "paid": true,
                        "payment_intent": "pi_testPaymentIntentId",
                        "payment_method": "pm_testPaymentMethodId",
                        "payment_method_details": {
                            "card": {
                                "amount_authorized": 29900,
                                "authorization_code": null,
                                "brand": "visa",
                                "checks": {
                                    "address_line1_check": null,
                                    "address_postal_code_check": null,
                                    "cvc_check": null
                                },
                                "country": "US",
                                "exp_month": 4,
                                "exp_year": 2026,
                                "extended_authorization": {
                                    "status": "disabled"
                                },
                                "fingerprint": "testFingerprintId",
                                "funding": "credit",
                                "incremental_authorization": {
                                    "status": "unavailable"
                                },
                                "installments": null,
                                "last4": "4242",
                                "mandate": null,
                                "multicapture": {
                                    "status": "unavailable"
                                },
                                "network": "visa",
                                "network_token": {
                                    "used": false
                                },
                                "overcapture": {
                                    "maximum_amount_capturable": 29900,
                                    "status": "unavailable"
                                },
                                "three_d_secure": null,
                                "wallet": null
                            },
                            "type": "card"
                        },
                        "receipt_email": "testmail@test.com",
                        "receipt_number": null,
                        "receipt_url": "https://void",
                        "refunded": false,
                        "refunds": {
                            "object": "list",
                            "data": [],
                            "has_more": false,
                            "total_count": 0,
                            "url": "/v1/charges/ch_testChargeId/refunds"
                        },
                        "review": null,
                        "shipping": null,
                        "source": null,
                        "source_transfer": null,
                        "statement_descriptor": null,
                        "statement_descriptor_suffix": null,
                        "status": "succeeded",
                        "transfer_data": null,
                        "transfer_group": null
                    }
                ],
                "has_more": false,
                "total_count": 1,
                "url": "/v1/charges?payment_intent=pi_testPaymentIntentId"
            },
            "client_secret": "pi_testPaymentIntentId_secret_testSecret",
            "confirmation_method": "automatic",
            "created": 1724414109,
            "currency": "usd",
            "customer": "cus_testCustomerId",
            "description": "Subscription creation",
            "invoice": "in_testInvoiceId",
            "last_payment_error": null,
            "latest_charge": "ch_testChargeId",
            "livemode": false,
            "metadata": {},
            "next_action": null,
            "on_behalf_of": null,
            "payment_method": "pm_testPaymentMethodId",
            "payment_method_configuration_details": null,
            "payment_method_options": {
                "card": {
                    "installments": null,
                    "mandate_options": null,
                    "network": null,
                    "request_three_d_secure": "automatic"
                }
            },
            "payment_method_types": [
                "card"
            ],
            "processing": null,
            "receipt_email": "testmail@test.com",
            "review": null,
            "setup_future_usage": "off_session",
            "shipping": null,
            "source": null,
            "statement_descriptor": null,
            "statement_descriptor_suffix": null,
            "status": "succeeded",
            "transfer_data": null,
            "transfer_group": null
        },
        "payment_settings": {
            "default_mandate": null,
            "payment_method_options": null,
            "payment_method_types": [
                "card"
            ]
        },
        "period_end": 1724414109,
        "period_start": 1724414109,
        "post_payment_credit_notes_amount": 0,
        "pre_payment_credit_notes_amount": 0,
        "quote": null,
        "receipt_number": null,
        "rendering": null,
        "rendering_options": null,
        "shipping_cost": null,
        "shipping_details": null,
        "starting_balance": 0,
        "statement_descriptor": null,
        "status": "paid",
        "status_transitions": {
            "finalized_at": 1724414109,
            "marked_uncollectible_at": null,
            "paid_at": 1724414115,
            "voided_at": null
        },
        "subscription": "sub_testSubscriptionId",
        "subscription_details": {
            "metadata": {
                "contract_id": "157"
            }
        },
        "subtotal": 29900,
        "subtotal_excluding_tax": 29900,
        "tax": null,
        "test_clock": null,
        "total": 29900,
        "total_discount_amounts": [],
        "total_excluding_tax": 29900,
        "total_tax_amounts": [],
        "transfer_data": null,
        "webhooks_delivered_at": 1724414111
    },
    "livemode": false,
    "metadata": {
        "contract_id": "157"
    },
    "next_pending_invoice_item_invoice": null,
    "on_behalf_of": null,
    "pause_collection": null,
    "payment_settings": {
        "payment_method_options": null,
        "payment_method_types": [
            "card"
        ],
        "save_default_payment_method": "off"
    },
    "pending_invoice_item_interval": null,
    "pending_setup_intent": null,
    "pending_update": null,
    "plan": {
        "id": "price_testPlanPriceId",
        "object": "plan",
        "active": true,
        "aggregate_usage": null,
        "amount": 29900,
        "amount_decimal": "29900",
        "billing_scheme": "per_unit",
        "created": 1720570375,
        "currency": "usd",
        "interval": "month",
        "interval_count": 1,
        "livemode": false,
        "metadata": {},
        "meter": null,
        "nickname": null,
        "product": "prod_testProductId",
        "tiers_mode": null,
        "transform_usage": null,
        "trial_period_days": null,
        "usage_type": "licensed"
    },
    "quantity": 1,
    "schedule": null,
    "start_date": 1724396400,
    "status": "active",
    "test_clock": null,
    "transfer_data": null,
    "trial_end": null,
    "trial_settings": {
        "end_behavior": {
            "missing_payment_method": "create_invoice"
        }
    },
    "trial_start": null
}''';
