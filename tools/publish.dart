import 'dart:io';

import 'pre_publish.dart';

void main(List<String> arguments) async {
  await pre();
  await Process.start('dart', ['pub', 'publish', ...arguments],
      environment: {'PUB_HOSTED_URL': ''},
      runInShell: true, mode: ProcessStartMode.detachedWithStdio);
}
