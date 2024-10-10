import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/widgets/project_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ProjectStrings.projectName),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingAllLow2,
          child: Column(
            children: [
              _RowTitleAndButton(title: 'Now showing', onPressed: () {}),
              SizedBox(
                height: 200, 
                child: OverflowBox(
                  maxWidth: context.dynamicWidth(1),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    padding: context.paddingAllLow1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: context.paddingAllLow1,
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 100,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              _RowTitleAndButton(title: 'Popular', onPressed: () {}),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), 
                itemBuilder: (context, index) {
                  return Padding(
                    padding: context.paddingVerticalLow1,
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 70,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: EdgeInsets.only(left: context.lowValue2,bottom: context.lowValue1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Venom',style: context.textTheme().bodyMedium,),
                                Text('⭐️ 6.4/1 IMBd',style: context.textTheme().bodySmall?.copyWith(
                                  color: Colors.grey.shade600,
                                ),),
                                Text('1h 47m',style: context.textTheme().bodySmall,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RowTitleAndButton extends StatelessWidget {
  const _RowTitleAndButton({
    required this.title, required this.onPressed, super.key,
  });
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: context.textTheme().bodyLarge,),
        ProjectButton(onPressed: onPressed),
      ],
    );
  }
}
