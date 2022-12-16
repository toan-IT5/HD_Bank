import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hd_bank/Models/transfer_history.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Utils/money_helper.dart';
import 'package:hd_bank/Views/Widgets/common_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    DateTime from = DateTime(2021, 01, 29);
    DateTime to = DateTime(2021, 01, 30);
    return CommonPage(
      enableAppBar: true,
      color: Colors.grey.shade200,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: Provider.of<AppNotifiler>(context, listen: false).history(
              DateFormat("ddMMyyyy").format(from),
              DateFormat("ddMMyyyy").format(to)),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<TransferHistory>? historys =
                  snapshot.data as List<TransferHistory>?;
              return historys != null && historys.isNotEmpty
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(children: [
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2020, 1, 1),
                                      maxTime: DateTime.now(),
                                      onConfirm: (time) {
                                    from = time;
                                    print(time);
                                  }, currentTime: from, locale: LocaleType.vi);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: BaseColor.off,
                                        blurRadius: 8,
                                        offset:
                                            Offset(-2, 2), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                        "Từ: ${DateFormat("dd/MM/yyy").format(from)}"),
                                  ),
                                ),
                              ),
                              const Icon(Icons.arrow_right),
                              GestureDetector(
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2020, 1, 1),
                                      maxTime: DateTime.now(),
                                      onConfirm: (date) {
                                    to = date;
                                    setState(() {});
                                  }, currentTime: to, locale: LocaleType.vi);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: BaseColor.off,
                                        blurRadius: 8,
                                        offset:
                                            Offset(-2, 2), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                        "Từ: ${DateFormat("dd/MM/yyy").format(to)}"),
                                  ),
                                ),
                              )
                            ],
                          ),
                          ...historys
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.only(top: 16),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: BaseColor.off,
                                        blurRadius: 8,
                                        offset:
                                            Offset(-2, 2), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Thời gian giao dịch: ${e.transDate}",
                                        style: BaseTextStyle.body1(
                                            color: BaseColor.black),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            e.transDesc,
                                            style: BaseTextStyle.body2(
                                              color: BaseColor.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(width: 16),
                                          Text(
                                            MoneyFormat.moneyFormat(e
                                                .transAmount
                                                .toInt()
                                                .toString()),
                                            style: BaseTextStyle.body2(
                                                color: BaseColor.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ]),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text("Không có học phí nào")],
                    );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  "Đang tải...",
                  style: BaseTextStyle.caption(color: BaseColor.black),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
