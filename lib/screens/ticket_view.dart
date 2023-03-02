import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_first_app/utils/app_layout.dart';
import 'package:my_first_app/utils/app_styles.dart';
import 'package:my_first_app/widgets/column_layout.dart';
import 'package:my_first_app/widgets/layout_builder_widget.dart';
import 'package:my_first_app/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid==true? 179: 181),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          children: [
            //blue part
            Container(
              decoration: BoxDecoration(
                color: isColor==null? Color(0xFF526799):Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)),
                topRight: Radius.circular(AppLayout.getHeight(21)),),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                      children: [
                        Text(ticket['from']['code'],
                          style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3,),
                        Expanded(child: Container()),
                        const ThickContainer(isColor: true,),
                        //
                        Expanded(child: Stack(
                          children: [
                            SizedBox(
                              height: AppLayout.getHeight(24),
                              child: const AppLayoutBuilderWidget(sections: 6, isColor: true,),
                            ),
                            Center(child: Transform.rotate(angle: 1.5, child: Icon(Icons.local_airport_rounded, color: isColor==null?Colors.white:Color(0xFF8ACCF7),),),),
                          ],
                        )),
                        //
                        const ThickContainer(isColor: true,),
                        Expanded(child: Container()),
                        Text(ticket['to']['code'], style: isColor==null?Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3,),
                      ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100), child: Text(ticket['from']['name'], style: isColor==null?Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),

                      ),

                      Text(ticket['flying_time'], style: isColor==null?Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),

                      SizedBox(
                        width: AppLayout.getWidth(100), child: Text(ticket['to']['name'], textAlign: TextAlign.end, style: isColor==null?Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),

                      ),
                    ],
                  )
                ],
              ),
            ),
            //orange part
            Container(
              color: isColor==null?Styles.orangeColor:Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(decoration: BoxDecoration(
                      color: isColor==null? Colors.grey.shade300:Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppLayout.getHeight(10),),
                        bottomRight: Radius.circular(AppLayout.getHeight(10),),
                      )
                    ),),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(12.0),
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate((constraints.constrainWidth()/6).floor(), (index) => SizedBox(
                              width: AppLayout.getWidth(5), height: AppLayout.getHeight(1), child: const DecoratedBox(decoration: BoxDecoration(
                                color: Colors.white
                            )),
                            )),
                          );
                        },
                      ),
                  )),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(decoration: BoxDecoration(
                        color: isColor==null? Colors.grey.shade300:Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppLayout.getHeight(10),),
                            bottomLeft: Radius.circular(AppLayout.getHeight(10),),
                        )
                    ),),
                  )
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  color: isColor==null?Styles.orangeColor:Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppLayout.getHeight(isColor==null?21:0),),
                      bottomRight: Radius.circular(AppLayout.getHeight(isColor==null?21:0),),),
              ),
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //AppColumnLayout(firstText: ticket['date'], secondText: "Date", alignment: CrossAxisAlignment.start, isColor: false,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket['date'], style: isColor==null?Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3),
                          const Gap(5),
                          Text("Date", style: isColor==null?Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket['departure_time'], style: isColor==null?Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3),
                          const Gap(5),
                          Text("Departure time", style: isColor==null?Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(ticket['number'].toString(), style: isColor==null?Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3),
                          const Gap(5),
                          Text("Number", style: isColor==null?Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ]
        ),
      )
    );
  }
}
