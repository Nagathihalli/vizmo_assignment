import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data/services/event_service.dart';
import 'package:untitled/ui/event_detail_screen.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final eventsViewModel = Provider.of<EventsViewModel>(context);
    eventsViewModel.fetchEvents(); // Fetch events on initial load

    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<EventsViewModel>(
              builder: (context, model, child) {
                if (model.events == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: model.events!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // title: Text(model.events![index].title!),
                        subtitle: Card(
                            child: Column(
                          children: [
                            Text(model.events![index].title!,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center),
                            Text(model.events![index].description!,
                                textAlign: TextAlign.center)
                          ],
                        )),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventDetailsScreen(
                                    event: model.events![index])),
                          );
                          // Implement logic to show event details upon tapping
                          // This could involve navigating to a new screen or showing a modal
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
