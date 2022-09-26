import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComWid{
  static ClipRRect cacheImage(double cardHeight, String url, {bool needSqureImage = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        decoration: const BoxDecoration(),
        height: cardHeight,
        width: !needSqureImage ? cardHeight - 20 : cardHeight,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: url,
          placeholder: (context, url) => Opacity(
            opacity: 0.5,
            child: Center(
              child: Image.asset(
                'assets/png/placeholder.png',
                fit: BoxFit.cover,
                height: cardHeight,
                width: !needSqureImage ? cardHeight - 20 : cardHeight,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Opacity(
            opacity: 0.5,
            child: Center(
              child: Image.asset(
                'assets/png/placeholder.png',
                fit: BoxFit.cover,
                height: cardHeight,
                width: !needSqureImage ? cardHeight - 20 : cardHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}