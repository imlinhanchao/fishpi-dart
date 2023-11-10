import '../main.dart';
import 'base.dart';

class BreezemoonCmd implements CommandInstance {

  @override
  ArgParser command(ArgParser parser) {
    return parser;
  }

  @override
  Future<void> exec(ArgResults args, PrintFn print) async {
  }

  @override
  Future<bool> call(String command) async {
    if (command.trim().isEmpty) return false;
    return false;
  }

  @override
  Future<bool> page(String command) async {
    return false;
  }
}