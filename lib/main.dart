import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Rendered');
    final countController = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text('GETX State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                print('Only rendered observed data');
                return Text(
                  '${countController.count.value}',
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    countController.decrement();
                  },
                  child: Text('-'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    countController.increment();
                  },
                  child: Text('+'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text('Hello'),
                //   action: SnackBarAction(
                //     label: "Label",
                //     onPressed: () {},
                //   ),
                // ));
                Get.snackbar(
                  'Hai',
                  'Ini adalah pesannya',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.black,
                  colorText: Colors.white,
                );
              },
              child: Text('Snackbar'),
            )
          ],
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  var count = 0.obs; // state yang akan diobservasi / dipantau perubahannya

  increment() => count++;
  decrement() => count--;
}
