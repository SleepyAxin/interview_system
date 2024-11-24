import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class CameraView extends StatefulWidget 
{
  const CameraView({ super.key });

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> 
{
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();

  @override
  void initState() 
  {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async 
  {
    try 
    {
      await _localRenderer.initialize();
      final stream = await navigator.mediaDevices.getUserMedia({'video': true, 'audio': false});
      if (mounted) { setState(() => _localRenderer.srcObject = stream); }
    } 
    catch (e) { debugPrint("Camera error: $e"); }
  }

  @override
  void dispose() 
  {
    _localRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(child: RTCVideoView(_localRenderer));
}
