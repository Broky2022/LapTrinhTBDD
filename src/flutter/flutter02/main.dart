import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TemperatureConverter(),
    );
  }
}

class firstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Đây là trang đầu',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => secondPage()));
                },
                child: Text('Đi đến trang 2.')),
          ],
        ),
      ),
    );
  }
}

class secondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Đây là trang 2!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Quay lại trang 1.')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => thirdPage()));
                },
                child: Text('Đi đến trang 3.')),
          ],
        ),
      ),
    );
  }
}

class thirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Đây là trang 3!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Quay lại trang 2.')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => firstPage()));
                },
                child: Text('Đi đến trang 1.')),
          ],
        ),
      ),
    );
  }
}

class TemperatureConverter extends StatelessWidget {
  TemperatureConverter({super.key});

  // Tạo TextEditingController như biến tĩnh
  static final TextEditingController _celsiusController =
      TextEditingController();
  static final TextEditingController _fahrenheitController =
      TextEditingController();

  // Hàm chuyển đổi từ C sang F
  void _convertCToF() {
    if (_celsiusController.text.isNotEmpty) {
      try {
        double celsius = double.parse(_celsiusController.text);
        double fahrenheit = (celsius * 9 / 5) + 32;
        _fahrenheitController.text = fahrenheit.toStringAsFixed(2);
      } catch (e) {
        _fahrenheitController.text = 'Lỗi: Vui lòng nhập số';
      }
    } else {
      _fahrenheitController.text = '';
    }
  }

  // Hàm chuyển đổi từ F sang C
  void _convertFToC() {
    if (_fahrenheitController.text.isNotEmpty) {
      try {
        double fahrenheit = double.parse(_fahrenheitController.text);
        double celsius = (fahrenheit - 32) * 5 / 9;
        _celsiusController.text = celsius.toStringAsFixed(2);
      } catch (e) {
        _celsiusController.text = 'Lỗi: Vui lòng nhập số';
      }
    } else {
      _celsiusController.text = '';
    }
  }

  // Hàm xóa giá trị
  void _clearAll() {
    _celsiusController.clear();
    _fahrenheitController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuyển đổi nhiệt độ'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input độ C
            TextField(
              controller: _celsiusController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Nhiệt độ (°C)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => _convertCToF(),
            ),

            SizedBox(height: 20),

            Icon(
              Icons.arrow_downward,
              size: 40,
              color: Colors.blue,
            ),

            SizedBox(height: 20),

            // Input độ F
            TextField(
              controller: _fahrenheitController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Nhiệt độ (°F)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => _convertFToC(),
            ),

            SizedBox(height: 30),

            // Nút xóa tất cả
            ElevatedButton.icon(
              onPressed: _clearAll,
              icon: Icon(Icons.refresh),
              label: Text('Xóa tất cả'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),

            SizedBox(height: 20),

            // Container hiển thị công thức
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Công thức chuyển đổi:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('°F = (°C × 9/5) + 32'),
                  Text('°C = (°F - 32) × 5/9'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
