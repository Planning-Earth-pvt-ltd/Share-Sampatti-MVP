import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  await AuthPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ProviderScope(
      overrides: [
        appDimensionsProvider.overrideWithValue(
          AppDimensions(size.aspectRatio, size.width, size.height),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Share Sampatti',
        theme: dark,
        routerConfig: route,
      ),
    );
  }
}
