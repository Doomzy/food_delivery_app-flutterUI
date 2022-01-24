import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
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
  double txtSize = 17,
  icon,
  bool border = false,
  double bRaduis = 30,
}) =>
    MaterialButton(
      elevation: 0,
      color: bgColor,
      textColor: textColor,
      height: height,
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
            style: TextStyle(fontSize: txtSize, fontWeight: FontWeight.w700),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bRaduis),
        side: border == true
            ? const BorderSide(
                color: Color.fromRGBO(200, 200, 200, 1),
                width: 0.67,
              )
            : BorderSide.none,
      ),
      onPressed: onPressed,
    );

Widget customTextField({
  required hint,
  prefix,
  bgColor = Colors.white,
  double mBottom = 20,
  double hPadding = 10,
  double vPadding = 20,
}) =>
    Container(
      margin: EdgeInsetsDirectional.only(bottom: mBottom),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: hPadding,
            vertical: vPadding,
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
  double hPadding = 25,
  double vPadding = 10,
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
        padding: EdgeInsets.symmetric(
          vertical: vPadding,
          horizontal: vPadding,
        ),
        child: Row(
          children: [
            Icon(
              prefix,
              size: prefix == null ? 0 : 30,
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
          height: MediaQuery.of(context).size.height * 0.17,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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

Widget circularItem({required text, required img, required double size}) =>
    Expanded(
      child: Column(
        children: [
          ClipOval(
            child: SizedBox(
              width: size,
              height: size,
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            maxLines: null,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Color.fromRGBO(112, 112, 112, 1),
            ),
          )
        ],
      ),
    );

Widget circularItemsList({required List itemList, double size = 50}) =>
    Container(
      margin: const EdgeInsetsDirectional.only(top: 25, bottom: 25),
      child: Row(
        children: itemList
            .map((e) => circularItem(text: e.text, img: e.img, size: size))
            .toList(),
      ),
    );

Widget userPreferences({required context}) => Padding(
      padding: const EdgeInsetsDirectional.only(top: 25, start: 25, end: 25),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Your Preferences',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Metropolis',
                  color: Color.fromRGBO(79, 169, 135, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              MaterialButton(
                minWidth: 0,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                onPressed: () {},
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(117, 117, 117, 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Now order user specific food directly below!',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Metropolis',
              color: Color.fromRGBO(155, 155, 155, 1),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) => customTextButton(
                text: 'User${i + 1}',
                onTap: () {},
                sufix: Icons.arrow_forward_ios,
                vPadding: 20,
              ),
              separatorBuilder: (context, i) => const SizedBox(height: 20),
              itemCount: 4,
            ),
          ),
          const Divider(thickness: 0.8, height: 1),
        ],
      ),
    );

Widget cardMainText({required text}) => Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 17,
        fontFamily: 'Metropolis',
        fontWeight: FontWeight.bold,
      ),
    );

Widget cardSecondaryText({required text}) => Text(
      text,
      maxLines: 2,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: Color.fromRGBO(122, 122, 122, 1),
      ),
    );

Widget priceText({
  required price,
  discount = false,
  color = const Color.fromRGBO(248, 137, 34, 1),
}) =>
    Text(
      price,
      style: TextStyle(
        color: color,
        decoration: discount ? TextDecoration.lineThrough : TextDecoration.none,
        fontFamily: 'Metropolis',
        fontWeight: FontWeight.w700,
        fontSize: discount ? 12 : 17,
      ),
    );

Widget tagText({
  required tag,
  margin = false,
  bgColor = Colors.white,
  txtColor = const Color.fromRGBO(112, 112, 112, 1),
  double txtSize = 10,
  suffix,
}) =>
    Container(
      margin: margin
          ? const EdgeInsetsDirectional.only(start: 14)
          : const EdgeInsets.all(0),
      padding: const EdgeInsetsDirectional.all(5),
      decoration: ShapeDecoration(
        color: bgColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
            side: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            )),
      ),
      child: Row(
        children: [
          Text(
            tag,
            style: TextStyle(
              fontSize: txtSize,
              color: txtColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Visibility(
              visible: suffix != null ? true : false,
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Icon(
                    suffix,
                    color: txtColor,
                    size: txtSize + 5,
                  )
                ],
              ))
        ],
      ),
    );

Widget overImgTag({
  required item,
  required isMeal,
  double mTop = 14,
  double txtSize = 13,
}) {
  return Visibility(
    visible: item.discount,
    child: Container(
      margin: EdgeInsetsDirectional.only(top: mTop),
      padding: const EdgeInsetsDirectional.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.elliptical(20, 5),
          topEnd: Radius.elliptical(20, 10),
          bottomEnd: Radius.elliptical(20, 10),
        ),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(250, 87, 105, 1),
          Color.fromRGBO(252, 167, 133, 1),
        ]),
      ),
      child: Text(
        isMeal
            ? '${item.oldPrice == null ? 0 : ((item.oldPrice - item.price) / item.oldPrice * 100).round()}% OFF'
            : '${item.discountAmount}% OFF',
        style: TextStyle(
          fontSize: txtSize,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

Widget carouselVerticalItem({
  required context,
  required item,
  required border,
}) {
  double cardHeight = MediaQuery.of(context).size.height * 0.3;
  double cardWidth = MediaQuery.of(context).size.width * 0.45;
  bool ismeal = item is MealItem ? true : false;

  return Stack(
    alignment: AlignmentDirectional.topStart,
    children: [
      Container(
        width: cardWidth,
        clipBehavior: Clip.hardEdge,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
            side: border
                ? const BorderSide(
                    color: Color.fromRGBO(196, 196, 196, 1), width: 0.5)
                : BorderSide.none,
          ),
          shadows: const [
            BoxShadow(
              color: Color.fromRGBO(98, 98, 98, 0.07),
              blurRadius: 9,
              spreadRadius: 0,
              offset: Offset(-2.5, 2.5),
            )
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: cardHeight * 0.5,
              width: double.infinity,
              child: Image.asset(
                item.img,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: cardHeight * 0.54,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cardMainText(text: item.name),
                  const SizedBox(height: 5),
                  cardSecondaryText(
                    text: ismeal ? item.resturant : item.tags.join(", "),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      priceText(price: ismeal ? '\$${item.price}' : ''),
                      const SizedBox(width: 5),
                      Visibility(
                        visible: item.discount,
                        child: priceText(
                          price: ismeal ? '\$${item.oldPrice}' : '',
                          discount: true,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.bookmark,
                        color: Color.fromRGBO(200, 200, 200, 1),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: cardHeight * 0.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //discount
            overImgTag(item: item, isMeal: ismeal),
            const Spacer(),
            //Free delivery
            Visibility(
              visible: item.freeDelivery,
              child: tagText(tag: 'FREE DELIVERY', margin: true),
            )
          ],
        ),
      ),
    ],
  );
}

Widget carouselHorizontalItem({
  required context,
  required item,
}) {
  double cardHeight = MediaQuery.of(context).size.height;
  return Stack(
    children: [
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
              side: const BorderSide(
                color: Color.fromRGBO(200, 200, 200, 1),
              )),
        ),
        height: cardHeight * 0.35,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: cardHeight * 0.17,
              width: double.infinity,
              child: Image.asset(
                item.img,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: cardHeight * 0.12,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cardMainText(text: item.name),
                      cardSecondaryText(text: item.resturant),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          priceText(price: '\$${item.price}'),
                          const SizedBox(width: 5),
                          Visibility(
                            visible: item.discount,
                            child: priceText(
                              price: '\$${item.oldPrice}',
                              discount: true,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      tagText(
                        tag: item.resturantRating.toString(),
                        bgColor: const Color.fromRGBO(80, 152, 7, 1),
                        txtColor: Colors.white,
                        txtSize: 15,
                        suffix: Icons.star,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.local_fire_department,
                            color: Colors.orange,
                          ),
                          cardSecondaryText(text: item.totCals.toString())
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Visibility(
                    visible: item.freeDelivery,
                    child: Row(
                      children: [
                        tagText(tag: 'FREE DELIVERY'),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: item.rescued,
                    child: Row(
                      children: [
                        tagText(tag: 'RESCUED'),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.34,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            overImgTag(
              item: item,
              isMeal: true,
              mTop: 50,
              txtSize: 15,
            ),
          ],
        ),
      )
    ],
  );
}

Widget customCarouselSlider({
  required context,
  required List items,
  itemBorder = false,
  controller,
}) =>
    Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.352,
      child: ListView.separated(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, i) => carouselVerticalItem(
          context: context,
          item: items[i],
          border: itemBorder,
        ),
        separatorBuilder: (context, i) => const SizedBox(width: 10),
      ),
    );
