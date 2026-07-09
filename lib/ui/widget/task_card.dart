import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: Colors.white,
      title: Text('Text will here'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text('Descripstion on desk'),
          Text(
            'Date:23/06/2026',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Chip(
                label: Text('New'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
