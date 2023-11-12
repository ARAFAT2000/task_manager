import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16,horizontal: 6),
      child: Padding(
        padding: const EdgeInsets.only(left: 16,top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title here',style: Theme.of(context).textTheme.titleSmall,),
            Text('Description write now'),
            Text('11-12-2023'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                    backgroundColor: Colors.blueAccent,
                    label: Text('New')),
                Wrap(

                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_sharp)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}