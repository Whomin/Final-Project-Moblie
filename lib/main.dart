import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    theme: ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 241, 187),
    ),
    routes: {
      '/': (context) => const HomePage(),
      '/second': (context) => const SecondPage(),
      '/third': (context) => const ThirdPage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NoFakeTexi',
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: NetworkImage(
                  'https://th.bing.com/th/id/R.3cbdaf5ba28c9aa94b721ce83ec45221?rik=C3DIolqcVJ1GiQ&riu=http%3a%2f%2fpngimg.com%2fuploads%2ftaxi_logos%2ftaxi_logos_PNG15.png&ehk=BWjQewmguZq0FJg7k%2fNIhbEVELFfGGi69dCLgq%2bn9ww%3d&risl=&pid=ImgRaw&r=0'),
              width: 1200,
              height: 250,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text('บริการเหมาแท็กซี่'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('    บริการแท็กซี่    '),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'หมายเหตุ \nประกาศกระทรวงคมนาคม เรื่องกำหนดอัตราค่าจ้างบรรทุกโดยสาร \nและค่าบริการอื่น สำหรับรถยนต์รับจ้างบรรทุกคนโดยสารไม่เกินเจ็ดคน \nที่จดทะเบียนในเขตกรุงเทพมหานคร พ.ศ.2565 \nหรือการปรับ"ขึ้นค่าแท็กซี่" เริ่มมีผลบังคับใช้ \nตั้งแต่วันที่ 13 มกราคม 2566 เป็นต้นไป',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NoFakeTexi"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: const Center(
        child: Page1(),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NoFakeTexi"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: const Center(
        child: Page2(),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => Page1build();
}

class Page1build extends State<Page1> {
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();

  @override
  void dispose() {
    _textEditingController3.dispose();
    _textEditingController4.dispose();
    super.dispose();
  }

  void clearText() {
    _textEditingController3.clear();
    _textEditingController4.clear();
  }

  double km1 = 0;
  double min1 = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Image(
            image: NetworkImage(
                'https://i0.wp.com/learning4live.com/wp-content/uploads/2018/09/1-5.jpg?fit=1200%2C890&ssl=1'),
            width: 1200,
            height: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: TextField(
              controller: _textEditingController3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'กรอกระยะเวลา(ชั่วโมง)',
              ),
              onChanged: (String value1) {
                km1 = int.parse(value1) as double;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: TextFormField(
              controller: _textEditingController4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'กรอกค่าทางด่วน(บาท)',
              ),
              onChanged: (String value2) {
                min1 = int.parse(value2) as double;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (km1 >= 4) {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('แจ้งเตือน!!'),
                    content: Text(
                        "คุณจะต้องจ่ายค่าแท็กซี่ ${(km1 * 200) + (min1)} บาท"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          color: Colors.green,
                          padding: const EdgeInsets.all(14),
                          child: const Text("okay"),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('แจ้งเตือน!!'),
                    content: const Text(
                        "การเหมารถจะต้องมีเวลาในการเช่าขั้นต่ำ 4 ชั่วโมง"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          color: Colors.green,
                          padding: const EdgeInsets.all(14),
                          child: const Text("okay"),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            child: const Text('คำนวณ'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: clearText,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 175, 160, 76))),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => Page2build();
}

class Page2build extends State<Page2> {
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  @override
  void dispose() {
    _textEditingController1.dispose();
    _textEditingController2.dispose();
    super.dispose();
  }

  void clearText() {
    _textEditingController1.clear();
    _textEditingController2.clear();
  }

  double km2 = 0;
  double min2 = 0;
  double price2 = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Image(
            image: NetworkImage(
                'https://i0.wp.com/learning4live.com/wp-content/uploads/2018/09/1-5.jpg?fit=1200%2C890&ssl=1'),
            width: 1200,
            height: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: TextField(
              controller: _textEditingController1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'กรอกระยะทาง(กิโลเมตร)',
              ),
              onChanged: (String value1) {
                km2 = int.parse(value1) as double;
                if (km2 >= 80) {
                  price2 = 10.5;
                } else if (km2 >= 60) {
                  price2 = 9;
                } else if (km2 >= 40) {
                  price2 = 8.5;
                } else if (km2 >= 20) {
                  price2 = 8;
                } else if (km2 >= 10) {
                  price2 = 7;
                } else if (km2 >= 1) {
                  price2 = 6.5;
                } else {
                  price2 = 0;
                }
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: TextFormField(
              controller: _textEditingController2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'กรอกเวลารถติด(นาที)',
              ),
              onChanged: (String value2) {
                min2 = int.parse(value2) as double;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('แจ้งเตือน!!'),
                  content: Text(
                      "คุณจะต้องจ่ายค่าแท็กซี่ ${(km2 * price2) + (min2 * 3)} บาท"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay"),
                      ),
                    ),
                  ],
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            child: const Text('คำนวณ'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: clearText,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 175, 160, 76))),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
