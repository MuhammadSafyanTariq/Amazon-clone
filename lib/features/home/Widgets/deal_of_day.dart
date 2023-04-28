import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:velocity_x/velocity_x.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            top: 15,
            left: 10,
          ),
          child: const Text(
            'Deal of the Day',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1601524909162-ae8725290836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text(
            '\$100',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.fromLTRB(15, 5, 40, 0),
          child: Text(
            'Safyan',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1601524909162-ae8725290836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1601524909162-ae8725290836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1601524909162-ae8725290836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1601524909162-ae8725290836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1601524909162-ae8725290836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1601524909162-ae8725290836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
            alignment: Alignment.topLeft,
            child: 'See all deals'.text.color(Colors.cyan[400]).make())
      ],
    );
  }
}
