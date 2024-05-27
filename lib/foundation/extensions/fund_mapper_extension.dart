


// extension FundMapperExt on Fund {
//   FundItems toFundItems() {
//     return FundItems(
//       id: id,
//       name: name,
//       imageUrl: imageUrl,
//       videoUrl: youtubeVideoUrl ?? '',
//       nowApplyMoney: '応募金額：${nowApplyMoney.formatAmount()}円',
//       nowApplyRate: '　${(nowApplyRate * 100).floor().toString()}%',
//       fundType: fundType.toFundTypeName(),
//       expectedRate: '利回り${(expectedRate * 100).roundDouble().toString()}%',
//       calcInterval: '分配時期：${calcInterval.toString()}ヶ月に一度',
//       operationPeriod:
//           '運用期間：' + operationBeginAt.differenceDate(operationEndAt),
//       amount: '募集金額：${amount.formatAmount()}円',
//       collectRemainTime:
//           _collectRemainTime(operationBeginAt, collectRemainTime),
//       collectBeginAt: '',
//     );
//   }
// }

// String _collectRemainTime(String operationBeginAt, String collectRemainTime) {
//   var targetDate = operationBeginAt.formatJstDate();
//   if (targetDate.isAfter(DateTime.now())) {
//     return '募集開始日：${operationBeginAt.formatJstDateStr('yyyy/MM/dd')}';
//   }
//   return '残り募集期間：$collectRemainTime';
// }
