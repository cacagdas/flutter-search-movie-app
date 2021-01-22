import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_movie_app/ui/pages/home/home.page.dart';
import 'package:search_movie_app/ui/widgets/app_bar.dart';
import 'package:search_movie_app/ui/widgets/button.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _form = GlobalKey<FormState>();
  String _query = '';
  
  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    _form.currentState.save();

    _goToHomePage();
  }

  void _goToHomePage() {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (_) => HomePage(query: _query,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColorLight,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Search',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 32.0, horizontal: 16.0),
                        child: Form(
                          key: _form,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Movie Title'),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please provide a value.';
                              return null;
                            },
                            onSaved: (value) {
                              _query = value;
                            },
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: ButtonWidget(
                            label: 'Search',
                            disabled: false,
                            onPress: () => _saveForm(),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
