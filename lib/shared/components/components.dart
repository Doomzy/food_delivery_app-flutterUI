import 'package:flutter/material.dart';

Widget circleLogo({double scale = 100, name = 'logo'}) => Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: scale / 1.3,
          height: scale / 1.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(200),
          ),
        ),
        Image.asset(
          'assets/logo/$name.png',
          width: scale,
        ),
      ],
    );
Widget customButton({
  required text,
  required VoidCallback onPressed,
  bgColor = Colors.white,
  textColor = const Color.fromRGBO(255, 70, 10, 1),
  double height = 70.0,
  icon,
}) =>
    MaterialButton(
      elevation: 0,
      color: bgColor,
      textColor: textColor,
      height: height,
      minWidth: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? SizedBox(
                  width: 50,
                  child: Image.asset(icon, scale: 3),
                )
              : const SizedBox(),
          Text(
            text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: onPressed,
    );

Widget customTextField({required hint, prefix, bgColor = Colors.white}) =>
    Container(
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          border: InputBorder.none,
          fillColor: bgColor,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(160, 160, 160, 0.6),
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: prefix,
        ),
      ),
    );

Widget savedLocation({
  required icon,
  required locationHeader,
  required VoidCallback onTap,
  locationAddress,
}) =>
    InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 40),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locationHeader,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                locationAddress != null
                    ? Text(
                        locationAddress,
                        maxLines: null,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color.fromRGBO(178, 178, 178, 1),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
