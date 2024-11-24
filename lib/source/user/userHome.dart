import 'package:flutter/material.dart';
import 'package:pbl3/source/user/issue.dart';
import 'package:pbl3/source/user/personal.dart'; // Đảm bảo tệp `personal.dart` tồn tại

class UserHomePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const UserHomePage({super.key, required this.userData});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<UserHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang thông tin cơ sở hạ tầng'),
        backgroundColor: Colors.blue, // Màu nền cho AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Công dân số',
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2, // Hiển thị 2 cột trong lưới
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(4, (index) {
                      return const IconContainer(
                        imageUrl:
                            'assets/anhmau.jpg', // Thay bằng đường dẫn ảnh thực tế
                        label: 'label',
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Báo cáo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Giới thiệu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: 0, // Đặt mặc định mục "Trang chủ" được chọn
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IssuePage()),
              );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PersonalAccountPage(userData: widget.userData)),
            );
          }
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final String imageUrl;
  final String label;

  const IconContainer({super.key, required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imageUrl,
          width: 100,
          height: 100,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.image_not_supported,
                size: 100, color: Colors.grey);
          },
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}