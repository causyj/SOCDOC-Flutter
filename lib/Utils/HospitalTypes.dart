class HospitalItem {
  const HospitalItem({required this.ko, required this.en, required this.num});

  final String en;
  final String ko;
  final int num;
}

const List<HospitalItem> HospitalTypes = [
  HospitalItem(ko: "전체", en: "All", num:0),
  HospitalItem(ko: "내과", en: "Internal Medicine",num:1),
  HospitalItem(ko: "소아청소년과", en: "Pediatrics",num:2),
  HospitalItem(ko: "신경과", en: "Neurology",num:3),
  HospitalItem(ko: "정신건강의학과", en: "Psychiatry",num:4),
  HospitalItem(ko: "피부과", en: "Dermatology", num:5),
  HospitalItem(ko: "외과", en: "Surgical", num:6),
  HospitalItem(ko: "흉부외과", en: "Thoracic Surgery", num:7),
  HospitalItem(ko: "정형외과", en: "Orthopedics", num:8),
  HospitalItem(ko: "신경외과", en: "Neurosurgery", num:9),
  HospitalItem(ko: "성형외과", en: "Plastic Surgery", num:10),
  HospitalItem(ko: "산부인과", en: "Obstetrics and Gynecology", num:11),
  HospitalItem(ko: "안과", en: "Ophthalmology", num:12),
  HospitalItem(ko: "이비인후과", en: "Otolaryngology", num:13),
  HospitalItem(ko: "비뇨기과", en: "Urology", num:14),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "재활의학과", en: "Rehabilitation Medicine", num:16),
  HospitalItem(ko: "마취통증의학과", en: "Anesthesiology and Pain Medicine", num:17),
  HospitalItem(ko: "영상의학과", en: "Radiology", num:18),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "가정의학과", en: "Family Medicine", num:22),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "치과", en: "Dental", num:26),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "", en: "", num:-1),
  HospitalItem(ko: "구강악안면외과", en: "Oral Maxillofacial Surgery", num:34),
];
