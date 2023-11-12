import 'package:flutter/material.dart';

import '../widget/profilesummerycard.dart';
import '../widget/summerycard.dart';
import '../widget/taskitemcard.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           ProfileSummeryCard(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    SummeryCard(
                      count: '120',
                        title: 'New',
                    ),
                    SummeryCard(
                      count: '120',
                      title: 'Progress',
                    ),
                    SummeryCard(
                      count: '20',
                      title: 'Complete',
                    ),
                    SummeryCard(
                      count: '120',
                      title: 'Canceled',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context,index){
                  return TaskItemCard();
                }))
          ],
        ),
      )
    );
  }
}





