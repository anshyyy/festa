import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/booking/booking_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../widgets/custom_appbar.dart';
import '../core/book_tickets.dart';
import 'widgets/ticket_category_tile.dart';

class BookTicketScreen extends StatelessWidget {
  final int eventId;
  const BookTicketScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) =>
          BookingCubit(BookingState.initial(serverUrl: appConfig.serverUrl))
            ..fetchEventDetails(id: eventId),
      child: const BookTicketScreenConsumer(),
    );
  }
}

class BookTicketScreenConsumer extends StatelessWidget {
  const BookTicketScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                bottomNavigationBar: TicketBookingWidget(
                  startDate: state.event!.startDate,
                  priceRangeStart: state.event!.priceRangeStart,
                  priceRangeEnd: state.event!.priceRangeEnd!,
                  onClick: () {
                    navigator<NavigationService>()
                        .navigateTo(UserRoutes.paymentDetailsRoute);
                  },
                ),
                appBar: CustomAppBar(
                    title: 'Select Tickets',
                    leading: GestureDetector(
                        onTap: () {
                          navigator<NavigationService>().goBack();
                        },
                        child: Center(
                            child: SvgPicture.asset(AssetConstants.arrowLeft))),
                    actions: []),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          ...state.event!.eventTicketCategories.map((e) {
                            return TicketCategory(
                              categoryName: e.name,
                              categoryItems: state.earlyBirdTicketCount,
                              price: e.price,
                              onAdd: () => context
                                  .read<BookingCubit>()
                                  .addTickets(id: e.id, maxTickets: e.maxTicketsToBook),
                              onRemove: () => context
                                  .read<BookingCubit>()
                                  .removeEarlyBirdTicket(),
                            );
                          })
                          // TicketCategory(
                          //   categoryName: 'Early Bird',
                          //   categoryItems: state.earlyBirdTicketCount,
                          //   price: 4999.00,
                          //   onAdd: () => context
                          //       .read<BookingCubit>()
                          //       .addEarlyBirdTicket(),
                          //   onRemove: () => context
                          //       .read<BookingCubit>()
                          //       .removeEarlyBirdTicket(),
                          // ),
                          // SizedBox(
                          //   height: .5.h,
                          // ),
                          // TicketCategory(
                          //   categoryName: 'Standard',
                          //   categoryItems: state.standardTicketCount,
                          //   price: 4999.00,
                          //   onAdd: () => context
                          //       .read<BookingCubit>()
                          //       .addStandardTicket(),
                          //   onRemove: () => context
                          //       .read<BookingCubit>()
                          //       .removeStandardTicket(),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
