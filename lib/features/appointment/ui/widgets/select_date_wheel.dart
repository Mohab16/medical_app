import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';

class SelectDateWheel extends StatefulWidget {
  final Function (String) onDateChanged;
  const SelectDateWheel({super.key, required this.onDateChanged});

  @override
  State<SelectDateWheel> createState() => _SelectDateWheelState();
}

class _SelectDateWheelState extends State<SelectDateWheel> {
  int selectedDate = 3;
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.2,
      initialPage: 0, // start at today's index
    );

    // ✅ Scroll to the middle after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.hasClients) {
        _controller.jumpToPage(
          3,
        ); // or whichever initial index you want visible
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   List<Map<String, String>> generateWeekDates() {
    DateTime now = DateTime.now();

    return List.generate(7, (i) {
      DateTime date = now.add(Duration(days: i + 1));
      return {
        'day': DateFormat('E').format(date),
        'date': DateFormat('dd').format(date),
        'selected date': DateFormat('yyyy-MM-dd').format(date),
      };
    });
  }
    final days = generateWeekDates();

    return SizedBox(
      height: 120.h,
      child: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            selectedDate = index; // ✅ update state when page changes
          });
          widget.onDateChanged(days[index]['selected date']!);
        },
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double value = 1.0;
              if (_controller.position.haveDimensions) {
                value = _controller.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
              }

              /// ✅ Use your selectedDate state, not controller.page
              bool isSelected = selectedDate == index;

              return Center(
                child: Transform.scale(
                  scale: value,
                  child: Container(
                    width: 55.w,
                    height: 62.h,
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? ColorsManager.mainBLue
                          : ColorsManager.buttonsGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          days[index]['day']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: isSelected ? Colors.white : ColorsManager.lightGray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        verticalSpacing(4),
                        Text(
                          days[index]['date']!,
                          style: TextStyle(
                            color: isSelected ? Colors.white : ColorsManager.lightGray,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}