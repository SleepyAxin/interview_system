import 'package:flutter/material.dart';

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
    const Text('摄像头'),
    const Text('设置'),
  ];

  void _onItemTapped(int index) 
  {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) => Scaffold
  (
    appBar: AppBar(title: const Text('Flutter Demo')),
    drawer: Drawer
    (
      child: ListView
      (
        padding: EdgeInsets.zero,
        children: <Widget>
        [
          const DrawerHeader
          (
            decoration: BoxDecoration(color: Colors.blue),
            child: Text
            (
              '侧边栏标题',
              style: TextStyle
              (
                color: Colors.white,
                fontSize: 24,
              )
            )
          ),
          ListTile
          (
            leading: const Icon(Icons.home),
            title: const Text('首页'),
            onTap: () 
            {
              _onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          ListTile
          (
            leading: const Icon(Icons.camera),
            title: const Text('摄像头'),
            onTap: () 
            {
              _onItemTapped(1);
              Navigator.pop(context);
            },
          ),
          ListTile
          (
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            onTap: () 
            {
              _onItemTapped(2);
              Navigator.pop(context);
            }
          )
        ]
      )
    ),
    body: Center
    (
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar
    (
      items: const <BottomNavigationBarItem>
      [
        BottomNavigationBarItem
        (
          icon: Icon(Icons.home),
          label: '首页',
        ),
        BottomNavigationBarItem
        (
          icon: Icon(Icons.camera),
          label: '摄像头',
        ),
        BottomNavigationBarItem
        (
          icon: Icon(Icons.settings),
          label: '设置',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    )
  );
}