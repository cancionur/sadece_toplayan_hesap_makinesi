import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  String veri = "";
  int toplam = 0;
  int tempToplam = 0;
  List<String> temp = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Toplayan Hesap Makinesi"),centerTitle: true,),
      body: Center(
        child: Column(
          children:  [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(width: double.infinity,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: Text("=$tempToplam"),
              ),
            ),
            Container(width: double.infinity,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: Text("$veri"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "7";
                    });
                  }, child: Text("7",style: TextStyle(fontSize: 25),))),
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "8";
                    });
                  }, child: Text("8",style: TextStyle(fontSize: 25),))),
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "9";
                    });
                  }, child: Text("9",style: TextStyle(fontSize: 25),))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "4";
                    });
                  }, child: Text("4",style: TextStyle(fontSize: 25),))),
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "5";
                    });
                  }, child: Text("5",style: TextStyle(fontSize: 25),))),
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "6";
                    });
                  }, child: Text("6",style: TextStyle(fontSize: 25),))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "1";
                    });
                  }, child: Text("1",style: TextStyle(fontSize: 25),))),
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "2";
                    });
                  }, child: Text("2",style: TextStyle(fontSize: 25),))),
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "3";
                    });
                  }, child: Text("3",style: TextStyle(fontSize: 25),))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      if(veri.lastIndexOf("+") == veri.length-1){ //tekrardan + basmasın diye
                        return;
                      }
                      veri += "+";
                    });
                  }, child: Text("+",style: TextStyle(fontSize: 25),))),
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                    setState(() {
                      veri += "0";
                    });
                  }, child: Text("0",style: TextStyle(fontSize: 25),))),
                  SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){

                    setState((){
                      if(veri.lastIndexOf("+") == veri.length-1){
                        veri = veri.substring(0, veri.length - 1);
                      }

                      temp = veri.split("+");
                      for(var i = 0 ; i<temp.length;i++){
                        toplam+= int.parse(temp[i]);
                      }
                      tempToplam = toplam;
                      toplam = 0;
                      veri = "$tempToplam";

                    });

                  }, child: Text("=",style: TextStyle(fontSize: 25),))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                      setState(() {
                        veri = "";
                      });
                    }, child: Text("C",style: TextStyle(fontSize: 25),))),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 145.0),
                    child: SizedBox(width: 100, height: 50,child: ElevatedButton(onPressed: (){
                      setState(() {

                        if(veri.isEmpty){
                          return;
                        }

                        veri = veri.substring(0, veri.length - 1);
                      });
                    }, child: Icon(Icons.arrow_back_ios))),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
