import 'package:flutter/material.dart';
import 'package:hero/hero_model.dart';
import 'package:hero/heroes_controller.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _buildItems(HeroModel model) {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListTile(
      onTap: () {
        heroesController.checkFavorite(model);
      },
      title: Text(model.name),
      trailing: model.isFavorite
          ? Icon(Icons.star, color: Colors.yellow)
          : Icon(Icons.star_border),
    );
  }

  _buildList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListView.builder(
        itemCount: heroesController.heroes.length,
        itemBuilder: (context, index) {
          return _buildItems(heroesController.heroes[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero App'),
        leading: Consumer<HeroesController>(
            builder: (context, heroesController, widget) {
          return Center(
            child: Text(
                "${heroesController.heroes.where((i) => i.isFavorite).length}",
                style: TextStyle(fontSize: 18)),
          );
        }),
      ),
      body: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
        return _buildList();
      }),
    );
  }
}
