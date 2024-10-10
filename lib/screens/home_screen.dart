import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/cuibts/navbar_cuibt.dart';
import 'package:laza/meram/cubits/product_state.dart';
import 'package:laza/screens/nav_bar_screen.dart';
import 'package:laza/widgets/category_card.dart';
import '../meram/cubits/product_cuibt.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: const Color(0xFFF5F6FA),
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.menu),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        child: Container(
          width: 40,
          decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.menu),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Welcome to Laza',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF5F6FA),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Choose category',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
                  child: BlocBuilder<ProductCubit,ProductState>(builder: (context,state){
                    if (state is ProductLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFE23E3E),
                        ),
                      );
                    }else if (state is ProductError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }else if (state is ProductLoaded){
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index)
                          {
                            return  CategotyCard(onTap: (){},product: state.products[index],);
                          });
                    }else {
                      return Center(
                      child: Text('No Response'),
                      );
                    }
                  }),),

               Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'New Product',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: 160,
                      height: 257,
                      color: Colors.black,
                    ),
                    Spacer(),
                    Container(
                      width: 160,
                      height: 257,
                      color: Colors.black,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}
