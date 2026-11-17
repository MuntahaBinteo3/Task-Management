import 'package:flutter/material.dart';
import 'package:task_management/view/auth_view/taskmanagerapp.dart';


class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetails();
}

class _TaskDetails extends State<TaskDetails> {

  final String taskTitle = 'Design Landing Page Header';
  final String taskDescription = 'Create a clean, responsive header section for the landing page. Include logo, navigation menu, search bar, and a primary call-to-action button. Ensure mobile responsiveness and use the brand green';
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
              SizedBox(width: 8),
              Text(
                'Delete Task?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          content: const Text(
            'Are you sure you want to delete this task? This action cannot be undone.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaskDetails(
                      ),
                ),
                );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ১. টপ হেডার
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF8BC34A)),
              onPressed: () {},
            ),
          ),
        ),
        title: const Text(
          'Tasks Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.assignment_outlined, size: 20, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        'Task Title',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 4.0),
                    child: Text(
                      taskTitle,
                      style: const TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Divider(color: Color(0xFFF0F0F0), thickness: 1),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.description_outlined, size: 20, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        'Task Description',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 6.0),
                    child: Text(
                      taskDescription,
                      style: const TextStyle(fontSize: 13, color: Colors.black54, height: 1.4),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ৩. ডিলিট ও এডিট বাটন
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _showDeleteDialog(context),
                          icon: const Icon(Icons.delete_outline, size: 18, color: Colors.redAccent),
                          label: const Text('Delete Task', style: TextStyle(color: Colors.redAccent, fontSize: 13)),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFFFCDD2)),
                            backgroundColor: const Color(0xFFFFEBEE),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.edit_note, size: 20, color: Color(0xFF8BC34A)),
                          label: const Text('Edit Task', style: TextStyle(color: Color(0xFF8BC34A), fontSize: 13)),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFDCEDC8)),
                            backgroundColor: const Color(0xFFF1F8E9),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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

      // ৪. বটম নেভিগেশন বার
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF8BC34A),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.home_filled, color: Colors.white, size: 24),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.add, color: Colors.grey, size: 26),
                Text('Add Task', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
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
}
