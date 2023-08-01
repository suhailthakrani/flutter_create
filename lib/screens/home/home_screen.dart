import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_create/models/lesson_model.dart';
import 'package:flutter_create/models/program_model.dart';
import 'package:flutter_create/screens/home/components/lessons_list.dart';
import 'package:flutter_create/screens/home/components/program_list.dart';
import 'package:flutter_create/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  late Future<ProgramModel> programModelFuture;
  late Future<LessonModel> lessonModelFuture;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    programModelFuture = apiService.fetchPrograms();
    lessonModelFuture = apiService.fetchLessons();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: Future.wait([programModelFuture, lessonModelFuture]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for data to be fetched.
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle error state.
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data fetched successfully, continue building your UI.
            ProgramModel programModel = snapshot.data![0] as ProgramModel;
            LessonModel lessonModel = snapshot.data![1] as LessonModel;
            return Scaffold(
              backgroundColor: const Color(0xffEEF3FD),
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeaderWidget(),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: height * 0.15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          //
                                        },
                                        child: buildChip(
                                          avatar: Icon(
                                            Icons.book,
                                            color: Colors.blue.shade600,
                                          ),
                                          title: "Programs",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          //
                                        },
                                        child: buildChip(
                                          avatar: Icon(
                                            Icons.help,
                                            color: Colors.blue.shade600,
                                          ),
                                          title: "Get help",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          //
                                        },
                                        child: buildChip(
                                          avatar: Icon(
                                            Icons.menu_book_sharp,
                                            color: Colors.blue.shade600,
                                          ),
                                          title: "Learn",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          //
                                        },
                                        child: buildChip(
                                          avatar: Icon(
                                            Icons.view_comfortable_rounded,
                                            color: Colors.blue.shade600,
                                          ),
                                          title: "DD Tracker",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(left: 16),
                      height: height * 0.37,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          viewAllWidget(
                              title: 'Programs for you', onPressed: () {}),
                          Flexible(
                            child: ProgramsList(
                              programs: programModel.items,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                    // Container(
                    //   color: Colors.white,
                    //   padding: const EdgeInsets.only(left: 12),
                    //   height: height * 0.38,
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       viewAllWidget(
                    //           title: 'Events and Experience', onPressed: () {}),
                    //       Flexible(
                    //         child: ProgramsList(
                    //           programs: eventsAndExperiences,
                    //           prgramId: 1,
                    //         ),
                    //       ),
                    //       const SizedBox(height: 4),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(left: 12),
                      height: height * 0.37,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          viewAllWidget(
                              title: 'Lessons for you', onPressed: () {}),
                          Flexible(
                            child: LessonsList(
                              lessons: lessonModel.items,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }

  Widget viewAllWidget(
      {required String title, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4.0,
        right: 8,
        top: 8,
        bottom: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          InkWell(
            onTap: onPressed,
            child: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "view all",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                ),
                SizedBox(width: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChip({required Widget avatar, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.shade500,
        ),
      ),
      child: Row(
        children: [
          avatar,
          const SizedBox(width: 8),
          Text(
            title, // Will Change later
            style: TextStyle(
              color: Colors.blue.shade600,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderWidget() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, Priya!",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
        Text(
          "What do you wanna learn today?",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffEEF3FD),
      leadingWidth: 70,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.short_text_rounded,
          color: Colors.black54,
          size: 40,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.chat_bubble_2,
            color: Colors.black54,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black54,
            size: 30,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
