import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubsearch/widgets/user_widget.dart';
import 'package:select_dialog/select_dialog.dart';

import '../animations/button_animation2.dart';
import '../models/github_list_model.dart';
import '../models/github_model.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with ButtonAnimation {
  final _usersList = <GithubModel>[];

  @override
  Widget build(BuildContext context) {
    return buttonWidget(
      child: Scaffold(
        appBar: AppBar(title: Text("Github Search")),
        body: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 50),
          controller: scrollController,
          itemCount: _usersList.length,
          separatorBuilder: (_, i) => SizedBox(height: 25),
          itemBuilder: (context, index) {
            final model = _usersList.reversed.elementAt(index);
            return UserWidget(
              model,
              onPressed: () async {
                // setAddButtonVisible(false);
                await Navigator.pushNamed(context, "/details", arguments: model);
                // setAddButtonVisible(true);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void onButtonAddTap() async {
    // setAddButtonVisible(false);
    await SelectDialog.showModal<GithubListModel>(
      context,
      onChange: (listModel) async {
        final response =
            await Dio().get("https://api.github.com/users/${listModel.login}");
        final userModel = GithubModel.fromJson(response.data);
        setState(() {
          _usersList.add(userModel);
        });
      },
      onFind: (String searchText) async {
        if (searchText == "") searchText = "a";
        final response = await Dio()
            .get("https://api.github.com/search/users?q=${searchText ?? "a"}");
        return GithubListModel.fromJsonList(response.data["items"]);
      },
      itemBuilder: (context, model, isSelected) {
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(model.avatarUrl)),
          title: Text(model.login),
          subtitle: Text(model.htmlUrl),
        );
      },
    );

    // setAddButtonVisible(true);
  }
}
