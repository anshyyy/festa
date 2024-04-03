import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/auth/edit_profile/edit_profile_cubit.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../widgets/custom_appbar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => EditProfileCubit(
          EditProfileState.initial(appStateNotifier: appStateNotifier)),
      child: const EditProfileScreenConsumer(),
    );
  }
}

class EditProfileScreenConsumer extends StatelessWidget {
  const EditProfileScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar:CustomAppBar(title: EditProfileScreenConstants.editProfile, leading: GestureDetector(
                onTap: () {
                  navigator<NavigationService>().goBack();
                },
                child:
                    Center(child: SvgPicture.asset(AssetConstants.arrowLeft))), actions: const []),
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Container(
                  width: 60.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: .1.w,
                        color: Theme.of(context).colorScheme.background,
                      )),
                  child: Center(
                    child: SvgPicture.asset(
                      AssetConstants.editIcon,
                      height: 3.h,
                    ),
                  ),
                ),
              ),
              const Center()
            ],
          )),
        );
      },
    );
  }
}
