/// apod_site : "https://apod.nasa.gov/apod/ap181027.html"
/// copyright : "Yuri Beletsky (Carnegie Las Campanas Observatory, TWAN)"
/// date : "2018-10-27"
/// description : "The best known asterism in northern skies hangs over the Canadian Rockies in this mountain and night skyscape taken last week from Banff National Park. But most remarkable is the amazing greenish airglow. With airglow visible to the eye, but not in color, the scene was captured in two exposures with a single camera, one exposure made while tracking the stars and one fixed to a tripod. Airglow emission is predominately from atmospheric oxygen atoms at extremely low densities. Commonly recorded in color by sensitive digital cameras the eerie, diffuse light is seen here in waves across the northern night. Originating at an altitude similar to aurorae, the luminous airglow is due to chemiluminescence, the production of light through chemical excitation and radiative decay. Energy for the chemical excitation is provided during daytime by the Sun's extreme ultraviolet radiation. Unlike aurorae which are limited to high latitudes, airglow can be found around the globe."
/// hdurl : "https://apod.nasa.gov/apod/image/1810/airglow_banff_beletsky.jpg"
/// media_type : "image"
/// title : "Airglow Borealis"
/// url : "https://apod.nasa.gov/apod/image/1810/airglow_banff_beletsky1082.jpg"

class PotdModels {
  PotdModels({
      String? apodSite, 
      String? copyright, 
      String? date, 
      String? description, 
      String? hdurl, 
      String? mediaType, 
      String? title, 
      String? url,}){
    _apodSite = apodSite;
    _copyright = copyright;
    _date = date;
    _description = description;
    _hdurl = hdurl;
    _mediaType = mediaType;
    _title = title;
    _url = url;
}

  PotdModels.fromJson(dynamic json) {
    _apodSite = json['apod_site'];
    _copyright = json['copyright'];
    _date = json['date'];
    _description = json['description'];
    _hdurl = json['hdurl'];
    _mediaType = json['media_type'];
    _title = json['title'];
    _url = json['url'];
  }
  String? _apodSite;
  String? _copyright;
  String? _date;
  String? _description;
  String? _hdurl;
  String? _mediaType;
  String? _title;
  String? _url;
PotdModels copyWith({  String? apodSite,
  String? copyright,
  String? date,
  String? description,
  String? hdurl,
  String? mediaType,
  String? title,
  String? url,
}) => PotdModels(  apodSite: apodSite ?? _apodSite,
  copyright: copyright ?? _copyright,
  date: date ?? _date,
  description: description ?? _description,
  hdurl: hdurl ?? _hdurl,
  mediaType: mediaType ?? _mediaType,
  title: title ?? _title,
  url: url ?? _url,
);
  String? get apodSite => _apodSite;
  String? get copyright => _copyright;
  String? get date => _date;
  String? get description => _description;
  String? get hdurl => _hdurl;
  String? get mediaType => _mediaType;
  String? get title => _title;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apod_site'] = _apodSite;
    map['copyright'] = _copyright;
    map['date'] = _date;
    map['description'] = _description;
    map['hdurl'] = _hdurl;
    map['media_type'] = _mediaType;
    map['title'] = _title;
    map['url'] = _url;
    return map;
  }

}