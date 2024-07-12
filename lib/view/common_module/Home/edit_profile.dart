import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';



class EditProfileClass extends StatefulWidget {
  @override
  _EditProfileClassState createState() => _EditProfileClassState();
}

class _EditProfileClassState extends State<EditProfileClass> {
  ValueNotifier<bool> isDialOpen = ValueNotifier<bool>(false); // Use ValueNotifier

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 272,
            height: 168,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.indigo,
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.save),
              backgroundColor: Colors.green,
              label: 'Save',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                // Add your save logic here
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.library_add_check),
              backgroundColor: Colors.orange,
              label: 'Add',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                // Add your add logic here
              },
            ),
            // Add more SpeedDialChild widgets for additional options
          ],
          openCloseDial: isDialOpen,
          onPress: () {
            setState(() {
              isDialOpen.value = !isDialOpen.value;
            });
          },
        ),
      ),
    );
  }
}
