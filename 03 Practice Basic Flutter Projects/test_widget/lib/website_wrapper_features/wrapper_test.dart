import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:html/parser.dart' as dom;
import 'package:http/http.dart' as http;

class WrapperTest extends StatefulWidget {
  const WrapperTest({super.key});

  @override
  State<WrapperTest> createState() => _WrapperTestState();
}

class _WrapperTestState extends State<WrapperTest> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteDat();

  }
  Future getWebsiteDat() async
  {
    final uri = Uri.parse('https://www.amazon.com/stores/page/D209D922-7883-495C-9894-6B13D9BB1A67/?_encoding=UTF8&ingress=0&visitId=75ce56a0-38d0-4cc3-a911-6b4b8bd24c01&ref_=cct_cg_CEPCLAP_1a1&pf_rd_p=9fb5bb48-7491-4c96-bfef-25750b14b1c4&pf_rd_r=T7MQTAATVWWX2SJSTZ3Q');
    final response = await http.get(uri);
    print(response.body);

    final document = dom.parse(response.body);
    print(document.body?.text);
    final titles = document.querySelectorAll('#dossier-asin-grid > div > div.a-section.a-spacing-none.d-asin-grid-content > div.a-section.a-spacing-none.dcl-grid-wrapper > div.a-section.a-spacing-none.dcl-html-grid > span:nth-child(14) > div > div.a-section.a-spacing-base > div > div.a-section.a-spacing-none.a-spacing-top-small.s-title-instructions-style > a')
    .map((element)=>element.innerHtml.trim())
    .toList();
    print("count:${titles.length}");
    for(final title in titles)
    {
      print(title);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrapper test'),
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
