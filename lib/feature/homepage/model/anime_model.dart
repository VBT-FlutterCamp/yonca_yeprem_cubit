import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

class AnimeModel extends INetworkModel{
    AnimeModel({
        this.success,
        this.data,
    });

    bool? success;
    List<Datum>? data;

    factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ??{}),
    };

  @override
  fromJson(Map<String, dynamic> json) {
    return AnimeModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
    Datum({
        this.animeId,
        this.animeName,
        this.animeImg,
    });

    int? animeId;
    String? animeName;
    String? animeImg;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        animeId: json["anime_id"],
        animeName: json["anime_name"],
        animeImg: json["anime_img"],
    );

    Map<String, dynamic> toJson() => {
        "anime_id": animeId,
        "anime_name": animeName,
        "anime_img": animeImg,
    };
}
