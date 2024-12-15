import 'package:flutter/material.dart';
class Addtodo extends StatefulWidget {

  void Function({required String todoText}) changeText;
   Addtodo({super.key, required this.changeText});

  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  TextEditingController todoText= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Add Todo', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        TextField(
          controller: todoText,
          decoration: const InputDecoration(
            hintText: 'write your todo here...',
            contentPadding: EdgeInsets.all(8),

          ),
        ),
        const SizedBox(height: 10,),
        Container(
          width: 150,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple
            ),
              onPressed: (){
              if(todoText.text!=""){
                widget.changeText(todoText:todoText.text);
              }
                todoText.text="";
                print(todoText.text);


              },
              child: const Text('Add', style: TextStyle(fontSize: 20 , color: Colors.white),)
          ),
        )
      ],
    );
  }
}
