import 'package:flutter/material.dart';
import 'package:interview_system/Component/CameraView.dart';

class InterviewPage extends StatefulWidget 
{
  const InterviewPage({ super.key });

  @override
  State<InterviewPage> createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> 
{
  @override
  Widget build(BuildContext context) => const Scaffold
  (
    body: Center
    (
      child: CameraView()
    )
  );
}