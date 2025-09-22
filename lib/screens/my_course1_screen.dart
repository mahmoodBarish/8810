import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class MyCourse1Screen extends StatefulWidget {
  const MyCourse1Screen({Key? key}) : super(key: key);

  @override
  State<MyCourse1Screen> createState() => _MyCourse1ScreenState();
}

class _MyCourse1ScreenState extends State<MyCourse1Screen> {
  // Define course data based on Figma elements and desired structure
  // This helps make the UI modular and data-driven
  final List<CourseData> courses = [
    CourseData(
      title: 'Product\nDesign v1.0',
      cardBackgroundColor: const Color(0xFFFFF7F2), // Figma: r: 1, g: 0.90, b: 0.93 -> FFF7F2
      progressFillColor: const Color(0xFFED7B9C), // Figma: r: 0.92, g: 0.48, b: 0.61 -> ED7B9C
      playButtonColor: const Color(0xFFED7B9C),
      completedLessons: 14,
      totalLessons: 24,
      routeName: '/course_detail', // Inferred route name
    ),
    CourseData(
      title: 'Java \nDevelopment',
      cardBackgroundColor: const Color(0xFFBAD6FF), // Figma: r: 0.72, g: 0.83, b: 1 -> BAD6FF
      progressFillColor: const Color(0xFF3D5CFF), // Figma: r: 0.23, g: 0.36, b: 1 -> 3D5CFF
      playButtonColor: const Color(0xFF3D5CFF),
      completedLessons: 12,
      totalLessons: 18,
      routeName: '/course_detail', // Inferred route name
    ),
    CourseData(
      title: 'Visual Design',
      cardBackgroundColor: const Color(0xFFBADAAD), // Figma: r: 0.72, g: 0.87, b: 0.85 -> BADAAD
      progressFillColor: const Color(0xFF398A80), // Figma: r: 0.22, g: 0.54, b: 0.50 -> 398A80
      playButtonColor: const Color(0xFF398A80),
      completedLessons: 10,
      totalLessons: 16,
      routeName: '/course_detail', // Inferred route name
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Media query for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Figma's navigation bar has no shadow directly below it.
        toolbarHeight: screenHeight * 0.054, // Approx 44/812
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1F1F39)),
          onPressed: () {
            context.pop(); // Navigate back using go_router
          },
        ),
        title: Text(
          'My courses',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500, // Poppins-Medium
            color: const Color(0xFF1F1F39),
          ),
        ),
        centerTitle: true,
        // The status bar elements like time, network, battery are system-level UI
        // and are typically not recreated explicitly in Flutter for responsiveness.
        // SafeArea handles the padding for the status bar.
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.015), // Spacing below AppBar
            _buildLearnedTodayCard(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.02), // Spacing between "Learned today" card and course cards

            // Course Cards Layout
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035), // Approx 14/375
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CourseCard(
                          title: courses[0].title,
                          cardBackgroundColor: courses[0].cardBackgroundColor,
                          progressFillColor: courses[0].progressFillColor,
                          playButtonColor: courses[0].playButtonColor,
                          completedLessons: courses[0].completedLessons,
                          totalLessons: courses[0].totalLessons,
                          onPlayPressed: () => context.push(courses[0].routeName), // Navigate using go_router
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.037), // Space between cards, approx 14/375
                      Expanded(
                        child: CourseCard(
                          title: courses[1].title,
                          cardBackgroundColor: courses[1].cardBackgroundColor,
                          progressFillColor: courses[1].progressFillColor,
                          playButtonColor: courses[1].playButtonColor,
                          completedLessons: courses[1].completedLessons,
                          totalLessons: courses[1].totalLessons,
                          onPlayPressed: () => context.push(courses[1].routeName), // Navigate using go_router
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02), // Spacing between rows of cards
                  Row(
                    children: [
                      Expanded(
                        child: CourseCard(
                          title: courses[2].title,
                          cardBackgroundColor: courses[2].cardBackgroundColor,
                          progressFillColor: courses[2].progressFillColor,
                          playButtonColor: courses[2].playButtonColor,
                          completedLessons: courses[2].completedLessons,
                          totalLessons: courses[2].totalLessons,
                          onPlayPressed: () => context.push(courses[2].routeName), // Navigate using go_router
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.037), // Maintain consistent spacing even if one is empty
                      const Expanded(
                        child: SizedBox.shrink(), // Placeholder for empty slot in the row to maintain spacing
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025), // Bottom padding for scroll view
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearnedTodayCard(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.053), // Approx 20/375
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 0.042), // Approx 16/375
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0x33B8B8D2), // Figma shadow color (0.2 alpha)
              offset: const Offset(0, 8),
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Learned today',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400, // Poppins-Regular
                color: const Color(0xFF858597), // Figma: r: 0.52, g: 0.52, b: 0.59
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // Spacing
            Row(
              children: [
                Text(
                  '46min',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700, // Poppins-Bold
                    color: const Color(0xFF1F1F39), // Figma: r: 0.12, g: 0.12, b: 0.22
                  ),
                ),
                Text(
                  ' / 60min',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400, // Poppins-Regular
                    color: const Color(0xFF858597), // Figma: r: 0.52, g: 0.52, b: 0.59
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.015), // Spacing
            CustomLinearProgressBar(
              progress: 46 / 60, // Calculate progress based on values in Figma
              backgroundColor: const Color(0xFFF4F3FD), // Figma: r: 0.95, g: 0.95, b: 0.99
              gradientColors: const [
                Colors.transparent, // Figma has transparent start for gradient Rectangle 30
                Color(0xFFFF5106), // Figma: r: 1, g: 0.31, b: 0.02
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CourseData {
  final String title;
  final Color cardBackgroundColor;
  final Color progressFillColor;
  final Color playButtonColor;
  final int completedLessons;
  final int totalLessons;
  final String routeName;

  CourseData({
    required this.title,
    required this.cardBackgroundColor,
    required this.progressFillColor,
    required this.playButtonColor,
    required this.completedLessons,
    required this.totalLessons,
    required this.routeName,
  });
}

class CourseCard extends StatelessWidget {
  final String title;
  final Color cardBackgroundColor;
  final Color progressFillColor;
  final Color playButtonColor;
  final int completedLessons;
  final int totalLessons;
  final VoidCallback onPlayPressed;

  const CourseCard({
    Key? key,
    required this.title,
    required this.cardBackgroundColor,
    required this.progressFillColor,
    required this.playButtonColor,
    required this.completedLessons,
    required this.totalLessons,
    required this.onPlayPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double progress = completedLessons / totalLessons;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.042, vertical: screenHeight * 0.02), // Approx 16/375 horizontal, 16/812 vertical
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0x33B8B8D2), // Figma shadow color (0.2 alpha)
            offset: const Offset(0, 8),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700, // Poppins-Bold
              color: const Color(0xFF1F1F39), // Figma: r: 0.12, g: 0.12, b: 0.22
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: screenHeight * 0.02), // Spacing
          // Progress bar
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: 6,
                width: constraints.maxWidth, // Full width of the card's content area
                decoration: BoxDecoration(
                  color: Colors.white, // Rectangle 72 background
                  borderRadius: BorderRadius.circular(3), // Half of height for rounded caps
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: constraints.maxWidth * progress,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: LinearGradient(
                        colors: [
                          progressFillColor.withOpacity(0.5019999742507935), // Figma shows gradient stops with opacity
                          progressFillColor,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: screenHeight * 0.01), // Spacing
          Text(
            'Completed',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400, // Poppins-Regular
              color: const Color(0xFF1F1F39), // Figma: r: 0.12, g: 0.12, b: 0.22
            ),
          ),
          SizedBox(height: screenHeight * 0.005), // Spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$completedLessons/$totalLessons',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700, // Poppins-Bold
                  color: const Color(0xFF1F1F39), // Figma: r: 0.12, g: 0.12, b: 0.22
                ),
              ),
              GestureDetector(
                onTap: onPlayPressed,
                child: Container(
                  width: screenWidth * 0.117, // 44/375
                  height: screenWidth * 0.117, // 44/375
                  decoration: BoxDecoration(
                    color: playButtonColor, // Ellipse 23
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate( // Figma's polygon is rotated
                    angle: 1.5707963267948966, // 90 degrees in radians
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white, // Polygon 1 fill
                      size: 24, // Assuming a standard icon size works well
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

class CustomLinearProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final Color backgroundColor;
  final List<Color> gradientColors;

  const CustomLinearProgressBar({
    Key? key,
    required this.progress,
    required this.backgroundColor,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: 6, // Fixed height from Figma
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(3), // Half of height for rounded caps
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: constraints.maxWidth * progress,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}