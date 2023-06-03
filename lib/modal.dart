class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false
  });

   static List<ToDo> todoList(){
    return[
      ToDo(id:'01', todoText: 'Breakfast', isDone: true),
      ToDo(id:'02', todoText: 'Off to office', isDone: true),
      ToDo(id:'03', todoText: 'check emails'),
      ToDo(id: '04', todoText: 'Review on going project'),
      ToDo(id: '05', todoText: 'Team meeting'),
      ToDo(id: '06', todoText: 'Client follow up'),
    ];
  }
}