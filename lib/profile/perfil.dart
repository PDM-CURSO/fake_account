import 'package:fake_account/profile/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/picture_bloc.dart';

class Perfil extends StatelessWidget {
  Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your bank Pro'),
      ),
      body: Column(
        children: [
          _userPicture(),
          Text(
            "BIENVENIDO",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black),
          ),
          Text("User${UniqueKey()}"),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularButton(
                bgColor: Colors.indigo,
                iconData: Icons.credit_card,
                textAction: "Cards",
              ),
              CircularButton(
                bgColor: Colors.orange,
                iconData: Icons.camera_alt_rounded,
                textAction: "Take picture",
                action: () {
                  BlocProvider.of<PictureBloc>(context).add(CambiarFotoEvent());
                },
              ),
              CircularButton(
                bgColor: Colors.green,
                iconData: Icons.play_arrow,
                textAction: "Tutorial",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _userPicture() {
    return BlocConsumer<PictureBloc, PictureState>(
      listener: (context, state) {
        if (state is PictureErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${state.errorMsg}"),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PictureSelectedState) {
          return CircleAvatar(
            radius: 84,
            child: Image.file(state.picture),
          );
        }
        return CircleAvatar(radius: 84);
      },
    );
  }
}
