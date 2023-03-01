import 'dart:async';


a1()async{
  String ares = "a1call";
  print(ares);
  return ares;
}

a2()async{
  String ares = "a2init";
  print(ares);
  await Future.delayed(Duration(seconds:1), (){
    ares = "a2call";
    return ares;
  });
}

a3()async{
  String ares = "a3call";
  print(ares);
  return ares;
}

void main()async{
  var a1res =  await a1();
  print("a1 res ~ " + a1res);

  // returns string properly
  var a2res =  await a2();
  print("a2 res ~ " + a2res);

  var a3res =  await a3();
  print("a3 res ~ " + a3res);
}