import 'package:flutter/material.dart';
import 'package:flutter_api/models/movie.dart';

class MovieDetail extends StatelessWidget{
  final Movie movie;

  //In the constructor, require a Movie
  MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        // backgroundColor: Color(0xFFEFEFEF),
        title: Text("Movies Api",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 250,
                  // alignment: Alignment.centerLeft,
                  child: Card(
                    child: Image.network(
                        "https://image.tmdb.org/t/p/w500" +
                           movie.poster_path),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          movie.original_title,
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(movie.release_date),
                        Text(movie.overview),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }


}
/*
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  //constructor
  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Product Details'),
        actions: [
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70, // transparent background
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: [
                      Expanded(
                        child: new Text(
                          "\$ ${widget.product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          "\$ ${widget.product_detail_new_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ---------The first bottons---------------
          Row(
            children: <Widget> [
              //====== the size botton ======
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(context: context, builder: (context){
                    return new AlertDialog(
                      title: new Text("Size"),
                      content: new Text("Choose the size"),
                      actions: <Widget>[
                        new MaterialButton(
                          onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("Close"),)
                      ],
                    );
                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                    elevation: 0.2,
                child: Row(
                  children: <Widget> [
                    Expanded(child: new Text("Size")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context){
                      return new AlertDialog(
                        title: new Text("Color"),
                        content: new Text("Choose the color"),
                        actions: <Widget>[
                          new MaterialButton(
                            onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                            child: new Text("Close"),)
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget> [
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context){
                      return new AlertDialog(
                        title: new Text("Qty"),
                        content: new Text("Choose the Quantity"),
                        actions: <Widget>[
                          new MaterialButton(
                            onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                            child: new Text("Close"),)
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget> [
                      Expanded(child: new Text("Qty")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //====== the second botton ======
         Row(
           children: <Widget>[
             Expanded(
               child: MaterialButton(
                 onPressed: () {},
                 color: Colors.red,
                 textColor: Colors.grey,
                 elevation: 0.2,
                 child: new Text("buy now"),
               ),
             ),

             new IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart)),
             new IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border),color: Colors.red,)

           ],
         ),
          Divider(),
          new ListTile(
            title: Text("Product Details"),
            subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
            child: Text("Product name", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: Text(widget.product_detail_name ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

* */