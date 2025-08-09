import 'package:flutter/material.dart';
class add_water extends StatelessWidget {
  final int amount;
  IconData ? icon;
  final VoidCallback onClick;


   add_water({
    super.key,required this.amount, required this.onClick, this.icon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 80,
      child: ElevatedButton.icon(
        onPressed: onClick,
        icon:Icon(icon ?? Icons.water_drop,color: Colors.blue,),
        label: Text("+${amount} LTR",style: TextStyle(
            fontSize: 18
        ),),
      ),
    );
  }
}

