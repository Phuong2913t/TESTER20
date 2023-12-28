use assignment_day1;
-- Question 2: lấy ra tất cả các phòng ban
SELECT * FROM Department;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT DepartmentID 
FROM Department
WHERE DepartmentName = 'Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất và sắp xếp chúng theo thứ tự giảm dần
SELECT * 
FROM Accountt 
WHERE length(FullName) = 
	(SELECT MAX(length(FullName)) from Accountt )
ORDER BY FullName DESC;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT * 
FROM Accountt 
WHERE DepartmentID = 3 AND length(FullName) = 
	(SELECT MAX(length(FullName)) from Accountt );
    
-- Question 6: lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT GroupName 
FROM Groupp 
WHERE CreateDate < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID 
FROM Answer 
GROUP BY QuestionID
HAVING COUNT(AnswerID) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT ExamID 
FROM Exam
WHERE Duaration >= 60 AND CreateDate < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT * 
FROM Groupp
ORDER BY CreateDate DESC
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECt COUNT(AccountID)
FROM Accountt
WHERE DepartmentID = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT *
FROM Accountt
WHERE UserName LIKE 'D%o';

-- Question 12: xóa tất cả các exam được tạo trước ngày 20/12/2019
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Exam
WHERE CreateDate < '2019-12-20';

-- Question 13: xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Question
WHERE Content LIKE 'Cau hoi %';

/*Question 14: update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
email thành loc.nguyenba@vti.com.vn*/
UPDATE Accountt
SET FullName = 'Nguyễn Bá Lộc',
	Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE GroupAccount
SET GroupID = 4
WHERE AccountID = 5;