import 'dart:io';
void main(){
  performTasks();
}
void performTasks() async {
  task1();
  String  task2Result= await task2();
  task3(task2Result);
}
void task1(){
  String result = 'Task 1 data';
  print('Task 1 complete');
}
Future task2() async {
  Duration x=Duration(seconds: 3);
  String result = '';
  await Future.delayed(x,(){
    result = 'Task 2 data';
    print('Task 2 complete');
  });
  return result;
}
void task3(String task2result){
  String result = 'Task 3 data';
  print('Task 3 complete $task2result');
}
//
// String myMargin='15';
// double myMarginAsDouble=50.0;
// try{
//   myMarginAsDouble = double.parse(myMargin);
// }catch(e){
//   print(e);
// }
// return Scaffold(
// backgroundColor: Colors.grey,
// appBar: AppBar(
// title: Text('Hiiiii'),
// centerTitle: true,
// backgroundColor: Colors.blueGrey,
// ),
// body: Container(
// margin: EdgeInsets.all(myMarginAsDouble ?? 10.0),
// color: Colors.black,
// ),
// );