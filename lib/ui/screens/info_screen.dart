import 'package:flutter/material.dart';
import 'package:provider_exam_app/viewmodel/info_view_model.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Info screen")),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Consumer<InfoViewModel>(
                builder: (context, infoViewModel, child) {
                  return Center(
                    child: infoViewModel.isLoading
                        ? const CircularProgressIndicator()
                        : (infoViewModel.appModel == null
                            ? const Text("Hozircha Mal'lumot yuq")
                            : Column(
                                children: [
                                  ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: infoViewModel.appModel!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          left: 20,
                                          right: 20,
                                        ),
                                        padding: const EdgeInsets.all(20),
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(
                                                  hexColor(infoViewModel.appModel![index].colors.colorA),
                                                ),
                                                Color(
                                                  hexColor(infoViewModel
                                                      .appModel![index]
                                                      .colors
                                                      .colorB),
                                                ),
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  infoViewModel.appModel![index].bankName,
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const Spacer(),
                                                SizedBox(
                                                  width: 60,
                                                  height: 40,
                                                  child: Image.network(
                                                      infoViewModel
                                                          .appModel![index]
                                                          .iconImage),
                                                )
                                              ],
                                            ),
                                            Text(infoViewModel
                                                .appModel![index].cardNumber,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<InfoViewModel>().fetchAllInfo();
        },
        child: const Icon(Icons.download),
      ),
    );
  }

  hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll("#", "");
    int colorint = int.parse(colornew);
    return colorint;
  }
}
