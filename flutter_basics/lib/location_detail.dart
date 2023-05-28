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

  Widget _sectionTitle(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Text(text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.black
        ),
      )
    );
  }

  Widget _sectionText(String text)  {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Text(text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.black
        ),
      )
    );
  }

  List<Widget> _renderBody(BuildContext  context, Location location) {
    var result = List<Widget>.empty(growable: true);
    result.add(_bannerImage(location.url, 170));
    result.addAll(_renderFacts(location));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderBody(context, location)
      )
    );
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url, fit: BoxFit.fitWidth)
    );
  }
}