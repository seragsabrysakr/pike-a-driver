import 'package:flutter/material.dart';

navigatefinish({required BuildContext context, required String screen}) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(screen, (Route<dynamic> route) => false);
}

navigateback({required BuildContext context}) {
  Navigator.canPop(context) ? Navigator.pop(context) : null;
}

navigateto({required BuildContext context, required String screen}) {
  Navigator.pushNamed(context, screen);
}

navigateandreplace({required BuildContext context, required String screen}) {
  Navigator.pushReplacementNamed(context, screen);
}

selectimage(BuildContext context,{VoidCallback? camera,VoidCallback? gallary}) {
  return showDialog(
      context: (context),
      builder: (context) {
        return SimpleDialog(
          title: const Text('Set profile image'),
          children: [
            SimpleDialogOption(
              child: const Text('Take a picture'),
              onPressed: camera,
            ),
            SimpleDialogOption(
              child: const Text('Choose from gallery'),
              onPressed: gallary,
            ),
          ],
        );
      });
      }
Future<dynamic> bottomSheet(context, Widget screen,
    {bool rootnavigator = true}) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      useRootNavigator: rootnavigator,
      isDismissible: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.8, //set this as you want
            maxChildSize: 0.8, //set this as you want
            minChildSize: 0.8, //set this as you want
            expand: true,
            builder: (context, scrollController) {
              return screen; //whatever you're returning, does not have to be a Container
            });
      });
}
