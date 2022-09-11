import 'package:flutter/material.dart';



class SlidingLayer extends StatefulWidget {
  final int animationSpeed;
  final Widget child1;
  final Widget child2;

  const SlidingLayer({
    Key? key,
    this.animationSpeed = 400,
    required this.child1,
    required this.child2,
  }) : super(key: key);

  @override
  State<SlidingLayer> createState() => _SlidingLayerState();
}

class _SlidingLayerState extends State<SlidingLayer> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;
  late Animation<Offset> _offset2;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.animationSpeed));
    _offset = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(1, 0))
        .animate(_controller);

    _offset2 = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          switch (_controller.status) {
            case AnimationStatus.completed:
              _controller.reverse();
              break;
            case AnimationStatus.dismissed:
              _controller.forward();
              break;
            default:
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SlideTransition(
              position: _offset,
              child: widget.child1,
            ),
            SlideTransition(
              position: _offset2,
              child: widget.child2,
            )
          ],
        )
    );
  }
}
