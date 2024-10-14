/// A container that always contains [id] and contains [expanded] only if the
/// object was queried with the `expand` option.
///
/// Expanding Stripe API responses: https://docs.stripe.com/expand
class Expandable<T> {
  final String id;
  final T? expanded;

  const Expandable({
    required this.id,
    this.expanded,
  });
}

/// A container that always contains [ids] and contains [expanded] only if the
/// list was queried with the `expand` option.
///
/// Expanding Stripe API responses: https://docs.stripe.com/expand
class ExpandableList<T> {
  final List<String> ids;
  final List<T>? expanded;

  const ExpandableList({
    required this.ids,
    this.expanded,
  });
}
