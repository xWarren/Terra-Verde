import 'package:flutter/material.dart';

class CommonShimmer extends StatefulWidget {
  final double? width;
  final double? height;
  final Duration duration;
  final bool showShimmer;

  const CommonShimmer({
    super.key,
    this.width,
    this.height,
    this.duration = const Duration(milliseconds: 1500),
    this.showShimmer = true,
  });

  @override
  State<StatefulWidget> createState() => _CommonShimmerState();
}

class _CommonShimmerState extends State<CommonShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.showShimmer
        ? AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.grey.withOpacity(0.5),
                      Colors.grey.withOpacity(0.2),
                    ],
                    stops: [
                      0.0,
                      _animation.value - 0.2,
                      _animation.value,
                    ],
                    begin: Alignment(-1.0 - (_animation.value * 3), 0.0),
                    end: Alignment(1.0 + (_animation.value * 3), 0.0),
                  ).createShader(
                      Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              );
            },
          )
        : Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15)
            ),
          );
  }
}