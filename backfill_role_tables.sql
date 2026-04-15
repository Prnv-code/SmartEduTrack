INSERT INTO teacher (user_id)
SELECT u.id
FROM "user" u
WHERE u.role = 'teacher'
ON CONFLICT (user_id) DO NOTHING;

INSERT INTO student (user_id)
SELECT u.id
FROM "user" u
WHERE u.role = 'student'
ON CONFLICT (user_id) DO NOTHING;

INSERT INTO parent (user_id)
SELECT u.id
FROM "user" u
WHERE u.role = 'parent'
ON CONFLICT (user_id) DO NOTHING;

INSERT INTO teacher_subject (teacher_id, subject_id)
SELECT t.id, s.id
FROM subject s
JOIN teacher t ON t.user_id = s.teacher_id
ON CONFLICT (teacher_id, subject_id) DO NOTHING;
