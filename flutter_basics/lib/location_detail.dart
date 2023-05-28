import 'package:flutter/material.dart';
import 'models/location.dart';
import 'models/location_fact.dart';

class LocationDetail extends StatelessWidget {
  final Location location;

  const LocationDetail(this.location);

  Widget _section(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color
      ),
      child: Text(title)
    );
  }

  List<Widget> _renderFacts(Location location) {
    return location.facts
      .map(_renderFact)
      .reduce((value, element) => value += element);
  }

  List<Widget> _renderFact(LocationFact locationFact) => [
    _sectionTitle(locationFact.title),
    _sectionText(locationFact.text)
  ];

  Widget _sectionTitle(String text) => Text(text);

  Widget _sectionText(String text) => Text(text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderFacts(location)
      )
    );
  }
}