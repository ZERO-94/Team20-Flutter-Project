import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/pages/main_page.dart';
import 'package:food_app/provider_service/today_food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodListPage extends StatefulWidget {
  FoodListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final _firestore = FirebaseFirestore.instance;

  String? meal;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    setState(() {
      if (widget.title == 'Bữa sáng') {
        meal = 'breakfast';
      } else if (widget.title == 'Bữa trưa') {
        meal = 'lunch';
      } else if (widget.title == 'Bữa tối') {
        meal = 'dinner';
      } else {
        meal = 'side_meal';
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection('food_list')
                .doc(meal ?? 'breakfast')
                .collection('items')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                List<Food> foods = [];
                final meals = snapshot.data!.docs;
                for (var meal in meals) {
                  final name = (meal.data() as dynamic)['name'];
                  final imageUrl = (meal.data() as dynamic)['imageUrl'];
                  final kcal = (meal.data() as dynamic)['kcal'];
                  final nutrition = (meal.data() as dynamic)['nutrition'];
                  final ingredient = (meal.data() as dynamic)['ingredients'];
                  final recipe = (meal.data() as dynamic)['recipe'];
                  print(name.toString());
                  foods.add(Food(
                      name: name,
                      imageUrl: imageUrl,
                      kcal: kcal,
                      nutrition: nutrition,
                      ingredient: ingredient,
                      recipe: recipe));
                }
                print(foods[0].imageUrl);

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: foods.length + 1,
                    itemBuilder: (context, index) {
                      bool isSaved = Provider.of<ToDayFoodProvider>(context)
                          .getItems
                          .contains(index - 1);
                      if (index == 0) {
                        return Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 25.0, horizontal: 25.0),
                                child: Text(
                                  widget.title,
                                  style: const TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const MainPage(
                                              selectedPage: 2);
                                        }));
                                      },
                                      icon: const Icon(
                                        Icons.breakfast_dining,
                                        size: 31.0,
                                      )),
                                  const SizedBox(
                                    height: 9.0,
                                  ),
                                  const Text('Bếp của tôi')
                                ],
                              )
                            ],
                          ),
                        );
                      }
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                bool isSaved =
                                    Provider.of<ToDayFoodProvider>(context)
                                        .getImageUrls
                                        .contains(foods[index - 1].imageUrl);
                                return Container(
                                  color: const Color(0xFF737373),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25.0),
                                          topRight: Radius.circular(25.0),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 25.0,
                                          ),
                                          Text(
                                            foods[index - 1].name.toString(),
                                            style: const TextStyle(
                                                fontSize: 35.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 15.0),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 25.0,
                                              ),
                                              Container(
                                                width: 175.0,
                                                height: 155,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          foods[index - 1]
                                                              .imageUrl
                                                              .toString(),
                                                        ))),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        'Chỉ số kcal: ${foods[index - 1].kcal} kcal'),
                                                    const SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    SingleChildScrollView(
                                                      child: Text(
                                                        'Ding dưỡng:${foods[index - 1].nutrition} ',
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 13.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 15.0,
                                                        ),
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                              isSaved
                                                                  ? Colors.grey
                                                                  : const Color(
                                                                      0xFFF6284D),
                                                            ),
                                                            shape:
                                                                MaterialStateProperty
                                                                    .all(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            19.0),
                                                              ),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            if (isSaved) {
                                                              Provider.of<ToDayFoodProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .removeItem(
                                                                      index - 1,
                                                                      foods[index -
                                                                              1]
                                                                          .kcal,
                                                                      foods[index -
                                                                              1]
                                                                          .imageUrl,
                                                                      foods[index -
                                                                              1]
                                                                          .name);
                                                            } else {
                                                              Provider.of<ToDayFoodProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .addItem(
                                                                      index - 1,
                                                                      foods[index -
                                                                              1]
                                                                          .kcal,
                                                                      foods[index -
                                                                              1]
                                                                          .imageUrl,
                                                                      foods[index -
                                                                              1]
                                                                          .name);
                                                            }
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                isSaved
                                                                    ? Icons
                                                                        .delete
                                                                    : Icons
                                                                        .restaurant,
                                                              ),
                                                              const SizedBox(
                                                                width: 9.0,
                                                              ),
                                                              isSaved
                                                                  ? const Text(
                                                                      'Xoá khỏi bếp',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    )
                                                                  : const Text(
                                                                      'Thêm vào',
                                                                    )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Container(
                                              width: width,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      SizedBox(
                                                        width: 35.0,
                                                      ),
                                                      Text(
                                                        'Nguyên liệu:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 19.0),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 55.0,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          foods[index - 1]
                                                              .ingredient
                                                              .replaceAll(
                                                                  '\\n', '\n'),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      15.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 13.0,
                                                  ),
                                                  Row(
                                                    children: const [
                                                      SizedBox(
                                                        width: 35.0,
                                                      ),
                                                      Text(
                                                        'Công thức:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 19.0),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 55.0,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          foods[index - 1]
                                                              .recipe
                                                              .replaceAll(
                                                                  '\\n', '\n'),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      15.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: width,
                            height: height / 5.5,
                            child: Row(
                              children: [
                                Container(
                                  width: width / 3,
                                  height: height / 5.5,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(19.0),
                                        bottomLeft: Radius.circular(19.0)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(foods[index - 1]
                                            .imageUrl
                                            .toString())),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Text(
                                      foods[index - 1].name.toString(),
                                      style: const TextStyle(
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 13.0,
                                    ),
                                    Text(
                                        'Chỉ số kcal: ${foods[index - 1].kcal} kcal'),
                                    const SizedBox(
                                      height: 13.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const SizedBox(
                                          width: 55.0,
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              isSaved
                                                  ? Colors.grey
                                                  : const Color(0xFFF6284D),
                                            ),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(19.0),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (isSaved) {
                                              Provider.of<ToDayFoodProvider>(
                                                      context,
                                                      listen: false)
                                                  .removeItem(
                                                      index - 1,
                                                      foods[index - 1].kcal,
                                                      foods[index - 1].imageUrl,
                                                      foods[index - 1].name);
                                            } else {
                                              Provider.of<ToDayFoodProvider>(
                                                      context,
                                                      listen: false)
                                                  .addItem(
                                                      index - 1,
                                                      foods[index - 1].kcal,
                                                      foods[index - 1].imageUrl,
                                                      foods[index - 1].name);
                                            }
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(isSaved
                                                    ? '${foods[index - 1].name} bị xoá khỏi bếp của bạn'
                                                    : '${foods[index - 1].name} được thêm vào bếp của bạn'),
                                                duration: const Duration(
                                                    milliseconds: 1000),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                isSaved
                                                    ? Icons.delete
                                                    : Icons.restaurant,
                                              ),
                                              const SizedBox(
                                                width: 9.0,
                                              ),
                                              isSaved
                                                  ? const Text(
                                                      'Xoá khỏi bếp',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  : const Text(
                                                      'Thêm vào',
                                                    )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
