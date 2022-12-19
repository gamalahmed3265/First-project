import 'package:flutter/material.dart';

class UserModel
{
  final int id;
  final String name;
  final String phone;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.phone
  });

}
class userscreen extends StatelessWidget{

  List<UserModel> users=[
    UserModel(
      id: 832832,
      name: "Gamal sndsn",
      phone: '394394834'
    ),
    UserModel(
        id: 2049030,
        name: "mo sddkdk",
        phone: '3430350'
    ),
    UserModel(
        id: 35345,
        name: "dlsldls",
        phone: '095895604'
    ),
    UserModel(
        id: 34324324,
        name: "dlfkldskfln",
        phone: '4385349895034'
    ),
    UserModel(
        id: 6436456,
        name: "lskdfdkl",
        phone: '35093589034'
    ),
    UserModel(
        id: 35345,
        name: "kldjfwoif",
        phone: '3459305309'
    ),
    UserModel(
        id: 4564356,
        name: "jdfoafo",
        phone: '394908349589'
    ),
    UserModel(
        id: 3543534,
        name: "dlksddsck",
        phone: '5464644654'
    ),
    UserModel(
        id: 565456,
        name: "klvdldsmkvdf",
        phone: '5656765767'
    ),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('sdskdm'),
      ),
      body: ListView.separated(
          itemBuilder: (context ,index)=>bildUserItem(users[index]),
          separatorBuilder: (context ,index)=> Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
          itemCount: users.length
      ),
    );
  }


Widget bildUserItem(UserModel user)=> Padding(
  padding: const EdgeInsets.only(top:20.0,
    left:20.0,
    bottom: 10.0,
    right:20.0,
  ),
  child: Row(
    children: [
      CircleAvatar(
        radius: 25.5,
        child:Text(
          '${user.id}',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      SizedBox(width: 20.0,),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${user.name}',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20
            ),
          ),
          Text(
            '${user.phone}',
            style: TextStyle(
            ),
          ),
        ],
      ),
    ],
  ),
);
}