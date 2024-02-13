import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/booking/booking_cubit.dart';
import 'widgets/ticket_category_tile.dart';

class BookTicketScreen extends StatelessWidget {
  const BookTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(),
      child: BookTicketScreenConsumer(),
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
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TicketCategory(
                    categoryName: 'Early Bird',
                    categoryItems: state.earlyBirdTicketCount,
                    price: 4999.00,
                    onAdd: () =>
                        context.read<BookingCubit>().addEarlyBirdTicket(),
                    onRemove: () =>
                        context.read<BookingCubit>().removeEarlyBirdTicket(),
                  ),
                  SizedBox(height: 1.h,),
                  TicketCategory(
                    categoryName: 'Standard',
                    categoryItems: state.standardTicketCount,
                    price: 4999.00,
                     onAdd: () =>
                        context.read<BookingCubit>().addStandardTicket(),
                    onRemove: () =>
                        context.read<BookingCubit>().removeStandardTicket(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
