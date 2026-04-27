import 'package:flutter/material.dart';

void main() {
  runApp(const Ex1App());
}

class Ex1App extends StatelessWidget {
  const Ex1App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 1',
      home: Ex1Page(),
    );
  }
}

class Ex1Page extends StatelessWidget {
  const Ex1Page({super.key});

  static const List<Map<String, String>> books = [
    {
      'title': 'Gabriela, Cravo e Canela',
      'image': 'https://covers.openlibrary.org/b/id/6980354-L.jpg',
    },
    {
      'title': 'Dona Flor e Seus Dois Maridos',
      'image': 'https://covers.openlibrary.org/b/id/14342197-L.jpg',
    },
    {
      'title': 'Capitães da Areia',
      'image':
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiO0KYzLG0ZbDBO7wYevQjnwlM-lAi98G8fa7rtS5V68esGO8Ye8ZdY7Wb1kaCrsnyOsoWDOf0Gl6KhrVqPbrmOAgvmuu4UF1l9MW1yw_EAVA2Bfm76iB2eINB1RTf2bQySmNP1VeFcWnj7ucytQ0NIS1XQqjT24wbOH24r1hPwfzL0MlVeYYf3ZbUhTUSk/s1500/23.Capit%C3%A3es%20da%20Areia%20(Jorge%20Amado).jpg',
    },
    {
      'title': 'Tieta do Agreste',
      'image': 'https://covers.openlibrary.org/b/id/5535170-L.jpg',
    },
    {
      'title': 'Tenda dos Milagres',
      'image': 'https://covers.openlibrary.org/b/id/13868281-L.jpg',
    },
    {
      'title': 'Mar Morto',
      'image': 'https://covers.openlibrary.org/b/id/14342025-L.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.75,
          children: books.map((book) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    book['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.book,
                          size: 64,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.55),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        book['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
