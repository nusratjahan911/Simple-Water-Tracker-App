import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practiceall/Module_11/class-3/widget/add_waterbutton.dart';
class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {

  int currentInTake = 0;
  final int goal = 10000;
  Timer ? _timer;

  ///for set timer

  ///For set timer in the water tank
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      print(timer.tick);
      if(currentInTake > 0){
        setState((){
          currentInTake = (currentInTake - 1).clamp(0, goal);
        });
      }

    });
  }


  ///For Adding water into tank
  void waterAdd(int amount){
    setState(() {
      currentInTake = (currentInTake + amount).clamp(0, goal);
    });
  }

  ///clear water into tank
  void clearTank(){
    setState(() {
      currentInTake = 0;
    });
  }



  @override
  Widget build(BuildContext context) {
    double progress = (currentInTake/goal).clamp(0, 1);
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Water Tracker App'),
      ),
      backgroundColor: Colors.cyan[100],
      body: Column(
          children: [
            SizedBox(height: 30),
              Center(
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent[100],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: Colors.blue
                    ),
                    boxShadow:[
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2
                      )],
                  ),
                    child: Column(
                      children: [
                        Text("Today's InTank",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                        SizedBox(height: 20),
                        Text("${currentInTake} LTR",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),)
                      ],
                    )

                ),
              ),
            SizedBox(height: 40),
            ///Use for Progress Bar
            ///0-1   |  0.1 - 10% | 0.5 = 50%
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blueGrey,
                    color: Colors.blue,
                    value: progress, ///persentage of progress bar
                    strokeWidth: 20,///thikness of the line

                  ),
                ),
                Text("${(progress*100).toInt()}%",
                  style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),)
              ],

            ),
            SizedBox(height: 40),
            Wrap(
              spacing: 20,
                runSpacing: 20,
                children: [
                  add_water(amount: 300, onClick: ()=> waterAdd(300),icon: Icons.water_drop,),
                  add_water(amount: 500, onClick: ()=> waterAdd(500),icon: Icons.local_drink,),
                  add_water(amount: 1000, onClick: ()=> waterAdd(1000),icon: Icons.local_drink_outlined),
                  add_water(amount: 2000, onClick: ()=> waterAdd(2000),icon: Icons.water_drop_outlined,)
                ],
              ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                    onPressed: ()=> clearTank(), child: Text("Reduce Water",style: TextStyle(color: Colors.red),)),
              ),
            )


          ],
        ),

    );
  }
}


