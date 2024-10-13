import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: context.dynamicHeight(0.35),
            color: Colors.amber,
          ),
          SizedBox(height: context.dynamicHeight(0.3)),
          Column(
            children: [
              SizedBox(height: context.dynamicHeight(0.3)),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: context.paddingAllLow2,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Spiderman eve donus', style: context.textTheme().titleMedium),
                          Text(
                            '⭐️ 6.2/10 IMBd',
                            style: context.textTheme().bodySmall,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Budget',
                                    style: context.textTheme().bodySmall,
                                  ),
                                  Text(
                                    r'750000 $',
                                    style: context.textTheme().labelMedium,
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Budget',
                                    style: context.textTheme().bodySmall,
                                  ),
                                  Text(
                                    r'750000 $',
                                    style: context.textTheme().labelMedium,
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Budget',
                                    style: context.textTheme().bodySmall,
                                  ),
                                  Text(
                                    r'750000 $',
                                    style: context.textTheme().labelMedium,
                                  )
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                          Text(
                            'Description',
                            style: context.textTheme().bodyLarge,
                          ),
                          Text(
                            'Mustafa narin' * 20,
                            style: context.textTheme().bodySmall,
                          ),
                          Text(
                            'Companies',
                            style: context.textTheme().bodyLarge,
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 75,
                                        width: 75,
                                        color: Colors.blue,
                                      ),
                                      Text(
                                        'dataaa',
                                        style: context.textTheme().labelMedium,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
