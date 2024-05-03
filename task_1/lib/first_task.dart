import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstTask extends StatelessWidget {
  const FirstTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.white, child: Text('First Task')),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(children: [
              Image.network(
                'https://i1.adis.ws/i/canon/get-inspired-landscape-photography-tips-1-16.9_e7ae10efb78c4526801d6037f80ab177?\$hero-header-half-16by9-dt-jpg\$',
                /* errorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/manzara1.jpeg') */
              ),
              Text(
                'https://i1.adis.ws/i/canon/get-inspired-landscape-photography-tips-1-16.9_e7ae10efb78c4526801d6037f80ab177?\$hero-header-half-16by9-dt-jpg\$',
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: CardWidget(),
                  ),
                  Expanded(
                    child: CardWidget(),
                  ),
                  Expanded(
                    child: Card(
                        margin: EdgeInsets.zero,
                        color: Colors.red,
                        child: SizedBox(
                          height: 100.0,
                          child: Center(
                            child: Text(
                              'Card Widget',
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          print(
                              "https://i1.adis.ws/i/canon/get-inspired-landscape-photography-tips-1-16.9_e7ae10efb78c4526801d6037f80ab177?\$hero-header-half-16by9-dt-jpg\$");
                        },
                        child: Text('BUTTON')),
                  ),
                ],
              )
            ])));
  }
}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
      color: Colors.red,
      child: SizedBox(
        height: 100.0,
        child: Center(
          child: Text(
            'Card Widget',
          ),
        ),
      ),
    );
  }
}
