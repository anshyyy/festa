import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/ticket/ticket_cubit.dart';
import '../../domain/core/constants/string_constants.dart';
import '../widgets/gradient_button.dart';
import 'history_tickets/history_ticket_screen.dart';
import 'upcoming_tickets/upcoming_ticket_screen.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicketCubit(),
      child: const TicketScreenConsumer(),
    );
  }
}

class TicketScreenConsumer extends StatelessWidget {
  const TicketScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          TicketScreenConstants.yourTickets,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontSize: 24.sp,
                                color:
                                    Theme.of(context).colorScheme.background,
                              ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientButton(
                              text: TicketScreenConstants.upcomingBtnText,
                              onTap: () {
                                context
                                    .read<TicketCubit>()
                                    .showTicketHistory(flag: false);
                              },
                              height: 4.h,
                              width: 22.w,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            GradientButton(
                              text: TicketScreenConstants.historyBtnText,
                              onTap: () {
                                context
                                    .read<TicketCubit>()
                                    .showTicketHistory(flag: true);
                              },
                              height: 4.h,
                              width: 20.w,
                              gradientColor1: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              gradientColor2: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: !state.showTicketHistory
                          ? const UpcomingTicketsScreen()
                          : HistoryTicketScreen(),
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                              5,
                              (dotIndex) => Padding(
                                    padding: EdgeInsets.all(.7.w),
                                    child: Container(
                                      height: 1.5.h,
                                      width: 1.5.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: dotIndex == 1
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .background
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .secondaryContainer),
                                    ),
                                  )),
                    ),
                     SizedBox(
                      height: 4.h,
                    ),
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
