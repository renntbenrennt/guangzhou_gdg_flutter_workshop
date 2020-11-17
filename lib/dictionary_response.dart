// To parse this JSON data, do
//
//     final dictionaryResponse = dictionaryResponseFromJson(jsonString);

import 'dart:convert';

List<DictionaryResponse> dictionaryResponseFromJson(String str) =>
    List<DictionaryResponse>.from(
        json.decode(str).map((x) => DictionaryResponse.fromJson(x)));

String dictionaryResponseToJson(List<DictionaryResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DictionaryResponse {
  DictionaryResponse({
    this.meta,
    this.hwi,
    this.fl,
    this.def,
    this.shortdef,
  });

  Meta meta;
  Hwi hwi;
  String fl;
  List<Def> def;
  List<String> shortdef;

  factory DictionaryResponse.fromJson(Map<String, dynamic> json) =>
      DictionaryResponse(
        meta: Meta.fromJson(json["meta"]),
        hwi: Hwi.fromJson(json["hwi"]),
        fl: json["fl"],
        def: List<Def>.from(json["def"].map((x) => Def.fromJson(x))),
        shortdef: List<String>.from(json["shortdef"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "hwi": hwi.toJson(),
        "fl": fl,
        "def": List<dynamic>.from(def.map((x) => x.toJson())),
        "shortdef": List<dynamic>.from(shortdef.map((x) => x)),
      };
}

class Def {
  Def({
    this.sseq,
  });

  List<List<List<dynamic>>> sseq;

  factory Def.fromJson(Map<String, dynamic> json) => Def(
        sseq: List<List<List<dynamic>>>.from(json["sseq"].map((x) =>
            List<List<dynamic>>.from(
                x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
      );

  Map<String, dynamic> toJson() => {
        "sseq": List<dynamic>.from(sseq.map((x) => List<dynamic>.from(
            x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
      };
}

class SseqClass {
  SseqClass({
    this.sn,
    this.dt,
    this.synList,
    this.relList,
    this.nearList,
    this.antList,
    this.simList,
    this.oppList,
  });

  String sn;
  List<List<dynamic>> dt;
  List<List<SynList>> synList;
  List<List<RelList>> relList;
  List<List<AntListElement>> nearList;
  List<List<AntListElement>> antList;
  List<List<AntListElement>> simList;
  List<List<AntListElement>> oppList;

  factory SseqClass.fromJson(Map<String, dynamic> json) => SseqClass(
        sn: json["sn"] == null ? null : json["sn"],
        dt: List<List<dynamic>>.from(
            json["dt"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        synList: json["syn_list"] == null
            ? null
            : List<List<SynList>>.from(json["syn_list"].map(
                (x) => List<SynList>.from(x.map((x) => SynList.fromJson(x))))),
        relList: json["rel_list"] == null
            ? null
            : List<List<RelList>>.from(json["rel_list"].map(
                (x) => List<RelList>.from(x.map((x) => RelList.fromJson(x))))),
        nearList: json["near_list"] == null
            ? null
            : List<List<AntListElement>>.from(json["near_list"].map((x) =>
                List<AntListElement>.from(
                    x.map((x) => AntListElement.fromJson(x))))),
        antList: json["ant_list"] == null
            ? null
            : List<List<AntListElement>>.from(json["ant_list"].map((x) =>
                List<AntListElement>.from(
                    x.map((x) => AntListElement.fromJson(x))))),
        simList: json["sim_list"] == null
            ? null
            : List<List<AntListElement>>.from(json["sim_list"].map((x) =>
                List<AntListElement>.from(
                    x.map((x) => AntListElement.fromJson(x))))),
        oppList: json["opp_list"] == null
            ? null
            : List<List<AntListElement>>.from(json["opp_list"].map((x) =>
                List<AntListElement>.from(
                    x.map((x) => AntListElement.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "sn": sn == null ? null : sn,
        "dt": List<dynamic>.from(
            dt.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "syn_list": synList == null
            ? null
            : List<dynamic>.from(synList
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "rel_list": relList == null
            ? null
            : List<dynamic>.from(relList
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "near_list": nearList == null
            ? null
            : List<dynamic>.from(nearList
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "ant_list": antList == null
            ? null
            : List<dynamic>.from(antList
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "sim_list": simList == null
            ? null
            : List<dynamic>.from(simList
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "opp_list": oppList == null
            ? null
            : List<dynamic>.from(oppList
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class AntListElement {
  AntListElement({
    this.wd,
  });

  String wd;

  factory AntListElement.fromJson(Map<String, dynamic> json) => AntListElement(
        wd: json["wd"],
      );

  Map<String, dynamic> toJson() => {
        "wd": wd,
      };
}

class DtClass {
  DtClass({
    this.t,
  });

  String t;

  factory DtClass.fromJson(Map<String, dynamic> json) => DtClass(
        t: json["t"],
      );

  Map<String, dynamic> toJson() => {
        "t": t,
      };
}

class RelList {
  RelList({
    this.wd,
    this.wvrs,
  });

  String wd;
  List<Wvr> wvrs;

  factory RelList.fromJson(Map<String, dynamic> json) => RelList(
        wd: json["wd"],
        wvrs: json["wvrs"] == null
            ? null
            : List<Wvr>.from(json["wvrs"].map((x) => Wvr.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "wd": wd,
        "wvrs": wvrs == null
            ? null
            : List<dynamic>.from(wvrs.map((x) => x.toJson())),
      };
}

class Wvr {
  Wvr({
    this.wvl,
    this.wva,
  });

  String wvl;
  String wva;

  factory Wvr.fromJson(Map<String, dynamic> json) => Wvr(
        wvl: json["wvl"],
        wva: json["wva"],
      );

  Map<String, dynamic> toJson() => {
        "wvl": wvl,
        "wva": wva,
      };
}

class SynList {
  SynList({
    this.wd,
    this.wsls,
    this.wvrs,
  });

  String wd;
  List<String> wsls;
  List<Wvr> wvrs;

  factory SynList.fromJson(Map<String, dynamic> json) => SynList(
        wd: json["wd"],
        wsls: json["wsls"] == null
            ? null
            : List<String>.from(json["wsls"].map((x) => x)),
        wvrs: json["wvrs"] == null
            ? null
            : List<Wvr>.from(json["wvrs"].map((x) => Wvr.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "wd": wd,
        "wsls": wsls == null ? null : List<dynamic>.from(wsls.map((x) => x)),
        "wvrs": wvrs == null
            ? null
            : List<dynamic>.from(wvrs.map((x) => x.toJson())),
      };
}

class Hwi {
  Hwi({
    this.hw,
  });

  String hw;

  factory Hwi.fromJson(Map<String, dynamic> json) => Hwi(
        hw: json["hw"],
      );

  Map<String, dynamic> toJson() => {
        "hw": hw,
      };
}

class Meta {
  Meta({
    this.id,
    this.uuid,
    this.src,
    this.section,
    this.target,
    this.stems,
    this.syns,
    this.ants,
    this.offensive,
  });

  String id;
  String uuid;
  String src;
  String section;
  Target target;
  List<String> stems;
  List<List<String>> syns;
  List<List<String>> ants;
  bool offensive;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        id: json["id"],
        uuid: json["uuid"],
        src: json["src"],
        section: json["section"],
        target: json["target"] == null ? null : Target.fromJson(json["target"]),
        stems: List<String>.from(json["stems"].map((x) => x)),
        syns: List<List<String>>.from(
            json["syns"].map((x) => List<String>.from(x.map((x) => x)))),
        ants: List<List<String>>.from(
            json["ants"].map((x) => List<String>.from(x.map((x) => x)))),
        offensive: json["offensive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "src": src,
        "section": section,
        "target": target == null ? null : target.toJson(),
        "stems": List<dynamic>.from(stems.map((x) => x)),
        "syns": List<dynamic>.from(
            syns.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "ants": List<dynamic>.from(
            ants.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "offensive": offensive,
      };
}

class Target {
  Target({
    this.tuuid,
    this.tsrc,
  });

  String tuuid;
  String tsrc;

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        tuuid: json["tuuid"],
        tsrc: json["tsrc"],
      );

  Map<String, dynamic> toJson() => {
        "tuuid": tuuid,
        "tsrc": tsrc,
      };
}
