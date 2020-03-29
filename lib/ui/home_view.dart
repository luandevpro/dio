import 'package:flutter/material.dart';
import 'package:flutter_json/api/api_provider.dart';
import 'package:flutter_json/models/post_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<Post>> getPostsState;

  listBuilder(List<Post> post) {
    return ListView.separated(
      itemCount: post.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: Text("$index"),
          title: Text("${post[index].title}"),
          subtitle: Text("@.${post[index].user.displayName}"),
          trailing: FlatButton(
            onPressed: () {
              ApiProvider().deletePost("${post[index].id}").then((data) {
                print("$data");
                refreshGetPost();
              });
            },
            child: Icon(
              Icons.delete,
            ),
          ),
        );
      },
      separatorBuilder: (ctx, index) => Divider(),
    );
  }

  @override
  void initState() {
    super.initState();
    refreshGetPost();
  }

  refreshGetPost() {
    this.setState(() {
      getPostsState = ApiProvider().getPosts();
    });
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
          future: getPostsState,
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
