import 'package:flutter/material.dart';
import 'package:jokempo/app/modules/game/controller/move/move_controller.dart';

class SelectMove extends StatefulWidget {
  final MoveStatusController moveStatusController;
  final double height;
  final PageController pageController = PageController(initialPage: 0);
  
  SelectMove(
      {Key? key, required this.moveStatusController, required this.height})
      : super(key: key);

  @override
  _SelectMoveState createState() => _SelectMoveState();
}

class _SelectMoveState extends State<SelectMove> {
  var avatarSelected = 'pedra';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.height + widget.height / 2,
      child: Stack(
        children: [
          SizedBox(
            height: widget.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.elasticOut);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: (widget.height) * 30 / 100,
                  height: widget.height,
                ),
                const SizedBox(
                  width: 3,
                ),
                GestureDetector(
                  onTap: () {
                    widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.elasticOut);
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: const BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
              width: (widget.height) * 78 / 100,
              height: widget.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: widget.height / 2,
                        height: widget.height / 2,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          //pageSnapping: true,
                          physics: const BouncingScrollPhysics(),
                          controller: widget.pageController,
                          children: [
                            Image.asset("assets/images/pedra.png",
                                fit: BoxFit.fill),
                            Image.asset("assets/images/papel.png",
                                fit: BoxFit.fill),
                            Image.asset("assets/images/tesoura.png",
                                fit: BoxFit.fill)
                          ],
                          onPageChanged: (pageNumber) {
                            setState(() {
                              if (pageNumber == 0) {
                                widget.moveStatusController.moveSelected = 'pedra';
                              } else if (pageNumber == 1) {
                                widget.moveStatusController.moveSelected = 'papel';
                              } else {
                                widget.moveStatusController.moveSelected = 'tesoura';
                              }
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.moveStatusController.moveSelected,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
