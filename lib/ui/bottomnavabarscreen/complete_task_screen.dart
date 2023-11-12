import 'package:flutter/material.dart';

import '../widget/profilesummerycard.dart';
import '../widget/taskitemcard.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ProfileSummeryCard(),

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
