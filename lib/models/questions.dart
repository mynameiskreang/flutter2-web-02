class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "นาย ต.ตู่ มีตังอยู่ในกระเป๋า 33,712,000,000 บาท เอาไปลงทุนอะไรดี?",
    "options": ['ซื้อ course udemy', 'ซื้อวัคซีน', 'ซื้อประกัน', 'ซื้อรถถัง'],
    "answer_index": 3,
  },
  {
    "id": 2,
    "question":
        "นส.พอ อยากสอบบรรจุเป็นข้าราชการ เพื่อทำงานให้ประชาชน ควรทำอย่างไร?",
    "options": ['สอบ กพ.', 'สอบตรงหน่วยงาน', 'ฝึกตีกอล์ฟ', 'ตีสนิทธรรมนัส'],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question":
        "คุณกำลังจะเดินทางไปต่างประเทศ สิ่งไหนที่คุณห้ามนำขึ้นเครื่องบิน?",
    "options": ['ปืน', 'มืด', 'ยาดม', 'แป้ง'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "มีอยู่วันหนึ่ง คุณอยากไปเยี่ยมชมสภา ควรเตรียมตัวอย่างไร?",
    "options": ['ใส่แมส', 'ติดบัตรเจ้าหน้าที่', 'ปรึกษาช่างแอร์', 'พกธรรมนัส'],
    "answer_index": 3,
  },
];
