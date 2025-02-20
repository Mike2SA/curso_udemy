import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print('saiu');
  }

  void increment() {
    setState(() {
      count++;
    });
    print('entrou');
  }

  bool get EstaVazio => count == 0;
  bool get EstaCheio => count >= 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (EstaCheio == false ? 'Pode entrar' : 'Está lotado'),
              style: TextStyle(
                fontSize: 26,
                color: EstaCheio ? Colors.red : Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: EstaCheio ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: EstaVazio ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: EstaVazio
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text("Saiu",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: (EstaCheio ? null : increment),
                  style: TextButton.styleFrom(
                    backgroundColor: (EstaCheio
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white),
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    "Entrou",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
