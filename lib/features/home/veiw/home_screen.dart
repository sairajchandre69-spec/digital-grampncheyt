
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> services = [
    {
      'title': 'तक्रारी',
      'icon': Icons.support_agent,
      'color': const Color(0xFFE3F1FF),
      'iconColor': const Color(0xFF1675D1),
    },
    {
      'title': 'प्रमाणपत्रे',
      'icon': Icons.verified,
      'color': const Color(0xFFF0E7FF),
      'iconColor': const Color(0xFF8338C7),
    },
    {
      'title': 'योजना',
      'icon': Icons.eco,
      'color': const Color(0xFFE7F3EF),
      'iconColor': const Color(0xFF268B3C),
    },
    {
      'title': 'दस्तऐवज',
      'icon': Icons.description,
      'color': const Color(0xFFFFF1DF),
      'iconColor': const Color(0xFFE58B13),
    },
    {
      'title': 'आपत्कालीन',
      'icon': Icons.call,
      'color': const Color(0xFFFFE9E9),
      'iconColor': const Color(0xFFE53935),
    },
    {
      'title': 'सूचना',
      'icon': Icons.notifications,
      'color': const Color(0xFFF0E4FF),
      'iconColor': const Color(0xFF8A42D0),
    },
  ];

  final List<Map<String, dynamic>> bottomItems = [
    {'title': 'Home', 'icon': Icons.home_filled},
    {'title': 'Services', 'icon': Icons.apps},
    {'title': 'Complaints', 'icon': Icons.edit_note},
    {'title': 'Documents', 'icon': Icons.description_outlined},
    {'title': 'Profile', 'icon': Icons.person_outline},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Header and banner
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF07318C),
                    Color(0xFF0645B5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'नमस्कार,',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Sairaj ✌️',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _showMessage('नवीन सूचना उपलब्ध नाहीत.');
                          },
                          icon: const Icon(
                            Icons.notifications_active,
                            color: Colors.amber,
                            size: 26,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Location
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'मांजगाव ग्रामपंचायत',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Banner
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF78B66A),
                            Color(0xFF245B35),
                            Color(0xFF123E28),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        border: Border.all(
                          color: Colors.white24,
                          width: 1,
                        ),
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 8,
                            bottom: 5,
                            child: Icon(
                              Icons.park,
                              color: Color(0xFF174E28),
                              size: 48,
                            ),
                          ),
                          const Positioned(
                            right: 8,
                            bottom: 5,
                            child: Icon(
                              Icons.park,
                              color: Color(0xFF174E28),
                              size: 48,
                            ),
                          ),
                          const Positioned(
                            left: 40,
                            top: 5,
                            child: Icon(
                              Icons.flag,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'आपली ग्रामपंचायत,\nआपली जबाबदारी',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  height: 1.35,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.65,
                                      ),
                                      blurRadius: 5,
                                      offset: const Offset(1, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Services section
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -16),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'अम्ही सेवा',
                              style: TextStyle(
                                color: Color(0xFF34415A),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _showMessage('सर्व सेवा लवकरच उपलब्ध होतील.');
                              },
                              child: const Text(
                                'सर्व पहा',
                                style: TextStyle(
                                  color: Color(0xFF0645B5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Service cards
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          itemCount: services.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.94,
                          ),
                          itemBuilder: (context, index) {
                            final service = services[index];

                            return InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                _onServiceTap(service['title'] as String);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: service['color'] as Color,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.black.withValues(alpha: 0.03),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.04),
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      service['icon'] as IconData,
                                      color: service['iconColor'] as Color,
                                      size: 37,
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 3,
                                      ),
                                      child: Text(
                                        service['title'] as String,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF34415A),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.withValues(alpha: 0.15),
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });

              _showMessage('${bottomItems[index]['title']} निवडले');
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF073B9B),
            unselectedItemColor: const Color(0xFF7C879A),
            selectedFontSize: 11,
            unselectedFontSize: 11,
            iconSize: 22,
            elevation: 0,
            items: bottomItems.map((item) {
              return BottomNavigationBarItem(
                icon: Icon(item['icon'] as IconData),
                label: item['title'] as String,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _onServiceTap(String title) {
    switch (title) {
      case 'आपत्कालीन':
        _showEmergencyDialog();
        break;
      default:
        _showMessage('$title सेवा निवडली');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showEmergencyDialog() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('आपत्कालीन सेवा'),
          content: const Text(
            'पोलीस: 112\nरुग्णवाहिका: 108',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('बंद करा'),
            ),
          ],
        );
      },
    );
  }
}
