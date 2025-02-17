import 'package:flutter/material.dart';
import 'package:netrasaarthi/constants/routes.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isTalkbackOn = false;
  bool isSound = false;
  bool isVibrate = false;
  bool isVisibleEnhancements = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              MainPageRoute,
              (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Settings'),
        backgroundColor: Color(0xFF003366),
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xFFE5D9D9),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildSection(
                'NOTIFICATIONS',
                [
                  _buildToggleButton('SOUND', isSound, (value) {
                    setState(() => isSound = value);
                  }),
                  _buildToggleButton('VIBRATE', isVibrate, (value) {
                    setState(() => isVibrate = value);
                  }),
                ],
              ),
              SizedBox(height: 20),
              _buildSection(
                'ACCESSIBILITY',
                [
                  _buildToggleButton(
                      'VISIBLE ENHANCEMENTS', isVisibleEnhancements, (value) {
                    setState(() => isVisibleEnhancements = value);
                  }),
                ],
              ),
              SizedBox(height: 20),
              _buildSection(
                'TALKBACK',
                [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() => isTalkbackOn = true);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: isTalkbackOn
                                  ? Colors.grey[300]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(child: Text('ON')),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() => isTalkbackOn = false);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: !isTalkbackOn
                                  ? Colors.grey[300]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(child: Text('OFF')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildSection(
                'SECURITY',
                [
                  _buildButton('QUESTION'),
                  SizedBox(height: 8),
                  _buildButton('PIN'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xFF003366),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildToggleButton(
      String text, bool value, void Function(bool) onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Color(0xFF003366),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text),
    );
  }
}

// Navigation Example
void navigateToSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SettingsPage()),
  );
}
