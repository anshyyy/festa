import 'package:flutter/material.dart';

class GenderSelectionBottomSheet extends StatefulWidget {
  @override
  _GenderSelectionBottomSheetState createState() => _GenderSelectionBottomSheetState();
}

class _GenderSelectionBottomSheetState extends State<GenderSelectionBottomSheet> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _isExpanded ? 300 : 200, // Adjust these values as needed
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Select Gender'),
            trailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Men'),
            onTap: () {
              // Handle selection
              Navigator.pop(context, 'Men');
            },
          ),
          ListTile(
            title: Text('Women'),
            onTap: () {
              // Handle selection
              Navigator.pop(context, 'Women');
            },
          ),
          ExpansionTile(
            title: Text('Other'),
            onExpansionChanged: (expanded) {
              setState(() {
                _isExpanded = expanded;
              });
            },
            children: [
              ListTile(
                title: Text('Non-binary'),
                onTap: () {
                  // Handle selection
                  Navigator.pop(context, 'Non-binary');
                },
              ),
              ListTile(
                title: Text('Transgender'),
                onTap: () {
                  // Handle selection
                  Navigator.pop(context, 'Transgender');
                },
              ),
              ListTile(
                title: Text('Prefer not to say'),
                onTap: () {
                  // Handle selection
                  Navigator.pop(context, 'Prefer not to say');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

