import 'package:flutter/material.dart';

class PageSelectorExample extends StatelessWidget {
  const PageSelectorExample({Key? key}) : super(key: key);

  static const Kimages = <Image>[
    Image(
        image: NetworkImage(
            'https://firebasestorage.googleapis.com/v0/b/tccsenai.appspot.com/o/prato.png?alt=media&token=4f41e3aa-e9f0-4495-a4db-b49c5e43ee91')),
    Image(
        image: NetworkImage(
            'https://firebasestorage.googleapis.com/v0/b/tccsenai.appspot.com/o/prato.png?alt=media&token=4f41e3aa-e9f0-4495-a4db-b49c5e43ee91')),
    Image(
        image: NetworkImage(
            'https://firebasestorage.googleapis.com/v0/b/tccsenai.appspot.com/o/prato.png?alt=media&token=4f41e3aa-e9f0-4495-a4db-b49c5e43ee91')),

    // Icon(Icons.home),
    // Icon(Icons.android),
    // Icon(Icons.alarm),
    // Icon(Icons.face),
    // Icon(Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Kimages.length,

      // Use a Builder here, otherwise `DefaultTabController.of(context)` below
      // returns null.
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const TabPageSelector(),
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const TabBarView(children: Kimages),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
