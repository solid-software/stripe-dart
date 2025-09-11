library stripe;

import 'package:stripe/src/api_config.dart';

import 'src/client.dart';
import 'src/resources/balance_transaction.dart';
import 'src/resources/charge.dart';
import 'src/resources/checkout_session.dart';
import 'src/resources/coupon.dart';
import 'src/resources/customer.dart';
import 'src/resources/customer_balance_transaction.dart';
import 'src/resources/file.dart';
import 'src/resources/invoice.dart';
import 'src/resources/payment_intent.dart';
import 'src/resources/portal_session.dart';
import 'src/resources/price.dart';
import 'src/resources/product.dart';
import 'src/resources/promotion_code.dart';
import 'src/resources/refund.dart';
import 'src/resources/sigma_query_run.dart';
import 'src/resources/sigma_scheduled_query_run.dart';
import 'src/resources/subscription.dart';
import 'src/resources/subscription_item.dart';
import 'src/resources/subscription_schedule.dart';

export 'messages.dart';
export 'src/api_config.dart';
export 'src/client.dart';
export 'src/exceptions.dart';
export 'src/expanded.dart';
export 'src/webhook.dart';

/// [Stripe] is the Class that provides the Interface for external calls via the
/// Stripe API.
///
/// Create an instance of this class, and use it like this:
///
///     final stripe = Stripe('privateApiKey');
///     final charge = await stripe.charge.retrieve(chargeId);
class Stripe {
  /// Our actual client implementation that communicates with Stripe.
  ///
  /// You should not need to access this, it is mostly exposed for testing, but
  /// you can use it to make requests that have not yet been implemented.
  final Client client;

  /// https://stripe.com/docs/api/checkout/sessions
  final CheckoutSessionResource checkoutSession;

  /// https://stripe.com/docs/api/billing_portal/sessions
  final PortalSessionResource portalSession;

  /// https://stripe.com/docs/api/customers
  final CustomerResource customer;

  /// https://stripe.com/docs/api/refunds
  final RefundResource refund;

  /// https://stripe.com/docs/api/payment_intents
  final PaymentIntentResource paymentIntent;

  /// https://stripe.com/docs/api/prices
  final PriceResource price;

  /// https://stripe.com/docs/api/products
  final ProductResource product;

  /// https://stripe.com/docs/api/charges
  final ChargeResource charge;

  /// https://stripe.com/docs/api/subscriptions
  final SubscriptionResource subscription;

  /// https://stripe.com/docs/api/subscription_items
  final SubscriptionItemResource subscriptionItem;

  /// https://stripe.com/docs/api/subscription_schedules
  final SubscriptionScheduleResource subscriptionSchedule;

  /// https://stripe.com/docs/api/balance_transactions
  final BalanceTransactionResource balanceTransaction;

  /// https://docs.stripe.com/api/promotion_codes
  final PromotionCodeResource promotionCode;

  /// https://docs.stripe.com/api/coupons
  final CouponResource coupon;

  /// https://docs.stripe.com/api/invoices
  final InvoiceResource invoice;

  final CustomerBalanceTransactionResource customerBalanceTransaction;

  final SigmaQueryRunResource sigmaQueryRun;

  final SigmaScheduledQueryRunResource sigmaScheduledQueryRun;

  final FileResource file;

  factory Stripe(String apiKey) {
    final config = ApiConfig();
    final client = DioClient(apiKey: apiKey, version: config.version);
    return Stripe.withClient(client, config);
  }

  Stripe.withClient(this.client, ApiConfig config)
      : checkoutSession = CheckoutSessionResource(client, config),
        portalSession = PortalSessionResource(client, config),
        customer = CustomerResource(client, config),
        refund = RefundResource(client, config),
        paymentIntent = PaymentIntentResource(client, config),
        price = PriceResource(client, config),
        product = ProductResource(client, config),
        subscription = SubscriptionResource(client, config),
        subscriptionItem = SubscriptionItemResource(client, config),
        subscriptionSchedule = SubscriptionScheduleResource(client, config),
        charge = ChargeResource(client, config),
        balanceTransaction = BalanceTransactionResource(client, config),
        promotionCode = PromotionCodeResource(client, config),
        coupon = CouponResource(client, config),
        invoice = InvoiceResource(client, config),
        customerBalanceTransaction =
            CustomerBalanceTransactionResource(client, config),
        sigmaQueryRun = SigmaQueryRunResource(client, config),
        sigmaScheduledQueryRun = SigmaScheduledQueryRunResource(client, config),
        file = FileResource(client, config);
}
