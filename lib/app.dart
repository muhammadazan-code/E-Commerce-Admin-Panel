import 'package:e_commerce_web/Routes/app_routes.dart';
import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/common/widgets/container/circular_container.dart';
import 'package:e_commerce_web/common/widgets/layouts/template/site_layout.dart';
import 'package:e_commerce_web/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: TAppRoutes.pages,
      initialRoute: TRoutes.login,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => Scaffold(body: Center(child: Text('Page not found'))),
      ),
    );
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: DesktopDesign(),
      tablet: TabletDesign(),
      mobile: MobileDesign(),
    );
  }
}

class DesktopDesign extends StatelessWidget {
  const DesktopDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TRoundedContainer(
                  width: 200,
                  height: 430,
                  radius: 20,
                  backgroundColor: Colors.blue.withOpacity(.2),
                  child: Center(child: Text('Box 1')),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    TRoundedContainer(
                      height: 200,
                      width: double.infinity,
                      radius: 20,
                      backgroundColor: Colors.orangeAccent.withOpacity(.2),
                      child: Center(child: Text('Box 2')),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        TRoundedContainer(
                          height: 200,
                          width: 300,
                          radius: 20,
                          backgroundColor: Colors.pinkAccent.withOpacity(.2),
                          child: Center(child: Text('Box 3')),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TRoundedContainer(
                            height: 200,
                            width: 300,
                            radius: 20,
                            backgroundColor: Colors.cyanAccent.withOpacity(.2),
                            child: Center(child: Text('Box 4')),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TRoundedContainer(
                  height: 100,
                  width: 300,
                  radius: 20,
                  backgroundColor: Colors.pinkAccent.withOpacity(.2),
                  child: Center(child: Text('Box 5')),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TRoundedContainer(
                  height: 100,
                  width: 300,
                  radius: 20,
                  backgroundColor: Colors.pink.withOpacity(.2),
                  child: Center(child: Text('Box 6')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileDesign extends StatelessWidget {
  const MobileDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: TRoundedContainer(
                width: double.infinity,

                height: 200,
                radius: 20,
                backgroundColor: Colors.blue.withOpacity(.2),
                child: Center(child: Text('Box 1')),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TRoundedContainer(
                height: 200,
                width: double.infinity,
                radius: 20,
                backgroundColor: Colors.orangeAccent.withOpacity(.2),
                child: Center(child: Text('Box 2')),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TRoundedContainer(
                width: double.infinity,

                height: 200,
                radius: 20,
                backgroundColor: Colors.pinkAccent.withOpacity(.2),
                child: Center(child: Text('Box 3')),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TRoundedContainer(
                height: 200,
                width: double.infinity,
                radius: 20,
                backgroundColor: Colors.cyanAccent.withOpacity(.2),
                child: Center(child: Text('Box 4')),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TRoundedContainer(
                height: 150,
                width: double.infinity,
                radius: 20,
                backgroundColor: Colors.pinkAccent.withOpacity(.2),
                child: Center(child: Text('Box 5')),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TRoundedContainer(
                height: 150,
                radius: 20,
                width: double.infinity,
                backgroundColor: Colors.pink.withOpacity(.2),
                child: Center(child: Text('Box 6')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabletDesign extends StatelessWidget {
  const TabletDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TRoundedContainer(
                      radius: 20,
                      width: 300,
                      height: 450,
                      backgroundColor: Colors.blueAccent.withOpacity(.5),
                      child: Center(child: Text("Box 1")),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        TRoundedContainer(
                          radius: 20,
                          width: double.infinity,
                          height: 200,
                          backgroundColor: Colors.pinkAccent.withOpacity(.5),
                          child: Center(child: Text("Box 2")),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TRoundedContainer(
                                radius: 20,
                                width: 100,
                                height: 200,
                                backgroundColor: Colors.blueAccent.withOpacity(
                                  .5,
                                ),
                                child: Center(child: Text("Box 3")),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TRoundedContainer(
                                radius: 20,
                                width: 200,
                                height: 200,
                                backgroundColor: Colors.blueAccent.withOpacity(
                                  .5,
                                ),
                                child: Center(child: Text("Box 4")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TRoundedContainer(
                width: double.infinity,
                radius: 20,
                height: 100,
                backgroundColor: Colors.red.withOpacity(.3),
                child: Center(child: Text("Box 5")),
              ),
              SizedBox(height: 20),
              TRoundedContainer(
                radius: 20,
                height: 100,
                width: double.infinity,
                borderColor: Colors.black,
                backgroundColor: Colors.green.withOpacity(.5),
                child: Center(child: Text("Box 6")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
