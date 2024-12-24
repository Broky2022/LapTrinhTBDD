import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// tạo counter provider model (Mode)
class CountProvider extends ChangeNotifier {
  int _count = 0;

  //getter để đọc giá trị
  int get count => _count;

  //cập nhập state
  void increment() {
    _count++;
    notifyListeners(); //thông báo cho các widget lắng nghe
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// chuyển đổi CountScreen thành StatelessWidget
class CountScreen extends StatelessWidget{
  const CountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CountProvider>(builder: (context, counterProvider, child){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
          actions: [
            IconButton(onPressed: () => counterProvider.reset(), icon: const Icon(Icons.refresh)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Current Counter: ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '${counterProvider.count}',
                style: const TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => counterProvider.decrement(),
                      child: const Icon(Icons.remove)),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () => counterProvider.increment(),
                      child: const Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}