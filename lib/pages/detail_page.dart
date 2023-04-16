import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit_states.dart';
import 'package:travelapp/cubit/app_cubits.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widgets/app_large_text_dart.dart';
import 'package:travelapp/widgets/app_text_dart.dart';
import 'package:travelapp/widgets/responsive_button.dart';

import '../widgets/app_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color? nullableColor;
  int gottenStars = 4;
  int slecetedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detailState = state as DetailState;
      print(detailState.place.name);
      return WillPopScope(
        onWillPop: () async {
          bool confirm = await showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Xác nhận'),
              content: Text('Bạn có muốn thoát khỏi màn hình hiện tại?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Không'),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text('Có'),
                ),
              ],
            ),
          );
          return confirm ?? false;
        },
        child: Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/welcome_three.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ],
                    )),
                Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detailState.place.name,
                                color: Colors.black54,
                              ),
                              AppLargeText(
                                text: "\$${detailState.place.price}",
                                color: nullableColor ?? Colors.orangeAccent,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.location_on,
                                color: Colors.orangeAccent,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                  text: detailState.place.location,
                                  color: Colors.black54),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < gottenStars
                                        ? Colors.orangeAccent
                                        : Colors.grey,
                                    size: 20,
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              AppText(
                                text: "(4.0)",
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: "PeoPle",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text: "Number of people in your group",
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    slecetedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButton(
                                    size: 60,
                                    color: slecetedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: slecetedIndex == index
                                        ? Colors.black
                                        : Colors.grey.withOpacity(0.3),
                                    borderColor: slecetedIndex == index
                                        ? Colors.black
                                        : Colors.grey,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppLargeText(
                            text: "Description",
                            color: Colors.black54,
                            size: 20,
                          ),
                          AppText(
                            text: detailState.place.description,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 20,
                    left: 20,
                    child: Row(
                      children: [
                        AppButton(
                            color: AppColors.textColor2,
                            backgroundColor: Colors.white,
                            size: 60,
                            icon: Icons.favorite_border,
                            isIcon: true,
                            borderColor: AppColors.textColor2),
                        const SizedBox(
                          width: 10,
                        ),
                        ResponsiveButton(
                          isResponsive: true,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
