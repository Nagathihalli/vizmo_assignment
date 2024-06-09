import 'package:flutter/material.dart';
import 'package:untitled/data/models/event_models.dart';

class EventDetailsScreen extends StatelessWidget {
  final Data event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: ${event.title}"),
            Text("Description: ${event.description}"),
            Text("Status: ${event.status}"),
            Text("Starts at: ${event.startAt}"),
            Text("Duration: ${event.duration}"),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
