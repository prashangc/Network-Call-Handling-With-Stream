import 'package:flutter/material.dart';

var kStyleTitle = const TextStyle(
  fontFamily: 'Lato',
  fontSize: 26,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

var kStyleNormal = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.w400);

var kStyleNormalTextField = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    color: Colors.grey,
    fontWeight: FontWeight.w400);

var kStyleElevatedButton = ElevatedButton.styleFrom(
  primary: Colors.blue,
  padding: const EdgeInsets.all(8.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);

double maxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

goThere(BuildContext context, screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}


go(BuildContext context, screen) {
  Navigator.of(context).pushReplacementNamed(screen);
}

double maxHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class SizedBox16 extends StatelessWidget {
  const SizedBox16({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16.0,
    );
  }
}

class SizedBox8 extends StatelessWidget {
  const SizedBox8({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 8.0,
      width: 8.0,
    );
  }
}

class SizedBox32 extends StatelessWidget {
  const SizedBox32({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 32.0,
    );
  }
}
