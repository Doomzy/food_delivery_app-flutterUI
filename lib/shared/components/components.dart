import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/location/location_screen.dart';
import 'package:food_delivery_app/shared/utils/utils.dart';

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
  double spacer = 25.0,
  bool multiLines = true,
  locationAddress,
}) =>
    InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 40, color: const Color.fromRGBO(46, 58, 89, 1)),
          SizedBox(width: spacer),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                        maxLines: multiLines ? null : 1,
                        overflow: multiLines
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
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

Widget customTextButton({
  required text,
  required VoidCallback onTap,
  prefix,
  sufix,
  double raduis = 13,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          color: const Color.fromRGBO(243, 243, 243, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25,
        ),
        child: Row(
          children: [
            Icon(
              prefix,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Icon(sufix),
          ],
        ),
      ),
    );

Widget customAppBar({required context}) => Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: savedLocation(
                      icon: Icons.home_outlined,
                      locationHeader: 'Home',
                      locationAddress:
                          '21-42-34, Banjara Hills, Hyderabad, 500072',
                      spacer: 8,
                      multiLines: false,
                      onTap: () => navigateToAndRemove(
                        context: context,
                        destination: LocationScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      size: 32,
                      color: Color.fromRGBO(77, 187, 172, 1),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: customTextButton(
                      text: 'Search food',
                      onTap: () {},
                      prefix: Icons.search,
                    ),
                  ),
                  const SizedBox(width: 20),
                  MaterialButton(
                    minWidth: 30,
                    padding: const EdgeInsets.all(10),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: const BorderSide(
                          color: Color.fromRGBO(200, 200, 200, 1)),
                    ),
                    child: const Icon(
                      Icons.filter_alt,
                      size: 22,
                      color: Color.fromRGBO(77, 187, 172, 1),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
