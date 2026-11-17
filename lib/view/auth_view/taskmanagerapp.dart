import 'package:flutter/material.dart';
import 'package:task_management/Constant/image.dart';
import 'package:task_management/Constant/string.dart';
import 'package:task_management/view/auth_view/task_details.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerApp();
}

class _TaskManagerApp extends State<TaskManagerApp> {

  int selectedIndex = 0;



  final List<Map<String, String>> tasks = [
    {
      'title': AppString.titlefive,
      'description': AppString.descriptionOnboardingsix,
    },
    {
      'title': AppString.titlesix,
      'description': AppString.descriptionOnboardingseven,
    },
    {
      'title': AppString.titleseven,
      'description': AppString.descriptionOnboardingeight,
    },
    {
      'title': AppString. titleeight,
      'description': AppString.descriptionOnboardingnine,
    },
    {
      'title': AppString.titlenine,
      'description': AppString.descriptionOnboardingnine,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 17,
                    backgroundColor: Color(0xFFE1E9D5),
                    child: Image(image: AssetImage(AppAssets.component6))
                  ),

                  const SizedBox(width: 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      Text(
                        'Hello Mojahid',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        'Welcome to Task Manager',
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Tasks',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252D25),
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),

                itemCount: tasks.length,

                itemBuilder: (context, index) {
                  return TaskCard(
                    title: tasks[index]['title']!,
                    description: tasks[index]['description']!,
                  );
                },
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_filled,
                  color: Color(0xFF8BC34A),
                  size: 28),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetails(
                    ),
                  ),
                  );

              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.add, color: Colors.grey, size: 26),
                  Text('Add Task', style: TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.person_outline, color: Colors.grey, size: 26),
                Text('Profile', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            width: 34,
            height: 34,

            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF91C900)
                  : Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                BoxShadow(
                  color: const Color(0xFF91C900)
                      .withOpacity(0.25),
                  blurRadius: 8,
                ),
              ]
                  : [],
            ),

            child: Icon(
              icon,
              size: 20,
              color: isSelected
                  ? Colors.white
                  : Colors.black87,
            ),
          ),

          if (!isSelected)
            Text(
              label,
              style: const TextStyle(fontSize: 9),
            ),
        ],
      ),
    );
  }
}



class TaskCard extends StatelessWidget {

  final String title;
  final String description;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),

        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,

            child: ClipPath(
              clipper: CornerClipper(),

              child: Container(
                width: 75,
                height: 65,
                color: const Color(0xFFF0F7DF),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F7E9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(AppAssets.component7)
                  ),
                const SizedBox(height: 7),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF28332A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.35, size.height * 0.55);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
