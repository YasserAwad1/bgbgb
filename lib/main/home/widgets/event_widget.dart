import 'package:flutter/material.dart';
import 'package:kay_sy/models/events/event_model.dart';

class EventWidget extends StatelessWidget {
  final EventModel event;
  const EventWidget({Key? key, required this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      child: Image.network(
        event.image,
        height: 300,
      ),
    );
  }
}
