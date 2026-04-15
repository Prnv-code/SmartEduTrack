SELECT u.name AS student_name, s.admission_number, sub.name AS subject_name, tu.name AS teacher_name
FROM student_subject ss
JOIN student s ON s.id = ss.student_id
JOIN "user" u ON u.id = s.user_id
JOIN subject sub ON sub.id = ss.subject_id
JOIN "user" tu ON tu.id = sub.teacher_id
ORDER BY u.name, sub.name;
