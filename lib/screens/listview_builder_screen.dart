import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app_theme.dart';

class ListviewBuilderScreen extends StatefulWidget {
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  // Se ejecuta cuando se crea el estado, una unica vez
  @override
  void initState() {
    super.initState();
    // addListener se ejecuta cada vez que cambie el scroll
    scrollController.addListener(() {
      // print('${scrollController.position.pixels},${scrollController.position.maxScrollExtent}');
      if (scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent) {
        // add5();
        fetchData();
      }
    });
  }

  Future fetchData() async {
    // Para que no se ejecute mas de una vez a la vez, ya qu eel controller lo gatillaria muchas veces
    if (isLoading) return;

    isLoading = true;
    setState(() {}); // Para que se redibuje lo que depende del estado del isLoading

    await Future.delayed(const Duration(seconds: 3));

    add5();

    isLoading = false;
    setState(() {});

    // Para que se suba un poco el scroll al terminar de cargar
    // Con el if solo va a ocurrir si estoy cercano al final del scroll
    if (scrollController.position.pixels + 100 < scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // MediaQuery.removePadding para eliminar espacios en blanco que quedan en algunos dispositivos
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true, //Para remover espacio en blanco arriba
        removeBottom: true, //Para remover espacio en blanco abajo
        child: Stack(
          children: [
            // Para pull to refresh
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage('https://picsum.photos/500/300?image=${imagesIds[index]}'),
                  );
                },
              ),
            ),
            if (isLoading)
              Positioned(
                bottom: 20,
                left: size.width * 0.5 - 25,
                child: const _LoadingIcon(),
              )
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      width: 50,
      child: const CircularProgressIndicator(color: AppTheme.primary),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
    );
  }
}
