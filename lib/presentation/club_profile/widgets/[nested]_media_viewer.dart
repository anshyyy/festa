import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import 'media_grid_widget.dart';

// With Nested Grid View 
class MediaViewer extends StatelessWidget {
  const MediaViewer({super.key});
 final List<String> images = const[
    'https://plus.unsplash.com/premium_photo-1683129651802-1c7ba429a137?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1556035511-3168381ea4d4?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1570872626485-d8ffea69f463?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1566417713940-fe7c737a9ef2?q=80&w=2858&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1566417713940-fe7c737a9ef2?q=80&w=2858&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
     'https://plus.unsplash.com/premium_photo-1683129651802-1c7ba429a137?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1556035511-3168381ea4d4?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1570872626485-d8ffea69f463?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
     'https://plus.unsplash.com/premium_photo-1683129651802-1c7ba429a137?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1556035511-3168381ea4d4?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1570872626485-d8ffea69f463?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
     'https://plus.unsplash.com/premium_photo-1683129651802-1c7ba429a137?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1556035511-3168381ea4d4?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1570872626485-d8ffea69f463?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1566417713940-fe7c737a9ef2?q=80&w=2858&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: 100.h,
          child: NestedScrollView(headerSliverBuilder:(context, innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.amber.withOpacity(0),
                flexibleSpace: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Images', style: Theme.of(context).textTheme.bodySmall,),
                      Text('Videos', style: Theme.of(context).textTheme.bodySmall,),
                      Text('Events', style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                )
              )
            ];
          }, body: MediaGridViewer(
                          images: images,
                          crossAxisCount: 3,
                          mainAxisSpacing: 2.5.w,
                          crossAxisSpacing: 1.h,
                          quiltedPattern: const [
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ])),
        );
        },
    );
  }
}
