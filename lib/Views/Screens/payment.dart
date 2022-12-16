import 'package:flutter/material.dart';
import 'package:hd_bank/Models/Apis/api_response.dart';
import 'package:hd_bank/Models/fee.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Views/Widgets/common_page.dart';
import 'package:hd_bank/Views/Widgets/custom_button.dart';
import 'package:hd_bank/Views/Widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController searchText = TextEditingController();
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse =
        Provider.of<AppNotifiler>(context, listen: true).response;
    return CommonPage(
        enableAppBar: true,
        canBack: true,
        menuCallback: () => Navigator.pop(context),
        content: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomTextField(
                  inputType: EInputType.None,
                  textEditController: searchText,
                  autoFocus: true,
                  hintTextString: "Mã số sinh viên",
                  maxLength: 6,
                  prefixIcon: const Icon(Icons.search),
                  textInputAction: TextInputAction.done,
                  enableBorder: true,
                  onSubmit: () {
                    if (searchText.text.length == 6) {
                      Provider.of<AppNotifiler>(context, listen: false)
                          .getFees(searchText.text);
                      isSearch = true;
                    }
                  },
                ),
                SingleChildScrollView(
                    child: isSearch
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height - 180,
                            child:
                                Center(child: getBody(apiResponse, searchText)))
                        : Container())
              ],
            ),
          ),
        ));
  }

  Widget getBody(ApiResponse apiResponse, TextEditingController searchText) {
    List<Fee>? fees = apiResponse.data as List<Fee>?;
    switch (apiResponse.status) {
      case Status.INITIAL:
        return Container();
      case Status.LOADING:
        return const CircularProgressIndicator();
      case Status.COMPLETED:
        return fees != null && fees.isNotEmpty
            ? Column(
                children: fees
                    .map((e) => Container(
                          margin: const EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: BaseColor.off,
                                blurRadius: 8,
                                offset: Offset(-2, 2), // Shadow position
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    e.description,
                                    style: BaseTextStyle.body2(
                                      color: BaseColor.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    e.fee,
                                    style: BaseTextStyle.body2(
                                        color: BaseColor.black),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              CustomButton.common(
                                  onTap: () {
                                    Provider.of<AppNotifiler>(context,
                                            listen: false)
                                        .payment(searchText.text, e.fee);
                                  },
                                  content: "Thanh toán")
                            ],
                          ),
                        ))
                    .toList())
            : const Text("Không có học phí nào");
      case Status.ERROR:
        return const Text("Lỗi hệ thống.");
      default:
        return const CircularProgressIndicator();
    }
  }
}
