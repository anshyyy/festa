import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../infrastructure/auth/dtos/user_dto.dart';
import 'widgets/user_card.dart';

class UserTabScreen extends StatelessWidget {
  final List<UserDto>users;
  const UserTabScreen({super.key,required this.users});

  @override
  Widget build(BuildContext context) {
     return Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16),
        child: users.isEmpty?
        
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Icon(Icons.sentiment_dissatisfied,
                        size: 80.px, color: Colors.grey),
                    SizedBox(height: 1.5.h),
           const Text(
              'No Users Found!!!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),)
        
        :
        
        
        
        
        
        ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
          return  UserCard(
            id:users[index].id,
            email: users[index].email??"null",
            fullName: users[index].fullName,
            profileImage: users[index].profileImage,
          );
        }, separatorBuilder: (BuildContext context, int index) {  

           return const Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10),
             child: Divider(
                 height: 2,
                 color: Color(0xff171717),
             )
           );     
          
        },)
      );
  }
}