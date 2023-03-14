import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_app_news/src/services/news.dart';

class tabs extends StatelessWidget {
  const tabs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<news>(context);

    return ChangeNotifierProvider(
      create: (_) => _page_current(),
      child: Scaffold(
        body: Center(
          child: _PageView(),
        ),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _PageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_page_current>(context);

    return PageView(
      controller: provider._pageControllers,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_page_current>(context);

    return BottomNavigationBar(
      currentIndex: provider.paginaActual,
      onTap: (value) {
        provider.paginaActual = value;
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined), label: "Add"),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm), label: "delete"),
      ],
    );
  }
}

class _page_current with ChangeNotifier {
  PageController _pageControllers = new PageController();
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageControllers.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.bounceIn);
    notifyListeners();
  }
}
