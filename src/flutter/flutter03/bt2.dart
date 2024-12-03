import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          for(int i=1; i <=10; i++)
            Center(
              child: Card(
                elevation: 4.0,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.network(
                        'https://cdn1.epicgames.com/offer/a2dcbb9e34204bda9da8415f97b3f4ea/2560x1440_EN_2560x1440-1295c4399099873d0d329e1c39d12ed5',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 80),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bài viết $i',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          const SizedBox(height: 4),
                          Text('Mô tả cho bài viết $i'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}