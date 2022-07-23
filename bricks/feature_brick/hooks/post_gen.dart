import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;
  final directory = Directory.current.path;

  List<String> folders;
  if (Platform.isWindows) {
    folders = directory.split(r'\').toList();
  } else {
    folders = directory.split('/').toList();
  }
  final libIndex = folders.indexWhere((folder) => folder == 'lib');

  final progress = logger.progress('Creating your tests!');

  final featureTestGen =
      await MasonGenerator.fromBundle(featureBrickTestsBundle);
  await featureTestGen.generate(
    DirectoryGeneratorTarget(
      Directory(('${folders.sublist(0, libIndex).join('/')}/test')),
    ),
    logger: logger,
    vars: context.vars,
  );

  progress.complete(green.wrap('Tests created!') as String);
}

final featureBrickTestsBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path":
          "{{feature_name.snakeCase()}}\\view\\widgets\\{{feature_name.snakeCase()}}_body_test.dart",
      "data":
          "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzDQoNCmltcG9ydCAncGFja2FnZTpmbHV0dGVyL21hdGVyaWFsLmRhcnQnOw0KaW1wb3J0ICdwYWNrYWdlOnt7e2Z1bGxQYXRofX19L3t7ZmVhdHVyZV9uYW1lLnNuYWtlQ2FzZSgpfX0uZGFydCc7DQppbXBvcnQgJ3BhY2thZ2U6Zmx1dHRlcl90ZXN0L2ZsdXR0ZXJfdGVzdC5kYXJ0JzsNCg0Kdm9pZCBtYWluKCkgew0KICBncm91cCgne3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1Cb2R5JywgKCkgew0KICAgIHRlc3RXaWRnZXRzKCdyZW5kZXJzIFRleHQnLCAodGVzdGVyKSBhc3luYyB7IHt7I2lzQmxvY319DQogICAgICBhd2FpdCB0ZXN0ZXIucHVtcFdpZGdldCgNCiAgICAgICAgQmxvY1Byb3ZpZGVyKA0KICAgICAgICAgIGNyZWF0ZTogKGNvbnRleHQpID0+IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19QmxvYygpLA0KICAgICAgICAgIGNoaWxkOiBNYXRlcmlhbEFwcChob21lOiB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUJvZHkoKSksDQogICAgICAgICksDQogICAgICApO3t7L2lzQmxvY319e3sjaXNDdWJpdH19DQogICAgICBhd2FpdCB0ZXN0ZXIucHVtcFdpZGdldCgNCiAgICAgICAgQmxvY1Byb3ZpZGVyKA0KICAgICAgICAgIGNyZWF0ZTogKGNvbnRleHQpID0+IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19Q3ViaXQoKSwNCiAgICAgICAgICBjaGlsZDogTWF0ZXJpYWxBcHAoaG9tZToge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1Cb2R5KCkpLA0KICAgICAgICApLA0KICAgICAgKTt7ey9pc0N1Yml0fX17eyNpc1Byb3ZpZGVyfX0NCiAgICAgIGF3YWl0IHRlc3Rlci5wdW1wV2lkZ2V0KA0KICAgICAgICBQcm92aWRlcigNCiAgICAgICAgICBjcmVhdGU6IChjb250ZXh0KSA9PiBDaGFuZ2VOb3RpZmllclByb3ZpZGVyKGNyZWF0ZTogKF8pID0+IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19Tm90aWZpZXIoKSksDQogICAgICAgICAgY2hpbGQ6IE1hdGVyaWFsQXBwKGhvbWU6IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19Qm9keSgpKSwNCiAgICAgICAgKSwNCiAgICAgICk7e3svaXNQcm92aWRlcn19e3sjaXNSaXZlcnBvZH19DQogICAgICBhd2FpdCB0ZXN0ZXIucHVtcFdpZGdldCgNCiAgICAgICAgTWF0ZXJpYWxBcHAoaG9tZToge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1Cb2R5KCkpLA0KICAgICAgKTt7ey9pc1JpdmVycG9kfX17eyNpc05vbmV9fQ0KICAgICAgYXdhaXQgdGVzdGVyLnB1bXBXaWRnZXQoDQogICAgICAgIE1hdGVyaWFsQXBwKGhvbWU6IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19Qm9keSgpKSwNCiAgICAgICk7e3svaXNOb25lfX0NCg0KICAgICAgZXhwZWN0KGZpbmQuYnlUeXBlKFRleHQpLCBmaW5kc09uZVdpZGdldCk7DQogICAgfSk7DQogIH0pOw0KfQ0K",
      "type": "text"
    },
    {
      "path":
          "{{feature_name.snakeCase()}}\\view\\{{feature_name.snakeCase()}}_page_test.dart",
      "data":
          "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzDQoNCmltcG9ydCAncGFja2FnZTpmbHV0dGVyL21hdGVyaWFsLmRhcnQnOw0KaW1wb3J0ICdwYWNrYWdlOnt7e2Z1bGxQYXRofX19L3t7ZmVhdHVyZV9uYW1lLnNuYWtlQ2FzZSgpfX0uZGFydCc7DQppbXBvcnQgJ3BhY2thZ2U6Zmx1dHRlcl90ZXN0L2ZsdXR0ZXJfdGVzdC5kYXJ0JzsNCg0Kdm9pZCBtYWluKCkgew0KICBncm91cCgne3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1QYWdlJywgKCkgew0KICAgIGdyb3VwKCdyb3V0ZScsICgpIHsNCiAgICAgIHRlc3QoJ2lzIHJvdXRhYmxlJywgKCkgew0KICAgICAgICBleHBlY3Qoe3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1QYWdlLnJvdXRlKCksIGlzQTxNYXRlcmlhbFBhZ2VSb3V0ZT4oKSk7DQogICAgICB9KTsNCiAgICB9KTsNCg0KICAgIHRlc3RXaWRnZXRzKCdyZW5kZXJzIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19VmlldycsICh0ZXN0ZXIpIGFzeW5jIHsNCiAgICAgIGF3YWl0IHRlc3Rlci5wdW1wV2lkZ2V0KE1hdGVyaWFsQXBwKGhvbWU6IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19UGFnZSgpKSk7DQogICAgICBleHBlY3QoZmluZC5ieVR5cGUoe3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1WaWV3KSwgZmluZHNPbmVXaWRnZXQpOw0KICAgIH0pOw0KICB9KTsNCn0NCg==",
      "type": "text"
    },
    {
      "path":
          "{{feature_name.snakeCase()}}\\{{#isBloc}}bloc{{\\isBloc}}\\{{feature_name.snakeCase()}}_bloc_test.dart",
      "data":
          "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzDQoNCmltcG9ydCAncGFja2FnZTpibG9jX3Rlc3QvYmxvY190ZXN0LmRhcnQnOw0KaW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXJfdGVzdC9mbHV0dGVyX3Rlc3QuZGFydCc7DQppbXBvcnQgJ3BhY2thZ2U6e3t7ZnVsbFBhdGh9fX0vYmxvYy9ibG9jLmRhcnQnOw0KDQp2b2lkIG1haW4oKSB7DQogIGdyb3VwKCd7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUJsb2MnLCAoKSB7DQogICAgZ3JvdXAoJ2NvbnN0cnVjdG9yJywgKCkgew0KICAgICAgdGVzdCgnY2FuIGJlIGluc3RhbnRpYXRlZCcsICgpIHsNCiAgICAgICAgZXhwZWN0KA0KICAgICAgICAgIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19QmxvYygpLA0KICAgICAgICAgIGlzTm90TnVsbCwNCiAgICAgICAgKTsNCiAgICAgIH0pOw0KICAgIH0pOw0KDQogICAgdGVzdCgnaW5pdGlhbCBzdGF0ZSBoYXMgZGVmYXVsdCB2YWx1ZSBmb3IgY3VzdG9tUHJvcGVydHknLCAoKSB7DQogICAgICBmaW5hbCB7e2ZlYXR1cmVfbmFtZS5jYW1lbENhc2UoKX19QmxvYyA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19QmxvYygpOw0KICAgICAgZXhwZWN0KHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1CbG9jLnN0YXRlLmN1c3RvbVByb3BlcnR5LCBlcXVhbHMoJ0RlZmF1bHQgVmFsdWUnKSk7DQogICAgfSk7DQoNCiAgICBibG9jVGVzdDx7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUJsb2MsIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGU+KA0KICAgICAgJ0N1c3RvbXt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19RXZlbnQgZW1pdHMgbm90aGluZycsDQogICAgICBidWlsZDoge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1CbG9jLm5ldywNCiAgICAgIGFjdDogKGJsb2MpID0+IGJsb2MuYWRkKGNvbnN0IEN1c3RvbXt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19RXZlbnQoKSksDQogICAgICBleHBlY3Q6ICgpID0+IDx7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlPltdLA0KICAgICk7DQogIH0pOw0KfQ0K",
      "type": "text"
    },
    {
      "path":
          "{{feature_name.snakeCase()}}\\{{#isBloc}}bloc{{\\isBloc}}\\{{feature_name.snakeCase()}}_event_test.dart",
      "data":
          "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzDQoNCmltcG9ydCAncGFja2FnZTpmbHV0dGVyX3Rlc3QvZmx1dHRlcl90ZXN0LmRhcnQnOw0KaW1wb3J0ICdwYWNrYWdlOnt7e2Z1bGxQYXRofX19L2Jsb2MvYmxvYy5kYXJ0JzsNCg0Kdm9pZCBtYWluKCkgew0KICBncm91cCgne3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudCcsICgpIHsge3sjdXNlX2VxdWF0YWJsZX19IA0KICAgIGdyb3VwKCdDdXN0b217e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUV2ZW50JywgKCkgew0KICAgICAgdGVzdCgnc3VwcG9ydHMgdmFsdWUgZXF1YWxpdHknLCAoKSB7DQogICAgICAgIGV4cGVjdCgNCiAgICAgICAgICBjb25zdCBDdXN0b217e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUV2ZW50KCksDQogICAgICAgICAgaXNOb3ROdWxsDQogICAgICAgICk7DQogICAgICB9KTsNCiAgICB9KTt7ey91c2VfZXF1YXRhYmxlfX0NCiAgICBncm91cCgnY29uc3RydWN0b3InLCAoKSB7DQogICAgICB0ZXN0KCdjYW4gYmUgaW5zdGFudGlhdGVkJywgKCkgew0KICAgICAgICBleHBlY3QoDQogICAgICAgICAgQ3VzdG9te3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudCgpLA0KICAgICAgICAgIGVxdWFscyhjb25zdCBDdXN0b217e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUV2ZW50KCkpLA0KICAgICAgICApOw0KICAgICAgfSk7DQogICAgfSk7DQogIH0pOw0KfQ0K",
      "type": "text"
    },
    {
      "path":
          "{{feature_name.snakeCase()}}\\{{#isBloc}}bloc{{\\isBloc}}\\{{feature_name.snakeCase()}}_state_test.dart",
      "data":
          "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzDQoNCmltcG9ydCAncGFja2FnZTpmbHV0dGVyX3Rlc3QvZmx1dHRlcl90ZXN0LmRhcnQnOw0KaW1wb3J0ICdwYWNrYWdlOnt7e2Z1bGxQYXRofX19L2Jsb2MvYmxvYy5kYXJ0JzsNCg0Kdm9pZCBtYWluKCkgew0KICBncm91cCgne3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZScsICgpIHsNCiAgICB0ZXN0KCdzdXBwb3J0cyB2YWx1ZSBlcXVhbGl0eScsICgpIHsNCiAgICAgIGV4cGVjdCgNCiAgICAgICAge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSgpLA0KICAgICAgICBlcXVhbHMoDQogICAgICAgICAgY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSgpLA0KICAgICAgICApLA0KICAgICAgKTsNCiAgICB9KTsNCg0KICAgIGdyb3VwKCdjb25zdHJ1Y3RvcicsICgpIHsNCiAgICAgIHRlc3QoJ2NhbiBiZSBpbnN0YW50aWF0ZWQnLCAoKSB7DQogICAgICAgIGV4cGVjdCgNCiAgICAgICAgICBjb25zdCB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKCksDQogICAgICAgICAgaXNOb3ROdWxsLA0KICAgICAgICApOw0KICAgICAgfSk7DQogICAgfSk7DQoNCiAgICBncm91cCgnY29weVdpdGgnLCAoKSB7DQogICAgICB0ZXN0KA0KICAgICAgICAnY29waWVzIGNvcnJlY3RseSAnDQogICAgICAgICd3aGVuIG5vIGFyZ3VtZW50IHNwZWNpZmllZCcsDQogICAgICAgICgpIHsNCiAgICAgICAgICBjb25zdCB7e2ZlYXR1cmVfbmFtZS5jYW1lbENhc2UoKX19U3RhdGUgPSB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKA0KICAgICAgICAgICAgY3VzdG9tUHJvcGVydHk6ICdNeSBwcm9wZXJ0eScsDQogICAgICAgICAgKTsNCiAgICAgICAgICBleHBlY3QoDQogICAgICAgICAgICB7e2ZlYXR1cmVfbmFtZS5jYW1lbENhc2UoKX19U3RhdGUuY29weVdpdGgoKSwNCiAgICAgICAgICAgIGVxdWFscyh7e2ZlYXR1cmVfbmFtZS5jYW1lbENhc2UoKX19U3RhdGUpLA0KICAgICAgICAgICk7DQogICAgICAgIH0sDQogICAgICApOw0KDQogICAgICB0ZXN0KA0KICAgICAgICAnY29waWVzIGNvcnJlY3RseSAnDQogICAgICAgICd3aGVuIGFsbCBhcmd1bWVudHMgc3BlY2lmaWVkJywNCiAgICAgICAgKCkgew0KICAgICAgICAgIGNvbnN0IHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZSA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUoDQogICAgICAgICAgICBjdXN0b21Qcm9wZXJ0eTogJ015IHByb3BlcnR5JywNCiAgICAgICAgICApOw0KICAgICAgICAgIGZpbmFsIG90aGVye3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUoDQogICAgICAgICAgICBjdXN0b21Qcm9wZXJ0eTogJ015IHByb3BlcnR5IDInLA0KICAgICAgICAgICk7DQogICAgICAgICAgZXhwZWN0KHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZSwgaXNOb3QoZXF1YWxzKG90aGVye3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSkpKTsNCg0KICAgICAgICAgIGV4cGVjdCgNCiAgICAgICAgICAgIHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZS5jb3B5V2l0aCgNCiAgICAgICAgICAgICAgY3VzdG9tUHJvcGVydHk6IG90aGVye3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZS5jdXN0b21Qcm9wZXJ0eSwNCiAgICAgICAgICAgICksDQogICAgICAgICAgICBlcXVhbHMob3RoZXJ7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKSwNCiAgICAgICAgICApOw0KICAgICAgICB9LA0KICAgICAgKTsNCiAgICB9KTsNCiAgfSk7DQp9DQo=",
      "type": "text"
    },
    {
      "path":
          "{{feature_name.snakeCase()}}\\{{#isCubit}}cubit{{\\isCubit}}\\{{feature_name.snakeCase()}}_cubit_test.dart",
      "data":
          "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzDQoNCmltcG9ydCAncGFja2FnZTpibG9jX3Rlc3QvYmxvY190ZXN0LmRhcnQnOw0KaW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXJfdGVzdC9mbHV0dGVyX3Rlc3QuZGFydCc7DQppbXBvcnQgJ3BhY2thZ2U6e3t7ZnVsbFBhdGh9fX0vY3ViaXQvY3ViaXQuZGFydCc7DQoNCnZvaWQgbWFpbigpIHsNCiAgZ3JvdXAoJ3t7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19Q3ViaXQnLCAoKSB7DQogICAgZ3JvdXAoJ2NvbnN0cnVjdG9yJywgKCkgew0KICAgICAgdGVzdCgnY2FuIGJlIGluc3RhbnRpYXRlZCcsICgpIHsNCiAgICAgICAgZXhwZWN0KA0KICAgICAgICAgIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19Q3ViaXQoKSwNCiAgICAgICAgICBpc05vdE51bGwsDQogICAgICAgICk7DQogICAgICB9KTsNCiAgICB9KTsNCg0KICAgIHRlc3QoJ2luaXRpYWwgc3RhdGUgaGFzIGRlZmF1bHQgdmFsdWUgZm9yIGN1c3RvbVByb3BlcnR5JywgKCkgew0KICAgICAgZmluYWwge3tmZWF0dXJlX25hbWUuY2FtZWxDYXNlKCl9fUN1Yml0ID0ge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1DdWJpdCgpOw0KICAgICAgZXhwZWN0KHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1DdWJpdC5zdGF0ZS5jdXN0b21Qcm9wZXJ0eSwgZXF1YWxzKCdEZWZhdWx0IFZhbHVlJykpOw0KICAgIH0pOw0KDQogICAgYmxvY1Rlc3Q8e3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1DdWJpdCwge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZT4oDQogICAgICAneW91ckN1c3RvbUZ1bmN0aW9uIGVtaXRzIG5vdGhpbmcnLA0KICAgICAgYnVpbGQ6IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19Q3ViaXQubmV3LA0KICAgICAgYWN0OiAoY3ViaXQpID0+IGN1Yml0LnlvdXJDdXN0b21GdW5jdGlvbigpLA0KICAgICAgZXhwZWN0OiAoKSA9PiA8e3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZT5bXSwNCiAgICApOw0KICB9KTsNCn0NCg==",
      "type": "text"
    },
    {
      "path":
          "{{feature_name.snakeCase()}}\\{{#isCubit}}cubit{{\\isCubit}}\\{{feature_name.snakeCase()}}_state_test.dart",
      "data":
          "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzDQoNCmltcG9ydCAncGFja2FnZTpmbHV0dGVyX3Rlc3QvZmx1dHRlcl90ZXN0LmRhcnQnOw0KaW1wb3J0ICdwYWNrYWdlOnt7e2Z1bGxQYXRofX19L2N1Yml0L2N1Yml0LmRhcnQnOw0KDQp2b2lkIG1haW4oKSB7DQogIGdyb3VwKCd7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlJywgKCkgew0KICAgIHRlc3QoJ3N1cHBvcnRzIHZhbHVlIGVxdWFsaXR5JywgKCkgew0KICAgICAgZXhwZWN0KA0KICAgICAgICB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKCksDQogICAgICAgIGVxdWFscygNCiAgICAgICAgICBjb25zdCB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKCksDQogICAgICAgICksDQogICAgICApOw0KICAgIH0pOw0KDQogICAgZ3JvdXAoJ2NvbnN0cnVjdG9yJywgKCkgew0KICAgICAgdGVzdCgnY2FuIGJlIGluc3RhbnRpYXRlZCcsICgpIHsNCiAgICAgICAgZXhwZWN0KA0KICAgICAgICAgIGNvbnN0IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUoKSwNCiAgICAgICAgICBpc05vdE51bGwsDQogICAgICAgICk7DQogICAgICB9KTsNCiAgICB9KTsNCg0KICAgIGdyb3VwKCdjb3B5V2l0aCcsICgpIHsNCiAgICAgIHRlc3QoDQogICAgICAgICdjb3BpZXMgY29ycmVjdGx5ICcNCiAgICAgICAgJ3doZW4gbm8gYXJndW1lbnQgc3BlY2lmaWVkJywNCiAgICAgICAgKCkgew0KICAgICAgICAgIGNvbnN0IHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZSA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUoDQogICAgICAgICAgICBjdXN0b21Qcm9wZXJ0eTogJ015IHByb3BlcnR5JywNCiAgICAgICAgICApOw0KICAgICAgICAgIGV4cGVjdCgNCiAgICAgICAgICAgIHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZS5jb3B5V2l0aCgpLA0KICAgICAgICAgICAgZXF1YWxzKHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZSksDQogICAgICAgICAgKTsNCiAgICAgICAgfSwNCiAgICAgICk7DQoNCiAgICAgIHRlc3QoDQogICAgICAgICdjb3BpZXMgY29ycmVjdGx5ICcNCiAgICAgICAgJ3doZW4gYWxsIGFyZ3VtZW50cyBzcGVjaWZpZWQnLA0KICAgICAgICAoKSB7DQogICAgICAgICAgY29uc3Qge3tmZWF0dXJlX25hbWUuY2FtZWxDYXNlKCl9fVN0YXRlID0ge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSgNCiAgICAgICAgICAgIGN1c3RvbVByb3BlcnR5OiAnTXkgcHJvcGVydHknLA0KICAgICAgICAgICk7DQogICAgICAgICAgZmluYWwgb3RoZXJ7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlID0ge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSgNCiAgICAgICAgICAgIGN1c3RvbVByb3BlcnR5OiAnTXkgcHJvcGVydHkgMicsDQogICAgICAgICAgKTsNCiAgICAgICAgICBleHBlY3Qoe3tmZWF0dXJlX25hbWUuY2FtZWxDYXNlKCl9fVN0YXRlLCBpc05vdChlcXVhbHMob3RoZXJ7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKSkpOw0KDQogICAgICAgICAgZXhwZWN0KA0KICAgICAgICAgICAge3tmZWF0dXJlX25hbWUuY2FtZWxDYXNlKCl9fVN0YXRlLmNvcHlXaXRoKA0KICAgICAgICAgICAgICBjdXN0b21Qcm9wZXJ0eTogb3RoZXJ7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlLmN1c3RvbVByb3BlcnR5LA0KICAgICAgICAgICAgKSwNCiAgICAgICAgICAgIGVxdWFscyhvdGhlcnt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUpLA0KICAgICAgICAgICk7DQogICAgICAgIH0sDQogICAgICApOw0KICAgIH0pOw0KICB9KTsNCn0NCg==",
      "type": "text"
    }
  ],
  "hooks": [
    {
      "path": "pre_gen.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOm1hc29uL21hc29uLmRhcnQnOwoKdm9pZCBydW4oSG9va0NvbnRleHQgY29udGV4dCkgewogIC8vIFRPRE86IGFkZCBwcmUtZ2VuZXJhdGlvbiBsb2dpYy4KfQo=",
      "type": "text"
    },
    {
      "path": "pubspec.yaml",
      "data":
          "bmFtZTogZmVhdHVyZV9icmlja190ZXN0c19ob29rcwoKZW52aXJvbm1lbnQ6CiAgc2RrOiAiPj0yLjEyLjAgPDMuMC4wIgoKZGVwZW5kZW5jaWVzOgogIG1hc29uOiBeMC4xLjAtZGV2Cg==",
      "type": "text"
    }
  ],
  "name": "feature_brick_tests",
  "description": "A supporting brick for feature_brick",
  "version": "0.0.1",
  "environment": {"mason": ">=0.1.0-dev.26 <0.1.0"},
  "readme": {
    "path": "README.md",
    "data":
        "IyBGZWF0dXJlIEJyaWNrIFRlc3RzCgpBIHN1cHBvcnRpbmcgYnJpY2sgdG8gY3JlYXRpbmcgZmVhdHVyZSB0ZXN0cyB1c2luZyBiZXN0IHByYWN0aWNlcyBhbmQgeW91ciBzdGF0ZSBtYW5hZ2VtZW50IG9mIGNob2ljZSEgU3VwcG9ydHMgQmxvYywgQ3ViaXQsIE5vbmUuCgojIyBIb3cgdG8gdXNlIPCfmoAKCmBgYAptYXNvbiBtYWtlIGZlYXR1cmVfYnJpY2sgLS1mZWF0dXJlX25hbWUgbG9naW4gLS1zdGF0ZV9tYW5hZ2VtZW50IGJsb2MKYGBgCgojIyBWYXJpYWJsZXMg4pyoCgpOL0EgYXMgdGhpcyBpcyBhIHN1cHBvcnRpbmcgYnJpY2sgb2YgZmVhdHVyZV9icmljawoKIyMgT3V0cHV0cyDwn5OmCgpgYGAKLS1mZWF0dXJlX25hbWUgbG9naW4gLS1zdGF0ZV9tYW5hZ2VtZW50IGJsb2MK4pSc4pSA4pSAIGxvZ2luCuKUgiAgIOKUnOKUgOKUgCBibG9jCuKUgiAgIOKUgiAgIOKUnOKUgOKUgCBsb2dpbl9ibG9jX3Rlc3QuZGFydArilIIgICDilIIgICDilJzilIDilIAgbG9naW5fZXZlbnRfdGVzdC5kYXJ0CuKUgiAgIOKUgiAgIOKUlOKUgOKUgCBsb2dpbl9zdGF0ZV90ZXN0LmRhcnQK4pSCICAg4pSc4pSA4pSAIHZpZXcK4pSCICAg4pSCICAg4pSU4pSA4pSAIGxvZ2luX3BhZ2VfdGVzdC5kYXJ0CuKUgiAgIOKUnOKUgOKUgCB3aWRnZXRzCuKUgiAgIOKUlOKUgOKUgOKUgOKUgOKUgCBsb2dpbl9ib2R5X3Rlc3QuZGFydArilJTilIDilIAgLi4uCmBgYAoKYGBgCi0tZmVhdHVyZV9uYW1lIGxvZ2luIC0tc3RhdGVfbWFuYWdlbWVudCBjdWJpdArilJzilIDilIAgbG9naW4K4pSCICAg4pSc4pSA4pSAIGN1Yml0CuKUgiAgIOKUgiAgIOKUnOKUgOKUgCBsb2dpbl9jdWJpdF90ZXN0LmRhcnQK4pSCICAg4pSCICAg4pSU4pSA4pSAIGxvZ2luX3N0YXRlX3Rlc3QuZGFydArilIIgICDilJzilIDilIAgdmlldwrilIIgICDilIIgICDilJTilIDilIAgbG9naW5fcGFnZV90ZXN0LmRhcnQK4pSCICAg4pSc4pSA4pSAIHdpZGdldHMK4pSCICAg4pSU4pSA4pSA4pSA4pSA4pSAIGxvZ2luX2JvZHlfdGVzdC5kYXJ0CuKUlOKUgOKUgCAuLi4KYGBgCg==",
    "type": "text"
  },
  "changelog": {
    "path": "CHANGELOG.md",
    "data":
        "IyAwLjAuMQoKLSBDcmVhdGUgaW5pdGlhbCBGZWF0dXJlIEJyaWNrIFRlc3RzIHdoaWNoIHN1cHBvcnRzIGJsb2MsIGN1Yml0LCBhbmQgbm9uZQo=",
    "type": "text"
  },
  "license": {
    "path": "LICENSE",
    "data":
        "TUlUIExpY2Vuc2UKCkNvcHlyaWdodCAoYykgMjAyMiBMdWtlIE1vb2R5CgpQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5Cm9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsCmluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMKdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbApjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKClRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbApjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgoKVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCkZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQpBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCkxJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sCk9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFClNPRlRXQVJFLgo=",
    "type": "text"
  },
  "vars": {}
});
