import 'dart:async';

 Future<int> someFunction()  async {
  int count = 0;
  // return Future(() {
    for (int i = 0; i < 1000000000; i ++) {
      count += i;
    }
    print("done");
    return count;
  // });
}

test2() async {
  print("begin");
  var a = await someFunction();
  print('end');
}

void _incrementCounter()  {
  print("above");
  test2();
  print("below");
}

void main()  {

  _incrementCounter();

}