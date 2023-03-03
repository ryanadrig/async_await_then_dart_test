import 'dart:async';

// compiler does not treat this as future, waits for value to return before continuing execution
 Future<int> expensive()  async {
  int count = 0;
    for (int i = 0; i < 1000000000; i ++) {
      count += i;
    }
    print("done");
    return count;
}

sync_tasks() async {
  print("begin");
  var a = expensive();
    print('end');
}

void sync_tasks_caller()  {
  print("above");
  sync_tasks();
  print("below");
}


Future<int> expensive2()  async {
  int count = 0;
  return Future(() {
    for (int i = 0; i < 1000000000; i ++) {
      count += i;
    }
    print("done");
    return count;
  });
}

sync_tasks2() async {
  print("begin");
  var a = await expensive2();
  print('end');
}

void sync_tasks_caller2()  {
  print("above");
  sync_tasks2();
  print("below");
}




void main()  {

  sync_tasks_caller();

  sync_tasks_caller2();

}