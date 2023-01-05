import 'package:objectbox/objectbox.dart';

@Entity()
class Todos {
  @Id()
  int id = 0;
  String? task;
  bool isDone;
  Todos(this.task, [this.isDone = false]);
}
