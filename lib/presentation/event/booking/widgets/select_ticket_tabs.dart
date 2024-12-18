import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/booking/booking_cubit.dart';

class SelectTicketTabs extends StatelessWidget {
  const SelectTicketTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: 100.w,
          height: 4.21.h,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF333741)),
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x0C101828),
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(state.nonEmptyIndexes.length, (index) {
                int tabIndex = state.nonEmptyIndexes[index];
                return TicketTab(
                  onTap: () => context.read<BookingCubit>().changeTab(index),
                  isSelected: index == state.selectedTab,
                  mainTabText: state.tabNames[tabIndex],
                );
              })
            ],
          ),
        );
      },
    );
  }

  Border selectedBorder() {
    return Border(
      bottom: BorderSide(width: 2, color: Color(0xFFFF1759)),
    );
  }

  Border notSelectedBorder() {
    return Border(
      left: BorderSide(
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Color(0xFF333741),
      ),
      top: BorderSide(
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Color(0xFF333741),
      ),
      right: BorderSide(
        width: 1,
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Color(0xFF333741),
      ),
      bottom: BorderSide(
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Color(0xFF333741),
      ),
    );
  }
}

class TicketTab extends StatelessWidget {
  final bool isSelected;
  final String mainTabText;
  final VoidCallback onTap;
  const TicketTab(
      {super.key,
      required this.isSelected,
      required this.mainTabText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 4.21.h,
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
          decoration: BoxDecoration(
              //  color: Color(0xFF171717),
              border: isSelected
                  ? Border(
                      bottom: BorderSide(width: 2, color: Color(0xFFFF1759)),
                    )
                  : Border(
                      left: BorderSide(
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF333741),
                      ),
                      top: BorderSide(
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF333741),
                      ),
                      right: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF333741),
                      ),
                      bottom: BorderSide(
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF333741),
                      ),
                    )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                mainTabText,
                style: TextStyle(
                  color: Color(0xFFCECFD2),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0.10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
