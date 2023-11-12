import 'package:flutter/material.dart';

import '../widget/profilesummerycard.dart';
import '../widget/taskitemcard.dart';

class CanceledScreen extends StatefulWidget {
  const CanceledScreen({super.key});

  @override
  State<CanceledScreen> createState() => _CanceledScreenState();
}

class _CanceledScreenState extends State<CanceledScreen> {
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
