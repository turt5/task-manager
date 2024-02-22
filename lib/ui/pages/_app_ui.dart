import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/_custom_text_field.dart';

class AppUi extends StatefulWidget {
  const AppUi({super.key});

  @override
  State<AppUi> createState() => _AppUiState();
}

class _AppUiState extends State<AppUi> {
  List<String> tasks = [];
  late ScrollController scController;

  @override
  void initState() {
    super.initState();
    scController = ScrollController();
  }

  @override
  void dispose() {
    scController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text('My Todo'),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                String taskText = controller.text.toString().trim();

                if (taskText.isNotEmpty) {
                  setState(() {
                    tasks.add(taskText);
                  });

                  scController.animateTo(tasks.length * 400,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please add a task to continue'),
                    duration: Duration(milliseconds: 2000),
                  ));
                }
              },
              icon: const Icon(CupertinoIcons.add),
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextField(
                controller: controller,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Tasks:',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child:
                //  tasks.isEmpty
                //     ? Container(
                //         margin: const EdgeInsets.only(bottom: 10),
                //         height: 300,
                //         child: Center(
                //           child: Text(
                //             "No tasks available",
                //             style: TextStyle(
                //                 fontSize: 22,
                //                 color: Colors.grey.shade400,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //       )
                //     :
                     ListView.builder(
                        controller: scController,
                        itemCount: tasks.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onPanUpdate: (details) {
                              // Swiping in right direction.
                              if (details.delta.dx > 0) {
                                setState(() {
                                  if (index < tasks.length) {
                                    tasks.removeAt(index);
                                  }
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                child: Text(
                                  tasks[index],
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ),
                            ),
                          );
                        })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
