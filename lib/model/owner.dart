class Owner {
  List<String>? _businessType;
  bool? _approved;
  bool? _blocked;
  String? _role;
  String? _name;
  String? _phone;
  String? _email;
  String? _latitude;
  String? _longitude;
  String? _cf1;
  String? _cf2;
  String? _cf3;
  String? _bankName;
  String? _acNo;
  String? _ifscCode;
  String? _address;
  String? _panNo;
  String? _addressProofImg;
  String? _cancelChequeImg;
  String? _gstCertificateImg;
  String? _profileImg;
  String? _aadharCardImg;
  String? _panCardImg;
  String? _id;
  String? _flag;

  List<String>? get businessType => _businessType;
  bool? get approved => _approved;
  bool? get blocked => _blocked;
  String? get role => _role;
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get cf1 => _cf1;
  String? get cf2 => _cf2;
  String? get cf3 => _cf3;
  String? get bankName => _bankName;
  String? get acNo => _acNo;
  String? get ifscCode => _ifscCode;
  String? get address => _address;
  String? get panNo => _panNo;
  String? get addressProofImg => _addressProofImg;
  String? get cancelChequeImg => _cancelChequeImg;
  String? get gstCertificateImg => _gstCertificateImg;
  String? get profileImg => _profileImg;
  String? get aadharCardImg => _aadharCardImg;
  String? get panCardImg => _panCardImg;
  String? get id => _id;
  String? get flag => _flag;

  Owner({
    List<String>? businessType,
    bool? approved,
    bool? blocked,
    String? role,
    String? name,
    String? phone,
    String? email,
    String? latitude,
    String? longitude,
    String? cf1,
    String? cf2,
    String? cf3,
    String? bankName,
    String? acNo,
    String? ifscCode,
    String? address,
    String? panNo,
    String? addressProofImg,
    String? cancelChequeImg,
    String? gstCertificateImg,
    String? profileImg,
    String? aadharCardImg,
    String? panCardImg,
    String? id,
    String? flag,
  }){
    _businessType = businessType;
    _approved = approved;
    _blocked = blocked;
    _role = role;
    _name = name;
    _phone = phone;
    _email = email;
    _latitude = latitude;
    _longitude = longitude;
    _cf1 = cf1;
    _cf2 = cf2;
    _cf3 = cf3;
    _bankName = bankName;
    _acNo = acNo;
    _ifscCode = ifscCode;
    _address = address;
    _panNo = panNo;
    _addressProofImg = addressProofImg;
    _cancelChequeImg = cancelChequeImg;
    _gstCertificateImg = gstCertificateImg;
    _profileImg = profileImg;
    _aadharCardImg = aadharCardImg;
    _panCardImg = panCardImg;
    _id = id;
    _flag =flag;
  }

  Owner.fromJson(dynamic json) {
    _businessType = json["business_type"] != null ? json["business_type"].cast<String>() : [];
    _approved = json["approved"];
    _blocked = json["blocked"];
    _role = json["role"];
    _name = json["name"];
    _phone = json["phone"];
    _email = json["email"];
    _latitude = json["latitude"];
    _longitude = json["longitude"];
    _cf1 = json["cf1"];
    _cf2 = json["cf2"];
    _cf3 = json["cf3"];
    _bankName = json["bank_name"];
    _acNo = json["ac_no"];
    _ifscCode = json["ifsc_code"];
    _address = json["address"];
    _panNo = json["pan_no"];
    _addressProofImg = json["address_proof_img"];
    _cancelChequeImg = json["cancel_cheque_img"];
    _gstCertificateImg = json["gst_certificate_img"];
    _profileImg = json["profile_img"];
    _aadharCardImg = json["aadhar_card_img"];
    _panCardImg = json["pan_card_img"];
    _id = json["id"];
    _flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["business_type"] = _businessType;
    map["approved"] = _approved;
    map["blocked"] = _blocked;
    map["role"] = _role;
    map["name"] = _name;
    map["phone"] = _phone;
    map["email"] = _email;
    map["latitude"] = _latitude;
    map["longitude"] = _longitude;
    map["cf1"] = _cf1;
    map["cf2"] = _cf2;
    map["cf3"] = _cf3;
    map["bank_name"] = _bankName;
    map["ac_no"] = _acNo;
    map["ifsc_code"] = _ifscCode;
    map["address"] = _address;
    map["pan_no"] = _panNo;
    map["address_proof_img"] = _addressProofImg;
    map["cancel_cheque_img"] = _cancelChequeImg;
    map["gst_certificate_img"] = _gstCertificateImg;
    map["profile_img"] = _profileImg;
    map["aadhar_card_img"] = _aadharCardImg;
    map["pan_card_img"] = _panCardImg;
    map["id"] = _id;
    map['flag'] = _flag;
    return map;
  }

}