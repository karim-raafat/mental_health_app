import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/home_page_views/categories_view.dart';
import 'package:mental_health_app/pages/home_page_views/home_view.dart';
import 'package:mental_health_app/pages/home_page_views/messages_view.dart';
import 'package:mental_health_app/provider/app_provider.dart';
import 'package:mental_health_app/utils/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[800],
        bottomNavigationBar: Consumer<AppProvider>(
          builder:
              (BuildContext context, AppProvider appProvider, Widget? child) =>
                  BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedFontSize: 0,
            // unselectedFontSize: 0,
            unselectedItemColor: Colors.grey,
            currentIndex: appProvider.selectedIndex,
            selectedItemColor: Colors.blue[800],
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    appProvider.selectedIndex = 0;
                  },
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: IconButton(
                  icon: const Icon(Icons.category),
                  onPressed: () {
                    appProvider.selectedIndex = 1;
                  },
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    appProvider.selectedIndex = 2;                  },
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                  
                  },
                ),
              ),
            ],
          ),
        ),
        body: Consumer<AppProvider>(
            builder: (BuildContext context, AppProvider appProvider,
                    Widget? child) =>
                SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Hi, ${appProvider.loggedUser.name}!',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      getTodayDate(),
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 30,
                                          color: Color(0xFFE0E0E0),
                                          blurStyle: BlurStyle.inner,
                                        ),
                                      ],
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.notifications,
                                        color: Colors.white,
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                   BoxShadow(
                                    blurRadius: 90,
                                    color: Color(0xFFE0E0E0),
                                    blurStyle: BlurStyle.inner,
                                  ),
                                ]
                              ),
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                                cursorColor: Colors.blue[800],
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusColor: Colors.blue[800],
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: 'Search',
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      (appProvider.selectedIndex == 0)
                          ? const HomeView()
                          : (appProvider.selectedIndex == 1)
                              ? const CategoriesView()
                              : (appProvider.selectedIndex == 2)
                                  ? const MessagesView()
                                  : const Text('Profile'),
                    ],
                  ),
                )));
  }
}
