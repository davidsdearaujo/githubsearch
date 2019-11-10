import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:githubsearch/models/github_model.dart';

import '../models/repository_model.dart';
import '../widgets/repository_tile.dart';

class DetailsPage extends StatefulWidget {
  final GithubModel model;

  const DetailsPage(this.model, {Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<List<RepositoryModel>> future;

  @override
  void initState() {
    super.initState();
    future = getRepositories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.model.name)),
      body: FutureBuilder<List<RepositoryModel>>(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              padding: EdgeInsets.all(50),
              itemCount: snapshot.data.length + 1,
              separatorBuilder: (_, i) => SizedBox(height: 20),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.model.avatarUrl),
                          radius: 50,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.model.name,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      SizedBox(height: 8),
                      if (widget.model.bio != null)
                        Text(
                          widget.model.bio,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                    ],
                  );
                } else {
                  return RepositoryTile(snapshot.data[index - 1]);
                }
              },
            );
          }
        },
      ),
    );
  }

  Future<List<RepositoryModel>> getRepositories() async {
    final response = await Dio().get(widget.model.reposUrl);
    return RepositoryModel.fromJsonList(response.data);
  }
}
