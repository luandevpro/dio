import 'package:flutter/material.dart';
import 'package:flutter_json/api/api_provider.dart';
import 'package:flutter_json/models/post_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  listBuilder(List<Post> post) {
    return ListView.separated(
      itemCount: post.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: Text("$index"),
          title: Text("${post[index].title}"),
          subtitle: Text("@.${post[index].user.displayName}"),
          trailing: Icon(Icons.navigate_next),
        );
      },
      separatorBuilder: (ctx, index) => Divider(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'createPost');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: FutureBuilder(
          future: ApiProvider().getPosts(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return CircularProgressIndicator();
                break;
              case ConnectionState.waiting:
                return CircularProgressIndicator();
                break;
              case ConnectionState.active:
                return CircularProgressIndicator();
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return CircularProgressIndicator();
                } else {
                  return listBuilder(snapshot.data);
                }
                break;
              default:
                return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
