import 'package:json_annotation/json_annotation.dart';

enum PauseCollectionBehavior {
  @JsonValue('keep_as_draft')
  keepAsDraft,
  @JsonValue('mark_uncollectible')
  markUncollectible,
  @JsonValue('void')
  voided,
}
