import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancellation_policy.freezed.dart';
part 'cancellation_policy.g.dart';

@freezed
class CancellationPolicy with _$CancellationPolicy {
  const factory CancellationPolicy({
    required String intro,
    required List<PolicyDetail> policyDetails,
    required String acknowledgment,
    required String note,
  }) = _CancellationPolicy;

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) => _$CancellationPolicyFromJson(json);

  static CancellationPolicy defaultValue() => CancellationPolicy(
        intro: "We strive to provide a seamless and transparent experience for all our users. While we understand that plans can change, please note that Festa does not support cancellations, transfers, or refunds for bookings made through our platform.",
        policyDetails: [
          PolicyDetail(
            title: "All Sales Are Final",
            description: "Once a booking is confirmed, it cannot be canceled, transferred, or refunded under any circumstances."
          ),
          PolicyDetail(
            title: "Non-Transferable Tickets",
            description: "Bookings are tied to the account and identity of the user. They cannot be transferred to another person or account."
          ),
          PolicyDetail(
            title: "No Refunds for No-Show",
            description: "If you are unable to attend the event, refunds or adjustments will not be processed."
          ),
          PolicyDetail(
            title: "Event Changes by Organizers",
            description: "In case of unforeseen changes to the event (e.g., rescheduling, change in lineup), refunds will not be issued. However, we will keep you informed about all updates."
          ),
          PolicyDetail(
            title: "Force Majeure",
            description: "Events impacted by circumstances beyond control (e.g., weather, strikes, or government regulations) are non-refundable, in line with the policies of the event organizers."
          ),
          PolicyDetail(
            title: "Transparent Details Pre-Booking",
            description: "All event details, including venue policies, entry requirements, and timing, are shared upfront to help users make informed decisions before booking."
          ),
          PolicyDetail(
            title: "Support Assistance",
            description: "While cancellations are not allowed, our support team is available to address any concerns or provide guidance related to your booking."
          ),
        ],
        acknowledgment: "By proceeding with a booking on Festa, you acknowledge and accept these terms. We encourage users to review event details carefully before confirming a reservation.",
        note: "House Rules Apply*",
      );
}

@freezed
class PolicyDetail with _$PolicyDetail {
  const factory PolicyDetail({
    required String title,
    required String description,
  }) = _PolicyDetail;

  factory PolicyDetail.fromJson(Map<String, dynamic> json) => _$PolicyDetailFromJson(json);
}
