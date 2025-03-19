import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class WrapperTest extends StatefulWidget {
  const WrapperTest({super.key});

  @override
  State<WrapperTest> createState() => _WrapperTestState();
}

class _WrapperTestState extends State<WrapperTest> {
  List<dynamic> list = [];
  List<dynamic> images_list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmovieList();
  }

  Future getWebsiteDat() async {
    final uri = Uri.parse('https://fusionbd.com/index.html');
    final response = await http.get(uri);
    // print(response.body);

    final document = parse(response.body);

    // print("Fusionbd :${document.outerHtml}");

    final elements =
        document
            .querySelectorAll('body > div > div > b')
            .map((value) => value.text)
            .toList();
    list = elements;
    setState(() {});

    // print(document.body?.text);
    // final titles = document.querySelectorAll('#dossier-asin-grid > div > div.a-section.a-spacing-none.d-asin-grid-content > div.a-section.a-spacing-none.dcl-grid-wrapper > div.a-section.a-spacing-none.dcl-html-grid > span:nth-child(14) > div > div.a-section.a-spacing-base > div > div.a-section.a-spacing-none.a-spacing-top-small.s-title-instructions-style > a')
    // .map((element)=>element.innerHtml.trim())
    // .toList();
    // print("count:${titles.length}");
    // for(final title in titles)
    // {
    //   print(title);
    // }
  }

  Future getmovieList() async {
    final uri = Uri.parse('https://www.imdb.com/chart/top/');
    final response = await http.get(uri);

    final document = parse(response.body);
    final titles =
        document
            .querySelectorAll(
              'div.ipc-title.ipc-title--base.ipc-title--title.ipc-title-link-no-icon.ipc-title--on-textPrimary.sc-3713cfda-2.fSzZES.cli-title.with-margin > a > h3',
            )
            .map((value) => value.text)
            .toList();

    list = titles;
    final images =
    document
        .querySelectorAll(
      'div > div > div > div > img',
    )
        .map((value) => value.attributes['src'])
        .toList();
    images_list = images;
    print(titles);
    print(images);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wrapper test')),
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Image.network(images_list[index]),
                  Text(list[index]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
