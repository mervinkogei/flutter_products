import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
             const SizedBox(height: 20.0),
            Card(
              elevation: 8,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  "Login",
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.green.shade800,
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 50,),
               Card(
              elevation: 8,
              child: ListTile(
                leading: Icon(Icons.location_pin),
                title: Text(
                  "Addresses",
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.green.shade800,
                ),
                onTap: () {},
              ),
            ),
               Card(
              elevation: 8,
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text(
                  "Support",
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.green.shade800,
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 20,),
            Text("Languages-Langue"),
            SizedBox(height: 10,),
               Card(
              elevation: 8,
              child: ListTile(
                title: Text(
                  "English",
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.green.shade800,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
