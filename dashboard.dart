
import 'package:flutter/material.dart';
import 'package:project/verified.dart';

import 'listview.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
        title: Text(
          'Hello Timmy',
          style: TextStyle(
              fontFamily: 'Barlow Semi Condensed',
              color: Color.fromRGBO(50, 41, 57, 1),
              fontWeight: FontWeight.w900,
              fontSize: 24),
        ),
        backgroundColor: Color.fromRGBO(201, 199, 126, 1),
      
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Handle search action
          },
        ),
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            // Handle profile action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}



class VerticalListItem {
  final String title;
  final List<HorizontalListItem> horizontalList;

  VerticalListItem({required this.title, required this.horizontalList});
}

class HorizontalListItem {
  final String avatar;

  HorizontalListItem({required this.avatar});
}

class Dashboard extends StatelessWidget {
  final List<VerticalListItem> verticalList = [
    VerticalListItem(
      title: 'Dyners',
      horizontalList: [
        HorizontalListItem(avatar: 'assets/images/burger.jpg'),
        HorizontalListItem(avatar: 'assets/images/chipsmasala.jpg'),
        HorizontalListItem(avatar: 'assets/images/croque.jpg'),
      ],
    ),
    VerticalListItem(
      title: 'Meze Fresh',
      horizontalList: [
        HorizontalListItem(avatar: 'assets/images/tacos.jpg'),
        HorizontalListItem(avatar: 'assets/images/burrito.jpg'),
        HorizontalListItem(avatar: 'assets/images/chicken.jpg'),
      ],
    ),

    VerticalListItem(
      title: 'Davids Popcorn Place',
      horizontalList: [
        HorizontalListItem(avatar: 'assets/images/Rice.jpg'),
        HorizontalListItem(avatar: 'assets/images/popcorn.jpg'),
        HorizontalListItem(avatar: 'assets/images/rice2.jpg'),
      ],
    ),
  ];


   Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(201, 199, 126, 1),
        ),
      backgroundColor: Color.fromRGBO(201, 199, 126, 1),
      body:

      ListView.builder(

        itemCount: verticalList.length,
        itemBuilder: (context, index) {
          final verticalItem = verticalList[index];
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Text(verticalItem.title),
                const Divider(
                            height: 15,
                            //thickness: 3,
                          ),
                SizedBox(
                  height: 100,
                  
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: verticalItem.horizontalList.length,
                    itemBuilder: (context, subIndex) {
                      final horizontalItem = verticalItem.horizontalList[subIndex];
                      return InkWell(
                        onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckOrder()));
                  },
          
                        
                          child: Row(
                            
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                  
                                  child: CircleAvatar(backgroundImage: AssetImage(horizontalItem.avatar) ,
                                  radius: 55)
                                  
                                                  ),
                                ],
                              ),
                            ],
                          
                          )
                      );
                        
                    },
                ),
              ),
            ],
          ),
        );
      },
    )
    );
    
 
  }
}
