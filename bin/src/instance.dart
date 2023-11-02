import 'package:args/args.dart';
import 'package:fishpi/fishpi.dart';

class Instance {
  static final Fishpi _fishpi = Fishpi();
  static Fishpi get get => _fishpi;
}

abstract class CommandRegister {
  ArgParser command(ArgParser parser);
  Future<void> exec(ArgResults args);
}

ArgParser registerCommand(List<CommandRegister> register) {
  var parser = ArgParser();
  for (var item in register) {
    parser = item.command(parser);
  }
  return parser;
}