import 'dart:async';


a1()async{
  String ares = "a1call";
  print(ares);
  return ares;
}

a2()async{
  String ares = "a2call";
  print(ares);
  await Future.delayed(Duration(seconds:1), (){
    return ares;
  });
}

a3()async{
  String ares = "a3call";
  print(ares);
  return ares;
}

void main()async{
await a1().then((a1res)async{
  print("a1 res ~ " + a1res);

  //returns null while future completes
  await a2().then((a2res)async{
      print("a2 res ~ " + a2res.toString());
   await a3().then((a3res){
      print("a3 res ~ " + a3res);
    });
  });

});

}
