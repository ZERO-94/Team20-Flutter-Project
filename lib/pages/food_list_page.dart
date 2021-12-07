import 'package:dinner_app/today_food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDayFoodProvider>(
      create: (_) => ToDayFoodProvider(),
      child: const MaterialApp(
        home: FoodListPage(),
      ),
    );
  }
}

List foodName = [
  "Bánh canh cua",
  "Bò bít tết",
  "Bò kho",
  "Bún riêu cua đồng",
  "Cháo sườn",
  "Cơm chiên cá mặn",
  "Mì Spaghetti  bò bằm",
  "Phở bò",
  "Phở gà",
  "Xôi",
];

class FoodListPage extends StatelessWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF6284D),
          bottom: TabBar(
            tabs: [
              Column(
                children: const [
                  Tab(
                    height: 35.0,
                    icon: Icon(Icons.house),
                  ),
                  Text('Trang chủ')
                ],
              ),
              Column(
                children: const [
                  Tab(
                    height: 35.0,
                    icon: Icon(Icons.restaurant),
                  ),
                  Text('Ngăn bếp của tôi')
                ],
              ),
              Column(
                children: const [
                  Tab(height: 35.0, icon: Icon(Icons.person)),
                  Text('Ngăn bếp của tôi')
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 11,
              itemBuilder: (context, index) {
                bool isSaved = Provider.of<ToDayFoodProvider>(context)
                    .getItems
                    .contains(index - 1);
                if (index == 0) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 25.0),
                      child: Text(
                        'Bữa sáng',
                        style: TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          bool isSaved = Provider.of<ToDayFoodProvider>(context)
                              .getItems
                              .contains(index - 1);
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
                                      foodName[index - 1],
                                      style: const TextStyle(
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 25.0,
                                        ),
                                        Image.asset(
                                          'images/${index - 1}.png',
                                          width: 175.0,
                                          height: 175.0,
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Chỉ số kcal: 100 kcal'),
                                            const SizedBox(
                                              height: 15.0,
                                            ),
                                            const Text(
                                                'Thành phần ding dưỡng: \n tinh bột , chât xơ'),
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
                                                    shape: MaterialStateProperty
                                                        .all(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(19.0),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    if (isSaved) {
                                                      Provider.of<ToDayFoodProvider>(
                                                              context,
                                                              listen: false)
                                                          .removeItem(
                                                              index - 1);
                                                    } else {
                                                      Provider.of<ToDayFoodProvider>(
                                                              context,
                                                              listen: false)
                                                          .addItem(index - 1);
                                                    }

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
                                                              'Xoá khỏi bếp',style: TextStyle(
                                                          color: Colors
                                                              .black),)
                                                          : const Text(
                                                              'Thêm vào bếp',

                                                            )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
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
                                              children: const [
                                                SizedBox(
                                                  width: 55.0,
                                                ),
                                                Text(
                                                  'Cua biển 3 con\nNấm rơm 100 gr\nChân giò 1/4 kg\nXương heo 1 kg\nTrứng cút 15 quả\nBột năng 1/2 kg\nBột gạo 1/2 kg\nGia vị 10 gr\n(muối/hành/tiêu/nước mắm/dầu ăn',
                                                  style:
                                                      TextStyle(fontSize: 15.0),
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
                                              children: const [
                                                SizedBox(
                                                  width: 55.0,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Làm bánh canh\nCho bột gạo, bột năng, một ít muối và 500ml nước nóng già vào thau để nhào bột. Cho nước nóng già vào hỗn hợp bột và nhào mịn đến khi thấy bột không dính tay nữa thì mang ra cán thật mỏng và cắt sợi.\nĐun sôi một nồi nước, thả bánh canh vừa cắt vào luộc đến khi sợi bánh canh nổi lên thì vớt ra ngâm vào nước lạnh.\nSơ chế cua\nCua biển mua về rửa sạch, hấp chín, gỡ lấy phần thịt và gạch để riêng. Cho hành băm nhuyễn vào chảo phi thơm với dầu ăn, rồi xào thịt cua cùng ít mắm, tiêu cho thơm.\nGạch cua bạn cũng phi hành khô, xào qua, để riêng.\nSơ chế các nguyên liệu khác\nNấm rơm rửa sạch, ngâm nước muối loãng, bổ dọc, cho vào chảo xào qua.\nThịt chân giò luộc chín, thái khoanh. Trứng cút luộc chín rồi bóc vỏ.\nNấu nước dùng\nXương lợn chần qua nước sôi, rửa sạch rồi cho vào nồi nước lạnh ninh lấy nước dùng. Phi hành thơm vào nồi và đổ nước hầm xương vào.\nSau khi nêm nếm vừa ăn thì đợi đến lúc nước sôi nhẹ và cho nấm rơm vào cùng.\nHòa một ít bột năng đổ từ từ vào nồi nước dùng, vừa đổ vừa khuấy đều để tạo độ sánh.\nXếp bánh canh ra bát, cho thịt chân giò, thịt cua, gạch cua, trứng cút lên trên. Chan nước dùng rồi rắc hành, mùi, hạt tiêu lên trên và thưởng thức.\nThành phẩm\nBánh canh cua thơm ngon, hấp dẫn, nước dùng thanh ngọt kết hợp với thịt cua dai chắc và sợi bánh canh mềm không bị cứng chắc chắn sẽ khiến bạn hài lòng.',
                                                    style: TextStyle(
                                                        fontSize: 15.0),
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(19.0),
                          color: Colors.white),
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
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'images/${index - 1}.png',
                                ),
                              ),
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
                                foodName[index - 1],
                                style: const TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 13.0,
                              ),
                              const Text('Chỉ số kcal: 100 kcal'),
                              const SizedBox(
                                height: 13.0,
                              ),
                              Text(
                                'Nguyên liêu bơ,bánh mì ,mức...',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.grey.withOpacity(0.9)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 49.0,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        isSaved ? Colors.grey : const Color(0xFFF6284D),
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
                                        Provider.of<ToDayFoodProvider>(context,
                                                listen: false)
                                            .removeItem(index - 1);
                                      } else {
                                        Provider.of<ToDayFoodProvider>(context,
                                                listen: false)
                                            .addItem(index - 1);
                                      }
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(isSaved
                                              ? '${foodName[index - 1]} bị xoá khỏi bếp của bạn'
                                              : '${foodName[index - 1]} được thêm vào bếp của bạn'),
                                          duration: const Duration(milliseconds: 1000),
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
                                                'Thêm vào bếp',
                                              )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Text(''),
          Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      Provider.of<ToDayFoodProvider>(context).getItems.length,
                  itemBuilder: (_, index) {
                    return Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'images/${Provider.of<ToDayFoodProvider>(context).getItems[index]}.png'))),
                    );
                  })
            ],
          )
        ]),
      ),
    );
  }
}
