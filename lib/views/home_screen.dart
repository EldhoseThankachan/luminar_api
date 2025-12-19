import 'package:api_december_2025/models/User.dart';
import 'package:api_december_2025/services/apiServices.dart';
import 'package:api_december_2025/services/userServices.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();

  UserServices userServices = UserServices();
  User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    User? user = await userServices.getUser();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              userServices.logout();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: _user == null ? CircularProgressIndicator():Column(
          children: [
            Text("${_user?.id}"),
            Text("${_user?.name}"),
            Text("${_user?.email}"),
            Text("${_user?.place}"),

          ],
        )
      ),
    );
  }
}
