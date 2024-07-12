// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/dog_provider.dart';
import 'models/dog_breed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DogProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Dog API Demo',
        home: DogListScreen(),
      ),
    );
  }
}

class DogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breeds List'),
      ),
      body: Consumer<DogProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              if (provider.randomImage != null)
                Image.network(
                  provider.randomImage!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.dogBreedList.length,
                  itemBuilder: (context, index) {
                    DogBreed breed = provider.dogBreedList[index];
                    return ListTile(
                      title: Text(breed.breed),
                      onTap: () {
                        // Puedes agregar una navegación a un detalle de la raza aquí
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DogProvider>(context, listen: false).fetchDogData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
