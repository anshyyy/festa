import 'package:flutter/material.dart';

class LocationTabScreen extends StatelessWidget {
  const LocationTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
          return const Row(
            children: [
             Icon(Icons.location_on,size: 24,color: Colors.white,),
              const SizedBox(width: 20,),
              Text("Koramangala, Bangalore",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),)
            ],
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