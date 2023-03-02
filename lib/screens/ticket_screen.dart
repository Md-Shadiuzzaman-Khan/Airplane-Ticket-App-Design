import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_first_app/screens/ticket_view.dart';
import 'package:my_first_app/utils/app_info_list.dart';
import 'package:my_first_app/utils/app_layout.dart';
import 'package:my_first_app/utils/app_styles.dart';
import 'package:my_first_app/widgets/column_layout.dart';
import 'package:my_first_app/widgets/layout_builder_widget.dart';
import 'package:my_first_app/widgets/ticket_tabs.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(20), horizontal: AppLayout.getWidth(20),),
            children: [
              Gap(AppLayout.getHeight(40),),
              Text("Tickets", style: Styles.headlineStyle1,),
              Gap(AppLayout.getHeight(20),),
              const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
              Gap(AppLayout.getHeight(20),),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15),),
                child: TicketView(ticket: ticketList[0], isColor: false,),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(firstText: 'Flutter DB', secondText: 'Passenger', alignment: CrossAxisAlignment.start, isColor: true,),
                        AppColumnLayout(firstText: '5767 237487', secondText: 'Passport', alignment: CrossAxisAlignment.end, isColor: true,),
                      ],
                    ),
                    Gap(AppLayout.getHeight(40),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(firstText: '5744 76544643', secondText: 'Number of E-ticket', alignment: CrossAxisAlignment.start, isColor: true,),
                        AppColumnLayout(firstText: 'D4BS09', secondText: 'Booking Code', alignment: CrossAxisAlignment.end, isColor: true,),
                      ],
                    ),
                    Gap(AppLayout.getHeight(40),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/visa.png", scale: 11,),
                                Text(" **** 3892", style: Styles.headlineStyle3,),
                              ],
                            ),
                            Gap(AppLayout.getHeight(5),),
                            Text("Payment Method", style: Styles.headlineStyle4,),
                          ],
                        ),
                        const AppColumnLayout(firstText: '\$249.0', secondText: 'Price', alignment: CrossAxisAlignment.end, isColor: true,),
                      ],
                    ),
                    Gap(AppLayout.getHeight(28),),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(AppLayout.getHeight(21)), bottomLeft: Radius.circular(AppLayout.getHeight(21)),),
                ),
                margin: EdgeInsets.only(left: AppLayout.getHeight(15), right: AppLayout.getHeight(15),),
                padding: EdgeInsets.only(bottom: AppLayout.getHeight(15),),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15),),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppLayout.getHeight(15),),
                    child: BarcodeWidget(data: 'https://github.com/', barcode: Barcode.code128(), drawText: false, color: Styles.textColor, width: double.infinity, height: 70,),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(20),),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15),),
                child: TicketView(ticket: ticketList[0],),
              ),
            ],
          ),
          Positioned(
              left: AppLayout.getHeight(22),
              top: AppLayout.getHeight(295),
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color:  Styles.textColor, width: 2),
                ),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Styles.textColor,
                ),
              ),
          ),
          Positioned(
            right: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color:  Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
