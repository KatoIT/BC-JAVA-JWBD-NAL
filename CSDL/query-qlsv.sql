-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject)

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT *
FROM Subject JOIN MARK ON MARK.SubID = Subject.SubID
WHERE MARK = (SELECT MAX(MARK) FROM MARK)

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT Student.StudentID, StudentName, Address, Phone, Status, ClassID, AVG(MARK.MARK) as TB
FROM Student JOIN MARK ON Student.StudentID = MARK.StudentID
GROUP BY Student.StudentID
ORDER BY TB