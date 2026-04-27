import 'package:flutter/material.dart';

void main() {
  runApp(const Ex5App());
}

class Ex5App extends StatelessWidget {
  const Ex5App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 5 - FAB in BottomBar',
      home: Ex5Page(),
    );
  }
}

class Ex5Page extends StatefulWidget {
  const Ex5Page({super.key});

  @override
  State<Ex5Page> createState() => _Ex5PageState();
}

class _Ex5PageState extends State<Ex5Page> {
  int _selectedIndex = 0;
  bool _isFabExpanded = false;

  static const List<String> _pages = ['Home', 'Search', 'Profile', 'Settings'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isFabExpanded = false;
    });
  }

  void _toggleFabMenu() {
    setState(() {
      _isFabExpanded = !_isFabExpanded;
    });
  }

  void _handleFabOption(String option) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opção selecionada: $option'),
        duration: const Duration(seconds: 2),
      ),
    );
    setState(() {
      _isFabExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAB in BottomBar Navigation'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Conteúdo principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _pages[_selectedIndex],
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Página: ${_selectedIndex + 1}',
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          ),
          // Menu de opções do FAB (expandido)
          if (_isFabExpanded)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isFabExpanded = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFabOption('Add', Icons.add, Colors.green),
                        const SizedBox(height: 16),
                        _buildFabOption('Edit', Icons.edit, Colors.blue),
                        const SizedBox(height: 16),
                        _buildFabOption('Delete', Icons.delete, Colors.red),
                        const SizedBox(height: 16),
                        _buildFabOption('Share', Icons.share, Colors.orange),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Esquerda
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(0, Icons.home, 'Home'),
                    _buildNavItem(1, Icons.search, 'Search'),
                  ],
                ),
              ),
              // Centro (espaço para o FAB)
              const SizedBox(width: 60),
              // Direita
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(2, Icons.person, 'Profile'),
                    _buildNavItem(3, Icons.settings, 'Settings'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleFabMenu,
        tooltip: 'Menu de opções',
        child: AnimatedRotation(
          turns: _isFabExpanded ? 0.125 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.blue : Colors.grey, size: 24),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFabOption(String label, IconData icon, Color color) {
    return FloatingActionButton.extended(
      onPressed: () => _handleFabOption(label),
      icon: Icon(icon),
      label: Text(label),
      backgroundColor: color,
      heroTag: label,
    );
  }
}
