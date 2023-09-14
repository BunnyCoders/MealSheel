// import 'package:flutter/material.dart';

// import '../core/design_system.dart';

// class TextLink extends StatelessWidget {
//   const TextLink({
//     Key? key,
//     required this.text,
//     required this.onTap,
//   }) : super(key: key);

//   final String text;
//   final Function onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => onTap(),
//       child: Ink(
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: DSColors.borderLight,
//             style: BorderStyle.solid,
//             width: 1,
//           ),
//           borderRadius: const BorderRadius.all(
//             Radius.circular(DSSizes.sm),
//           ),
//           color: DSColors.backgroundBodyGrey,
//         ),
//         padding: const EdgeInsets.all(
//           DSSizes.md,
//         ),
//         child: SizedBox(
//           width: double.infinity,
//           child: Text(
//             text,
//             style: DSType.subtitle2(textColor: DSColors.headingDark),
//           ),
//         ),
//       ),
//     );
//   }
// }
