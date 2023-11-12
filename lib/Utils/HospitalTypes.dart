class HospitalItem {
  const HospitalItem({required this.ko, required this.en});

  final String en;
  final String ko;
}

const List<HospitalItem> hospitalList = [
  HospitalItem(ko: "전체", en: "All"),
  HospitalItem(ko: "내과", en: "Internal Medicine"),
  HospitalItem(ko: "소아청소년과", en: "Pediatrics"),
  HospitalItem(ko: "신경과", en: "Neurology"),
  HospitalItem(ko: "정신건강의학과", en: "Psychiatry"),
  HospitalItem(ko: "피부과", en: "Dermatology"),
  HospitalItem(ko: "외과", en: "Surgical"),
  HospitalItem(ko: "흉부외과", en: "Thoracic Surgery"),
  HospitalItem(ko: "정형외과", en: "Orthopedics"),
  HospitalItem(ko: "신경외과", en: "Neurosurgery"),
  HospitalItem(ko: "성형외과", en: "Plastic Surgery"),
  HospitalItem(ko: "산부인과", en: "Obstetrics and Gynecology"),
  HospitalItem(ko: "안과", en: "Ophthalmology"),
  HospitalItem(ko: "이비인후과", en: "Otolaryngology"),
  HospitalItem(ko: "비뇨기과", en: "Urology"),
  HospitalItem(ko: "재활의학과", en: "Rehabilitation Medicine"),
  HospitalItem(ko: "마취통증의학과", en: "Anesthesiology and Pain Medicine"),
  HospitalItem(ko: "영상의학과", en: "Radiology"),
  HospitalItem(ko: "가정의학과", en: "Family Medicine"),
  HospitalItem(ko: "치과", en: "Dental"),
  HospitalItem(ko: "구강악안면외과", en: "Oral Maxillofacial Surgery"),
];
