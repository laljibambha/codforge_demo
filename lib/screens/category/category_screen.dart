import 'package:codforge_demo/utils/app_images/app_images.dart';
import 'package:codforge_demo/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Map<String, String>> categories = [];
  bool isLoading = true;

  Future<void> _fetchCategories() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Map<String, String>> fetchedData = [
      {
        "icon": LocalImages.icAgriculturalIcon,
        "label": "Fertilizers",
      },
      {
        "icon": LocalImages.icAgriculturalIcon,
        "label": "Seeds",
      },
      {
        "icon": LocalImages.icAgriculturalIcon,
        "label": "Irrigation tools",
      },
      {
        "icon": LocalImages.icAgriculturalIcon,
        "label": "Requests and offers",
      },
      {
        "icon": LocalImages.icAgriculturalIcon,
        "label": "Agricultural tools",
      },
      {
        "icon": LocalImages.icAgriculturalIcon,
        "label": "Agricultural basins",
      },
      {
        "icon": LocalImages.icAgriculturalIcon,
        "label": "Greenhouses",
      },
      {
        "icon": LocalImages.icAgriculturalIcon,
        "label": "Machinery",
      },
    ];

    setState(() {
      categories = fetchedData;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white60,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                ),
                const Text(
                  AppStrings.categoryName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Stack(
                  children: [
                    Image.asset(
                      LocalImages.icNotificationsIcon,
                      width: 24,
                      height: 24,
                    ),
                    Positioned(
                      right: 2.5,
                      top: 2.5,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 15,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = categories[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFDDE7D2),
                    ),
                    child: Image.asset(
                      item['icon']!,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item['label']!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
