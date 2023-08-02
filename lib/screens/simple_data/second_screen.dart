import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/number_list_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: (context, numberListProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Second Screen'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                numberListProvider.add();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Last Item: ${numberListProvider.numbers.isEmpty ? '0' : numberListProvider.numbers.last}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  Expanded(
                    child: ListView.builder(
                        itemCount: numberListProvider.numbers.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Item: ${numberListProvider.numbers[index]}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
