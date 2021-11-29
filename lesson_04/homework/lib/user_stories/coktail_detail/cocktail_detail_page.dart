
import 'views/cocktail_rating_view.dart';
import 'views/cocktail_recipe_view.dart';
import 'views/cocktail_header_view.dart';
import 'views/cocktail_ingredient_view.dart';
import 'views/cocktail_description_view.dart';
import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:homework/components/components.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
      this.cocktail, {
        Key key,
      }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: _examplePage()
    );
  }

  Widget _appBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomIconButton(svgPictureName: "assets/images/icon_back.svg", normalColor: Colors.white),
        actions: [
          Row(children: [
            CustomIconButton(svgPictureName: "assets/images/icon_out.svg", normalColor: Colors.white),
            SizedBox(width: 16)
          ])
    ]);
  }

  Widget _examplePage() {
    return Container(
        color: Colors.black,
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SafeArea(
                top: false,
                left: false,
                right: false,
                bottom: true,
                child: Column(children: [
                  CocktailHeaderView(
                      link:
                          'https://www.thecocktaildb.com/images/media/drink/yrtxxp1472719367.jpg'),
                  CocktailDescriptionView(
                    liked: true,
                    title: "Арбузный мохито",
                    identifier: "Id:12864",
                    cocktailCategory: "Coctail",
                    cocktailType: "Алкогольный",
                    glassType: "Хайбол",
                  ),
                  CocktailIngredientView(items: [
                    CocktailIngredientItem(
                        name: "Листья мяты", measure: "4 шт"),
                    CocktailIngredientItem(name: "Лайм", measure: "½ шт"),
                    CocktailIngredientItem(
                        name: "Сахар", measure: "1 ст. ложка"),
                    CocktailIngredientItem(name: "Белый ром", measure: "60 мл"),
                    CocktailIngredientItem(name: "Лёд", measure: "½ стакана"),
                    CocktailIngredientItem(
                        name: "Мякоть арбуза", measure: "120 г"),
                  ]),
                  CocktailRecipeView(
                      text:
                          "В большом бокале смешайте порванные листья мяты, разрезанный на кусочки лайм и сахар. Толкушкой хорошо раздавите, чтобы лайм пустил сок."),
                  CocktailRatingView(),
                ]))));
  }
}
