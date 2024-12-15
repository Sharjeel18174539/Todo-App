import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/routes/addTodo.dart';
import 'package:todoapp/routes/profile.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String text="Simple Text";

  List<String> todoList=[];

  _launchURLApp() async {
    var url = Uri.parse("https://www.geeksforgeeks.org/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void changeText({required String todoText}){
    if(todoList.contains(todoText)){
      showDialog(context: context, builder: (context){
        return const AlertDialog(
          title: Text('Already exist'),
          content: Text('This Item is already exists'),
        );
      });
      return;
    }
    setState(() {
      todoList.insert(0, todoText);
    });
    localData();
    Navigator.pop(context);
  }

  Future<void> localData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// Save an list of strings to 'items' key.
    await prefs.setStringList('todoList', todoList);
  }

  Future<void> loadPrevData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todoList = (prefs.getStringList('todoList') ?? []).toList();
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadPrevData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Todo App'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  showModalBottomSheet(context: context, builder: (context){
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        height: 250,
                        color: Colors.white,
                        child: Addtodo(changeText: changeText,),
                      ),
                    );
                  });
                },
                child: const FaIcon(FontAwesomeIcons.plus,
                size: 30,
                  color: Colors.deepPurple,
                ),
              ),
            ),

          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child:Text('S',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                  accountName: Text('Md Sharjeel Farooqui'),
                  accountEmail: Text('sharjeelfarooqui19@gmail.com'),
              ),
              ListTile(
                leading: const FaIcon(FontAwesomeIcons.person, color: Colors.deepPurple, size: 30,),
                title: const Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>const ProfilePage()));
                },
                trailing: const FaIcon(FontAwesomeIcons.forward),
              ),
              // ListTile(
              //   title: const Text('Lets Connect'),
              //   trailing: IconButton(onPressed: _launchURLApp,
              //       icon: const FaIcon(FontAwesomeIcons.linkedin)),
              // )
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index){
          return ListTile(
            onTap: (){
              showModalBottomSheet(context: context, builder: (context){
                return Container(
                  width: 500,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple
                    ),
                      onPressed: (){
                      setState(() {
                        todoList.removeAt(index);
                      });
                      localData();
                      Navigator.pop(context);
                        print('remove');
                      },
                      child: const Text('Marked as done', style: TextStyle(fontSize: 20, color: Colors.white),)
                  ),
                );
              });
            },
            title:Text(todoList[index], style: const TextStyle(fontSize: 20),),
          );
        })
      ),
    );
  }
}



