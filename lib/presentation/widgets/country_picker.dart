import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/country/country_picker_cubit.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import 'custom_textfield.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryPickerCubit(CountryPickerState.initial()),
      child: const CountryPickerConsumer(),
    );
  }
}

class CountryPickerConsumer extends StatelessWidget {
  const CountryPickerConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryPickerCubit, CountryPickerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 80.h,
          margin: EdgeInsets.all(6.sp),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              color: Theme.of(context).colorScheme.surface),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.w,
                width: 7.w,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: GestureDetector(
                    onTap: () {
                      navigator<NavigationService>().goBack();
                    },
                    child: SvgPicture.asset(AssetConstants.closeIcon),
                  ),
                ),
              ),
              SizedBox(height: 4.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: CustomTextField(
                  fillColor: Theme.of(context).colorScheme.onBackground,
                  borderRadius: 10,
                  height: 15.w,
                  hintTextStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16.sp),
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16.sp),
                  hintText: 'Search for your country',
                  suffixIcon: const Icon(Icons.clear),
                  onChanged: (value) {
                    context
                        .read<CountryPickerCubit>()
                        .searchCountry(keyword: value);
                  },
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 0.05,
                          height: 0.sp,
                        );
                      },
                      itemCount: state.tempCountryList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if ((index == 0 ||
                                    (state.tempCountryList[index - 1]['name']
                                            .toString()
                                            .split('')
                                            .first !=
                                        state.tempCountryList[index]['name']
                                            .toString()
                                            .split('')
                                            .first)) &&
                                index != 0)
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 30.sp,
                                width: double.maxFinite,
                                color: Colors.white.withOpacity(.15),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Text(
                                    state.tempCountryList[index]['name']
                                        .toString()
                                        .split('')
                                        .first,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ),
                              ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context, [
                                state.tempCountryList[index]['dial_code'],
                                state.tempCountryList[index]['locale']
                              ]),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 5.0.w,
                                  bottom: 5.w,
                                  left: 5.w,
                                  right: 5.w,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 60.w,
                                      child: Text(
                                        state.tempCountryList[index]['name']
                                            .toString(),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      state.tempCountryList[index]['dial_code']
                                          .toString(),
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }))
            ],
          ),
        );
      },
    );
  }
}
