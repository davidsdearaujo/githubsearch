import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubsearch/models/github_model.dart';

class UserWidget extends StatelessWidget {
  final GithubModel model;
  final void Function() onPressed;

  const UserWidget(this.model, {Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(model.avatarUrl),
          radius: 30,
        ),
        SizedBox(height: 8),
        Text(model.name, style: Theme.of(context).textTheme.subtitle),
        SizedBox(height: 8),
        if (model.bio != null)
          Text(
            model.bio,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              "VER PERFIL",
              style: Theme.of(context).primaryTextTheme.button,
            ),
            onPressed: onPressed,
          ),
        )
      ],
    );
  }
}
