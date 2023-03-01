import 'dart:async';


a1()async{
  String ares = "a1call";
  print(ares);
  return ares;
}

// returns string properly
a2()async{
  String ares = "a2init";
  print(ares);
  return await Future.delayed(Duration(seconds:1), ()async{
    ares = "a2call";
    return ares;
  });
}

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

// shows how a4 waits for a3 in the "then" block but not outside
// can also be accomplished by awaiting a2
bool run_a4_after_a3 = false;


void main()async{
  var a1res =  await a1();
  print("a1 res ~ " + a1res);

  // returns string properly
  a2().then((a2res) async{
    print("a2 res ~ " + a2res);
    var a3res =  await a3(a2res);
    print("a3 res ~ " + a3res);

    if (run_a4_after_a3 == true){
      var a4res =  await a4();
      print("a4 res ~ " + a4res);
    }
  });

  if (run_a4_after_a3 == false){
    var a4res =  await a4();
    print("a4 res ~ " + a4res);
  }




}