import 'package:flutter/material.dart';

import '../widget/profilesummerycard.dart';
import '../widget/taskitemcard.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
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
