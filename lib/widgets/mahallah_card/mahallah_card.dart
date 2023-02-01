import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/data/mock_mahallah_data.dart';
import 'package:orderje/widgets/core/orderje_button.dart';
import 'package:orderje/widgets/core/orderje_image.dart';

class MahallahCard extends StatelessWidget {
  MahallahCard({super.key, required this.mahallahCafeData});

  MahallahCafe mahallahCafeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: OrderJeColors.black)),
      child: Column(
        children: [
          Container(
            height: 215,
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: OrderJeImage(
                mahallahCafeData.imageUrl,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: OrderJeColors.black))),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mahallahCafeData.mahallahName,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                mahallahCafeData.operatingHour,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF505050),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          width: 64,
                          decoration: BoxDecoration(
                              color: OrderJeColors.green,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: OrderJeColors.black)),
                          height: 25,
                          child: const Center(
                              child: Text(
                            'Open',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OrderJeButton(
                    buttonText: 'Order Here',
                    onPressed: () {
                      Navigator.pushNamed(context, '/order', arguments: mahallahCafeData);
                    },
                    height: 45,
                    buttonColor: OrderJeColors.purple,
                    buttonTextStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: OrderJeColors.black),
                    borderRadius: 10,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
