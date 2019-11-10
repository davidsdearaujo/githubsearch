import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubsearch/models/repository_model.dart';

class RepositoryTile extends StatelessWidget {
  final RepositoryModel model;

  const RepositoryTile(this.model, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/details/repository",
          arguments: model,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: <Widget>[
            Container(
              color: Theme.of(context).dividerColor,
              padding:
                  EdgeInsets.fromLTRB(model.hasLanguage ? 28 : 15, 15, 15, 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Visibility(
                          visible: model.hasLanguage,
                          child: SizedBox(height: 13),
                        ),
                        Text(
                          model.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text("${model.description}"),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
            if (model.hasLanguage)
              Banner(
                message: model.language,
                location: BannerLocation.topStart,
                color: Theme.of(context).primaryColor,
              )
          ],
        ),
      ),
    );
  }
}
