import 'package:flutter/material.dart';

void main() => runApp( MyApp());


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;

  var ShowElement = <String>['','','','','','','','',''];
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Tic Tac Toe"),
      ),
      backgroundColor: Colors.white,
      body: Column(
          children: <Widget>[
      Expanded(
      child: Container(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      ),
      ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black
                            )),
                        child: Center(
                          child: Text(
                            ShowElement[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      );

  }


void _tapped(int index) {
  setState(() {
    if (oTurn && ShowElement[index] == '') {
      ShowElement[index] = 'X';
      filledBoxes++;
    } else if (!oTurn && ShowElement[index] == '') {
      ShowElement[index] = 'O';
      filledBoxes++;
    }

    oTurn = !oTurn;
    _checkwinner();
    });
  }

void _checkwinner() {

    //checking rows

  if (ShowElement[0] == ShowElement[1] &&
      ShowElement[0] == ShowElement[2] &&
      ShowElement[0] !='') {
    _showWinDialog(ShowElement[0]);
    _X(ShowElement[0]);
  }

    if (ShowElement[3] == ShowElement[4] &&
        ShowElement[3] == ShowElement[5] &&
        ShowElement[3] !='') {
      _showWinDialog(ShowElement[3]);
      _X(ShowElement[3]);
    }

      if (ShowElement[6] == ShowElement[7] &&
          ShowElement[6] == ShowElement[8] &&
          ShowElement[6] !='') {
        _showWinDialog(ShowElement[6]);
        _X(ShowElement[6]);
      }

        //checkin columns
        if (ShowElement[0] == ShowElement[3] &&
            ShowElement[0] == ShowElement[6] &&
            ShowElement[0] !=''){
          _showWinDialog(ShowElement[0]);
          _X(ShowElement[0]);

        }

        if (ShowElement[1] == ShowElement[4] &&
            ShowElement[1] == ShowElement[7] &&
            ShowElement[1] !=''){
          _showWinDialog(ShowElement[1]);
          _X(ShowElement[1]);

        }

        if (ShowElement[2] == ShowElement[5] &&
            ShowElement[2] == ShowElement[8] &&
            ShowElement[2] !=''){
            _showWinDialog(ShowElement[2]);
            _X(ShowElement[2]);

        }

        //checking diagonal
        if (ShowElement[2] == ShowElement[5] &&
            ShowElement[2] == ShowElement[8] &&
            ShowElement[2] !=''){
            _showWinDialog(ShowElement[2]);
            _X(ShowElement[2]);
         }

        if (ShowElement[0] == ShowElement[4] &&
            ShowElement[0] == ShowElement[8] &&
            ShowElement[0] !=''){
            _showWinDialog(ShowElement[0]);
            _X(ShowElement[0]);

          }
        if (ShowElement[2] == ShowElement[4] &&
            ShowElement[2] == ShowElement[6] &&
            ShowElement[2] !=''){
            _showWinDialog(ShowElement[2]);
            _X(ShowElement[2]);

          }

        if (filledBoxes == 9) {
          _showDraw();
        }

}

void _X(String winner) {
  if (winner == 'X') {
    oTurn = true;
  }
}

void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" "+winner+" \" WINS!!"),
            actions: [
              TextButton(
            style: TextButton.styleFrom(
          foregroundColor: Colors.red,
          ),
          child: Text("Play Again"),
          onPressed: () {
          _clearboard();
          Navigator.of(context).pop();
          },
          )
          ],
          );
        });

}

void _showDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("DRAW"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: Text("Play Again"),
                onPressed: () {
                  _clearboard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
}

void _clearboard() {
    setState(() {
      for (int i = 0; i<9; i++) {
        ShowElement[i] = '';
      }
    });

    filledBoxes = 0;
}
}
