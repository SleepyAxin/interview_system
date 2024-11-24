import 'package:flutter/material.dart';
import 'package:interview_system/InterviewPage.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>
  [
    const Text('首页'),
    const InterviewPage(),
    const Text('日志'),
    const Text('评价')
  ];

  void _onItemTapped(int index) 
  {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) => Scaffold
  (
    appBar: AppBar(title: const Text('Flutter Demo')),
    body: Center
    (
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar
    (
      items: const <BottomNavigationBarItem>
      [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.camera),label: '面试'),
        BottomNavigationBarItem(icon: Icon(Icons.book),label: '日志'),
        BottomNavigationBarItem(icon: Icon(Icons.star),label: '评价')
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      selectedLabelStyle: const TextStyle(color: Colors.blue),
      onTap: _onItemTapped,
    ),
  );
}