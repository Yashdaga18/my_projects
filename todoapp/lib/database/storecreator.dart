import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:todoapp/models/model.dart';
import '../objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<Todos> todoBox;

  ObjectBox._create(this.store) {
    todoBox = Box<Todos>(store);
  }

  static Future<ObjectBox> create() async {
    final docDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docDir.path, 'obx-example'));
    return ObjectBox._create(store);
  }
}
