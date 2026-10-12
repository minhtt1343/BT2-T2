import 'package:flutter/material.dart';

// 1. Tạo class Student gồm String name, String? email, String? phone
class Student {
  String name;
  String? email;
  String? phone;

  Student({
    required this.name,
    this.email,
    this.phone,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Tạo list 5 sinh viên, trong đó có người thiếu email hoặc sđt (null)
    final List<Student> students = [
      Student(name: 'Nguyễn Văn An', email: 'an@sv.edu.vn', phone: '0901 234 567'),
      Student(name: 'Trần Thị Bình', email: null, phone: '0912 888 999'),
      Student(name: 'Lê Minh Chí', email: 'chi@sv.edu.vn', phone: null),
      Student(name: 'Phạm Quốc Dũng', email: null, phone: null),
      Student(name: 'Võ Thanh Em', email: 'em@sv.edu.vn', phone: '0933 111 222'),
    ];

    // 5. Dùng vòng lập for để đếm số sinh viên thiếu email
    int missingEmailCount = 0;
    for (var student in students) {
      if (student.email == null) {
        missingEmailCount++;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A), // Màu xanh navy đậm như trong hình
        title: const Text(
          'Danh sách sinh viên',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Danh sách các thẻ sinh viên có thể cuộn
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // 3. Dùng vòng lập for (Collection for) để tạo các thẻ sinh viên
                    for (var student in students) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Tên sinh viên
                            Text(
                              student.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // 4. Dùng toán tử ?? để xử lý dữ liệu null ("Chưa cập nhật")
                            Text(
                              'Email: ${student.email ?? "Chưa cập nhật"}',
                              style: TextStyle(
                                fontSize: 13,
                                color: student.email == null
                                    ? Colors.orange.shade800
                                    : Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'SĐT: ${student.phone ?? "Chưa cập nhật"}',
                              style: TextStyle(
                                fontSize: 13,
                                color: student.phone == null
                                    ? Colors.orange.shade800
                                    : Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12), // Khoảng cách giữa các card
                    ],
                  ],
                ),
              ),
            ),

            // 5. Thanh Footer hiển thị tổng số lượng và số sinh viên thiếu email
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng: ${students.length} sinh viên',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Thiếu email: $missingEmailCount',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}