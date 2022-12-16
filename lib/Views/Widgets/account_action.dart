import 'package:flutter/material.dart';
import 'package:hd_bank/Utils/base_style.dart';

class AccountAction extends StatelessWidget {
  const AccountAction({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width / 2 - 24,
              decoration: BoxDecoration(
                  color: BaseColor.secondaryBlue,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BaseBoxShadow.common]),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: BaseColor.transfer,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset("assets/icons/transfer.png"),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Chuyển tiền",
                      style: BaseTextStyle.heading4(color: BaseColor.black),
                    ),
                    Text(
                      "Miễn phí và an toàn",
                      style: BaseTextStyle.caption(color: BaseColor.black),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width / 2 - 24,
              decoration: BoxDecoration(
                color: BaseColor.secondaryRed,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: BaseColor.red,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset("assets/icons/scan_qr.png"),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Mua bán",
                      style: BaseTextStyle.heading4(color: BaseColor.black),
                    ),
                    Text(
                      "Quét mã QR",
                      style: BaseTextStyle.caption(color: BaseColor.black),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
