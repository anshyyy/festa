// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:shimmer/shimmer.dart';

// import '../../application/ticket/ticket_cubit.dart';
// import '../../domain/core/constants/string_constants.dart';
// import 'history_tickets/history_ticket_screen.dart';
// import 'upcoming_tickets/upcoming_ticket_screen.dart';

// class TicketScreen extends StatelessWidget {
//   const TicketScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const TicketScreenConsumer();
//   }
// }

// class TicketScreenConsumer extends StatelessWidget {
//   const TicketScreenConsumer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<TicketCubit, TicketState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return SingleChildScrollView(
//           physics: const NeverScrollableScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(
//                   top: 6.h,
//                   bottom: 2.h,
//                 ),
//                 color: Theme.of(context).colorScheme.surface,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 1.5.h,
//                     ),
//                     Text(
//                       TicketScreenConstants.yourTickets,
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 24.sp,
//                             color: Theme.of(context).colorScheme.background,
//                           ),
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
                            // context
                            //     .read<TicketCubit>()
                            //     .showTicketHistory(flag: false);
//                           },
//                           child: Container(
//                             height: 4.h,
//                             padding: EdgeInsets.symmetric(horizontal: 3.w),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: LinearGradient(
//                                 colors: !state.showTicketHistory
//                                     ? [
//                                         Theme.of(context).colorScheme.primary,
//                                         Theme.of(context).colorScheme.secondary,
//                                       ]
//                                     : [
//                                         Theme.of(context)
//                                             .colorScheme
//                                             .primaryContainer,
//                                         Theme.of(context)
//                                             .colorScheme
//                                             .primaryContainer,
//                                       ],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                               ),
//                             ),
//                             child: Center(
//                               child: Text(TicketScreenConstants.upcomingBtnText,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall!
//                                       .copyWith(
//                                           color: Theme.of(context)
//                                               .colorScheme
//                                               .background,
//                                           fontWeight: FontWeight.w600)),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 2.w,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             context
//                                 .read<TicketCubit>()
//                                 .showTicketHistory(flag: true);
//                           },
//                           child: Container(
//                             height: 4.h,
//                             padding: EdgeInsets.symmetric(horizontal: 3.w),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: LinearGradient(
//                                 colors: state.showTicketHistory
//                                     ? [
//                                         Theme.of(context).colorScheme.primary,
//                                         Theme.of(context).colorScheme.secondary,
//                                       ]
//                                     : [
//                                         Theme.of(context)
//                                             .colorScheme
//                                             .primaryContainer,
//                                         Theme.of(context)
//                                             .colorScheme
//                                             .primaryContainer,
//                                       ],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                               ),
//                             ),
//                             child: Center(
//                               child: Text(TicketScreenConstants.historyBtnText,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall!
//                                       .copyWith(
//                                           color: Theme.of(context)
//                                               .colorScheme
//                                               .background,
//                                           fontWeight: FontWeight.w600)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: .7.h,
//               ),
//               state.isLoading
//                   ? const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: TicketShimmer(),
//                     )
//                   :AnimatedSwitcher(
//                           duration: const Duration(milliseconds: 500),
//                           child: !state.showTicketHistory
//                               ? const UpcomingTicketsScreen()
//                               : const HistoryTicketScreen(),
//                         ),
//               SizedBox(
//                 height: 4.h,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class TicketShimmer extends StatelessWidget {
//   const TicketShimmer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // final themeData = Theme.of(context);
// // final colorScheme = themeData.colorScheme;
// // final textTheme = themeData.textTheme;

//     return Shimmer.fromColors(
//       baseColor: Colors.grey[300]!.withOpacity(0.5),
//       highlightColor: Colors.grey[400]!.withOpacity(0.5),
//       child: Container(
//         height: 70.h,
//         width: 100.w,
//         color: Colors.grey,
//       ),
//     );
//   }
// }
