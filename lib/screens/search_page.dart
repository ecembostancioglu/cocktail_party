import 'dart:async';
import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/network/dio_client.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final DioClient _cocktailClient=DioClient();
  late Future<Iterable<Cocktail>> _cocktails;
   String? cocktailName;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Please enter the cocktail name');
  final _controller = TextEditingController();
  final ScrollController _scrollController=ScrollController();
  String? filter;
  Timer? _debounce;
  bool loading=false;



  @override
  void initState() {

    _cocktails=_cocktailClient.getCocktail(_controller.text);
    _controller.addListener(() {
      setState(() {
        filter=_controller.text;
      });
    });
    super.initState();
  }

  void searchBar(){

    setState(() {
      if(customIcon != Icons.search){
        customIcon = const Icon(Icons.cancel);
        customSearchBar = ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
          title: TextField(
            controller: _controller,
            onChanged: (val){
              onChangedTextField(val);
            },
            decoration: const InputDecoration(
              hintText: 'Cocktail name...',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      }else{
        customIcon = const Icon(Icons.search);
      }
    });
  }



  Future <Cocktail?> onChangedTextField(String word)async{


    setState(() {
      if(_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce=Timer(const Duration(milliseconds: 3000), (){
        _cocktails= _cocktailClient.getCocktail(word);
      });
    });
  // _cocktails= _cocktailClient.getCocktail(word);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: searchBar,
              icon: customIcon)
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: FutureBuilder<Iterable<Cocktail>>(
                future: _cocktails,
                builder: (context,snapshot){
                if(snapshot.data!=null){
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                    ),
                    controller: _scrollController,
                    shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        var data=snapshot.data!.toList();
                       filter == null || filter== '';

                        return  GridTile(
                            child: Container(
                             width: 200, height: 200,
                             child: Image.network(data[index].strDrinkThumb.toString()),));


                      });
                }else if(snapshot.connectionState==ConnectionState.waiting){
                  return CircularProgressIndicator();
                }else
                return Center(
                    child: CircularProgressIndicator());
                }
                ),
          ),
        ),
      ),
    );
  }
}
