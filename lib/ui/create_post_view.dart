import 'package:flutter/material.dart';
import 'package:flutter_json/api/api_provider.dart';
import 'package:flutter_json/models/post_model.dart';

class CreatePostView extends StatefulWidget {
  CreatePostView({Key key}) : super(key: key);

  @override
  _CreatePostViewState createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _userIdController =
      new TextEditingController(text: "ck7picmbj0001zq3oyx536la4");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              obscureText: false,
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title ...',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: false,
              controller: _userIdController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'UserId ...',
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
                height: 50.0,
                minWidth: double.infinity,
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text("Submit"),
                onPressed: () {
                  print(_titleController.text);
                  print(_userIdController.text);
                  ApiProvider()
                      .createPost(Post(
                          id: null,
                          title: _titleController.text,
                          userId: _userIdController.text))
                      .then(
                    (data) {
                      print("${data.user.displayName}");
                      return Navigator.pushNamed(context, "/");
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
