import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
            ),
            SizedBox(width: 15.0),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.camera_alt)),
              onPressed: () {
                print("hdd");
              }),
          IconButton(
              icon: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.edit)),
              onPressed: () {
                print("hdd");
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey[200],
                height: 40,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index)=>billdStorysItem(),
                  separatorBuilder: (context, index)=>SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
               ListView.separated(
                 physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index)=>billdchatsItem(),
                    separatorBuilder: (context,index)=> SizedBox(height: 20.0,),
                    itemCount: 20
                ),
            ],
          ),
        ),
      ),
    );
  }


  Widget billdchatsItem()=>Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.greenAccent[400],
            ),
          ),
        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gamal Ahmed",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                      "skndk  ksndlkmsdk ksndkskd skndk  ksndlkmsdk ksndkskd skndk  ksndlkmsdk ksndkskd",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text("20:9:32 PM")
              ],
            )
          ],
        ),
      )
    ],
  );
  Widget billdStorysItem()=>Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.greenAccent[400],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          "Gamal Ahmed Elsayed ",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
