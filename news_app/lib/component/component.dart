import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_app/WebView/webview.dart';

Widget BuildApiItem(business, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(url: business['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      '${business["urlToImage"]}',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("'${business["title"]}'",
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("'${business["publishedAt"]}'",
                        style: Theme.of(context).textTheme.bodyText2)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget MyDivider() => Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );
