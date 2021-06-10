import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/models/product2.dart';
import 'package:shoppy/services/product_api.dart';

class CardBody extends StatefulWidget {
  const CardBody({Key? key}) : super(key: key);

  @override
  _CardBodyState createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  Products? _productCard;
  Products? newDataList;
  @override
  void initState() {
    super.initState();

    _gettrainlanes();
  }

  _gettrainlanes() {
    Shop.getdata().then((productCard) {
      setState(() {
        _productCard = productCard;
        // Initialize to the list from Server when reloading...
        newDataList = productCard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _productCard!.payload!.content!
                  .map<Widget>((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                    height: 80,
                                    width: 80,
                                    child:
                                        Image.network(e.thumbnail.toString())),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.displayName.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            e.mrp.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            e.salePrice.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
