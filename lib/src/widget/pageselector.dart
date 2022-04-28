import 'package:flutter/material.dart';

class PageSelectorExample extends StatelessWidget {
  const PageSelectorExample({Key? key}) : super(key: key);

  static const Kimages = <Image>[
    Image(image: AssetImage('assets/prato.png')),
    Image(image: AssetImage('assets/prato.png')),
    Image(image: AssetImage('assets/prato.png')),

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
