SELECT 'user' AS table_name, COUNT(*) AS total FROM "user"
UNION ALL SELECT 'teacher', COUNT(*) FROM teacher
UNION ALL SELECT 'student', COUNT(*) FROM student
UNION ALL SELECT 'parent', COUNT(*) FROM parent
UNION ALL SELECT 'teacher_subject', COUNT(*) FROM teacher_subject
UNION ALL SELECT 'student_subject', COUNT(*) FROM student_subject
UNION ALL SELECT 'parent_student', COUNT(*) FROM parent_student
ORDER BY 1;
