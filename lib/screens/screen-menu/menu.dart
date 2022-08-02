import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen-account/account.dart';
import '../screen-chart/chart.dart';
import '../screen-login/login.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final padding  = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 185,
      child: Material(
        color: const Color.fromRGBO(124, 77, 255, 1.0).withOpacity(0.9),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 70,
            ),
            Divider(color: Colors.white70),

            buildMenuItem(
              text: 'Conta',
              icon: Icons.account_circle_outlined,
              onClicked: ()=> selectedItem(context, 0),
            ),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
              text: 'Relatório',
              icon: Icons.pie_chart_sharp,
              onClicked: ()=> selectedItem(context, 1),
            ),
            const SizedBox(
              height: 500,
            ),
            Divider(color: Colors.white70),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
              text: 'Sair',
              icon: Icons.exit_to_app,
              onClicked: ()=> selectedItem(context, 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon,color: color,),
      title: Text(text,style: const TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index){
    Navigator.of(context).pop();
    switch(index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Account()));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chart()));
        break;

      case 2:
        Navigator.of(context).pop();
        break;
    }
  }

}