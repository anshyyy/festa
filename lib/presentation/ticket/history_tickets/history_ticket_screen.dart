import 'package:flutter/material.dart';

import '../../widgets/dominant_color_generator.dart';
import 'history_ticket_tile.dart';

class HistoryTicketScreen extends StatelessWidget {
  HistoryTicketScreen({super.key});
  final List<Map<String, dynamic>> history = [
    {
      'eventTitle': 'Blandit pellentesque turpis',
      'eventPoster':
          'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'artist': 'Honey Singh',
      'duration': ''
    },
    {
      'eventTitle': 'Sa Re Ga Ma Pa',
      'eventPoster':
          'https://images.unsplash.com/photo-1578039894943-beb2452902a6?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'artist': 'Avdhut Gupte',
      'duration': ''
    },
    {
      'eventTitle': 'Sur Niragas',
      'eventPoster':
          'https://images.unsplash.com/photo-1530202741-e752bdc9d582?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'artist': 'Sachin Pilgaonkar',
      'duration': ''
    },
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: history.length,
      itemBuilder: (context, index) {
        final ticket = history[index];
        return FutureBuilder<Color>(
            future: dominantColorPaletteGenerator(ticket['eventPoster']),
            builder: (context, snapshot) {
              return TicketHistoryTile(
                eventPoster: ticket['eventPoster'],
                eventTitle: ticket['eventTitle'],
                artist: ticket['artist'],
                duration: ticket['duration'],
                dominantColor: snapshot.hasData
                    ? snapshot.data
                    : Theme.of(context).primaryColor,
              );
            });
      },
    );
  }
}
