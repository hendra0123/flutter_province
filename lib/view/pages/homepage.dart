part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    homeViewModel.fetchProvinceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeViewModel,
          child: Consumer<HomeViewModel>(builder: (context, value, _) {
            switch (value.provinceList.status) {
              case Status.loading:
                return Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                return Align(
                  alignment: Alignment.center,
                  child: Text(value.provinceList.message.toString()),
                );
              case Status.completed:
                return ListView.builder(
                  itemCount: value.provinceList.data?.length,
                  itemBuilder: (context, index) {
                    return CardProvince(
                        value.provinceList.data!.elementAt(index));
                  },
                );
              default:
            }
            return Container();
          })),
    );
  }
}
