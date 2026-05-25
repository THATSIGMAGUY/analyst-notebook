# Thai Police Analyst's Notebook

เครื่องมือวิเคราะห์ความเชื่อมโยง (Link Analysis) สำหรับงานสืบสวนสอบสวน  
ออกแบบตามมาตรฐาน IBM i2 Analyst's Notebook

## การใช้งาน

1. ดาวน์โหลด `analyst-notebook.html`
2. Double-click เปิดใน Chrome หรือ Edge
3. ไม่ต้องติดตั้ง ไม่ต้องมี internet — ใช้งานได้ทันที

## คุณสมบัติหลัก

- Link Analysis — วาดความสัมพันธ์ระหว่างบุคคล / บัญชี / สถานที่
- Timeline Analysis — เรียงเหตุการณ์ตามเวลา
- Co-Travel / Pattern Analysis — ตรวจหาคู่เดินทาง
- Community Detection (Louvain) — แบ่งกลุ่มเครือข่าย
- Centrality Analysis — ระบุตัวเชื่อม / ศูนย์กลาง
- Case Methodology Guide — คู่มือสืบสวนตามประเภทคดี (ยาเสพติด / ฟอกเงิน / ค้ามนุษย์ / ไซเบอร์ / ตม.)
- AI-assisted extraction — นำเข้าข้อมูลจากเอกสารด้วย LLM
- IBM i2 standard shapes, colors, and line styles

## ข้อมูลทางเทคนิค

- Single HTML file, ทำงานใน `file://` — ไม่ต้องการ server
- ข้อมูลเก็บใน localStorage เท่านั้น ไม่มีการส่งออก
- รองรับ import/export เป็น JSON

## Version

v3.5.8
