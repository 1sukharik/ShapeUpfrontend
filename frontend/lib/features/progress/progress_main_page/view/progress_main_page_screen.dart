import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/features/about_etc/widgets/date_picker.dart';
import 'package:frontend/features/about_etc/widgets/dropdown_menu.dart';
import 'package:frontend/utils/constants.dart';
import '../../../authentication/widgets/widgets.dart';
import '../../../about_etc/widgets/widgets.dart';
import 'dart:math';

class Progress extends StatefulWidget {
  
  Progress({super.key});
  

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {

  int _currentPage = 0; // Текущая страница

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F7FF),
      body: Column(
        
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 65,
          ),
          _buildGoalCarousel(),
          _buildDotsIndicator(),
          SizedBox(
            height: 20,
          ),
          _buildDateSelector(),
          
          _buildContentArea(),
          
          
        ],
      ),
    );
    
  }

  Widget _buildGoalCarousel() {
    return SizedBox(
      height: 240,
      child: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentPage = index; // Изменение текущей страницы
          });
        },
        children: [
          _buildGoalProgress("Push-ups goal", 100, 120, Colors.purple),
          _buildGoalProgress("Squats goal", 30, 50, Colors.orange),
          _buildGoalProgress("Running goal", 5, 10, Colors.green),
        ],
      ),
    );
  }

  Widget _buildGoalProgress(String title, int done, int total, Color progressColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 25),
        Stack(
          alignment: Alignment.center,
          children: [
            
            Container(
              width: 180,
              height: 180,
              child: CustomPaint(
                painter: ArcPainter(progress: done / total, color: progressColor),
              ),
            ),
            
            Text(
              "$done/$total done",
              style: TextStyle(fontSize: 23),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => _buildDot(index)),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: _currentPage == index ? 12 : 8,
      height: _currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
      
    );
  }

  Widget _buildDateSelector() {
    return Column(
      children: [
        Text(
          "August 2024", style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDateCircle("m", "01", false),
            _buildDateCircle("t", "02", true),
            _buildDateCircle("w", "03", false),
            _buildDateCircle("t", "04", false),
            _buildDateCircle("f", "05", false),
            _buildDateCircle("s", "06", false),
            _buildDateCircle("s", "07", false),
          ],
        ),
      ],
    );
  }

  Widget _buildDateCircle(String day, String date, bool isSelected) {
    return Column(
      children: [
        Text(day, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        CircleAvatar(
          radius: 15,
          backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
          child: Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentArea() {
    
      return Container(
        height: 330,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Content goes here",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
    );
  }
  
}

class ArcPainter extends CustomPainter {
  final double progress;
  final Color color;

  ArcPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint progressPaint = Paint()
      ..color = color
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);
    
    double startAngle = -7 * pi / 6; 
    double sweepAngle = 4 * pi / 3;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    canvas.drawArc(rect, startAngle, sweepAngle * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}