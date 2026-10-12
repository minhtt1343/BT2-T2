# Bài tập về nhà: Vòng lặp for và kiểu nullable

## 📋 Yêu cầu bài tập
1. Tạo class `Student` gồm các thuộc tính: `String name`, `String? email`, `String? phone`.
2. Tạo danh sách (List) gồm 5 sinh viên, trong đó có người bị thiếu email hoặc số điện thoại (`null`)[cite: 6].
3. Sử dụng vòng lặp `for` để tạo các thẻ sinh viên hiển thị lên giao diện[cite: 6].
4. Xử lý dữ liệu bị thiếu (`null`) bằng toán tử `??`, tự động hiển thị chữ `"Chưa cập nhật"` khi `null`[cite: 6].
5. Sử dụng vòng lặp `for` để đếm tổng số sinh viên bị thiếu email và hiển thị kết quả ở thanh footer[cite: 6].

---

## 🖼️ Giao diện ứng dụng và kết quả thực hiện

| Giao diện Bài 1: Danh sách sinh viên |
| :---: |
| ![Giao diện Bài 1](./assets/bai_tap_2.png) |

---

## 🛠️ Các Widget đã sử dụng
* `Scaffold`, `AppBar`[cite: 6]
* `Column`, `Row`[cite: 6]
* `Container`, `SizedBox`[cite: 6]
* `Text`, `SingleChildScrollView`[cite: 6]

## Cách chạy giao diện: 
cd bai_tap_2
flutter run -d web-server