import 'dart:async';


a1()async{
  String ares = "a1call";
  print(ares);
  return ares;
}

// return string properly
a2()async{
  String ares = "a2init";
  print(ares);
  var aresp =  await Future.delayed(Duration(seconds:1), ()async{
    ares = "a2call";
    return ares;
  });
  return aresp;
}

// an alternative syntax also returns string properly
a3(arg_in)async{
  String ares = "a3init";
  print(ares);
  print("a3 arg in ~ " + arg_in);
  return await Future.delayed(Duration(seconds:1), ()async{
    arg_in = "a3_changed_arg";
    return arg_in;
  });
}

a4()async{
  String ares = "a4call";
  print(ares);
  return ares;
}


void main()async{
  var a1res =  await a1();
  print("a1 res ~ " + a1res);

  // returns string properly
  var a2res =  await a2();
  print("a2 res ~ " + a2res);

  var a3res =  await a3(a2res);
  print("a3 res ~ " + a3res);

  var a4res =  await a4();
  print("a4 res ~ " + a4res);


}
