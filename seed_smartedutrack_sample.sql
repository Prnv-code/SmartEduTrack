INSERT INTO "user" (email, password, name, role)
SELECT 'anita.sharma@smartedutrack.local', 'pbkdf2:sha256:1000000$eJFOX243F0te4SPh$a98e6740d524f8fe1ff44c3e923d03fe0f1fad6f8979c815cb534013162c13a2', 'Anita Sharma', 'teacher'
WHERE NOT EXISTS (SELECT 1 FROM "user" WHERE email = 'anita.sharma@smartedutrack.local');

INSERT INTO "user" (email, password, name, role)
SELECT 'rohit.verma@smartedutrack.local', 'pbkdf2:sha256:1000000$eJFOX243F0te4SPh$a98e6740d524f8fe1ff44c3e923d03fe0f1fad6f8979c815cb534013162c13a2', 'Rohit Verma', 'teacher'
WHERE NOT EXISTS (SELECT 1 FROM "user" WHERE email = 'rohit.verma@smartedutrack.local');

INSERT INTO "user" (email, password, name, role)
SELECT 'aarav.patel@smartedutrack.local', 'pbkdf2:sha256:1000000$wja8U00TQGCFxSOU$5a6b932b8c8cfbec6edc9f2c7504db925ed786fd7387d2ae62f516630d64c918', 'Aarav Patel', 'student'
WHERE NOT EXISTS (SELECT 1 FROM "user" WHERE email = 'aarav.patel@smartedutrack.local');

INSERT INTO "user" (email, password, name, role)
SELECT 'diya.reddy@smartedutrack.local', 'pbkdf2:sha256:1000000$wja8U00TQGCFxSOU$5a6b932b8c8cfbec6edc9f2c7504db925ed786fd7387d2ae62f516630d64c918', 'Diya Reddy', 'student'
WHERE NOT EXISTS (SELECT 1 FROM "user" WHERE email = 'diya.reddy@smartedutrack.local');

INSERT INTO "user" (email, password, name, role)
SELECT 'kabir.mehta@smartedutrack.local', 'pbkdf2:sha256:1000000$wja8U00TQGCFxSOU$5a6b932b8c8cfbec6edc9f2c7504db925ed786fd7387d2ae62f516630d64c918', 'Kabir Mehta', 'student'
WHERE NOT EXISTS (SELECT 1 FROM "user" WHERE email = 'kabir.mehta@smartedutrack.local');

INSERT INTO "user" (email, password, name, role)
SELECT 'sunita.patel@smartedutrack.local', 'pbkdf2:sha256:1000000$ZCdrQxJEXLI1Hku5$d30c62d9a9cd2200257438799877d9c48868f663b0553021968233f217ecc0de', 'Sunita Patel', 'parent'
WHERE NOT EXISTS (SELECT 1 FROM "user" WHERE email = 'sunita.patel@smartedutrack.local');

INSERT INTO "user" (email, password, name, role)
SELECT 'manoj.reddy@smartedutrack.local', 'pbkdf2:sha256:1000000$ZCdrQxJEXLI1Hku5$d30c62d9a9cd2200257438799877d9c48868f663b0553021968233f217ecc0de', 'Manoj Reddy', 'parent'
WHERE NOT EXISTS (SELECT 1 FROM "user" WHERE email = 'manoj.reddy@smartedutrack.local');

INSERT INTO "user" (email, password, name, role)
SELECT 'admin@smartedutrack.local', 'pbkdf2:sha256:1000000$8lmYGaT0Z6XzM1He$fb8460add97a3d8cd954399f2e13b94574f725f444b5d33ef187e644381ecfa5', 'SmartEdu Admin', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM "user" WHERE email = 'admin@smartedutrack.local');

INSERT INTO teacher (user_id, employee_code, department, phone, qualification)
SELECT u.id, 'TCH-101', 'Science', '+91-9876500001', 'M.Sc, B.Ed'
FROM "user" u
WHERE u.email = 'anita.sharma@smartedutrack.local'
ON CONFLICT (user_id) DO UPDATE SET
    employee_code = EXCLUDED.employee_code,
    department = EXCLUDED.department,
    phone = EXCLUDED.phone,
    qualification = EXCLUDED.qualification;

INSERT INTO teacher (user_id, employee_code, department, phone, qualification)
SELECT u.id, 'TCH-102', 'Humanities', '+91-9876500002', 'M.A, B.Ed'
FROM "user" u
WHERE u.email = 'rohit.verma@smartedutrack.local'
ON CONFLICT (user_id) DO UPDATE SET
    employee_code = EXCLUDED.employee_code,
    department = EXCLUDED.department,
    phone = EXCLUDED.phone,
    qualification = EXCLUDED.qualification;

INSERT INTO student (user_id, admission_number, grade, section, phone, address)
SELECT u.id, 'STD-2026-001', '10', 'A', '+91-9876501001', 'Hyderabad, Telangana'
FROM "user" u
WHERE u.email = 'aarav.patel@smartedutrack.local'
ON CONFLICT (user_id) DO UPDATE SET
    admission_number = EXCLUDED.admission_number,
    grade = EXCLUDED.grade,
    section = EXCLUDED.section,
    phone = EXCLUDED.phone,
    address = EXCLUDED.address;

INSERT INTO student (user_id, admission_number, grade, section, phone, address)
SELECT u.id, 'STD-2026-002', '10', 'A', '+91-9876501002', 'Hyderabad, Telangana'
FROM "user" u
WHERE u.email = 'diya.reddy@smartedutrack.local'
ON CONFLICT (user_id) DO UPDATE SET
    admission_number = EXCLUDED.admission_number,
    grade = EXCLUDED.grade,
    section = EXCLUDED.section,
    phone = EXCLUDED.phone,
    address = EXCLUDED.address;

INSERT INTO student (user_id, admission_number, grade, section, phone, address)
SELECT u.id, 'STD-2026-003', '9', 'B', '+91-9876501003', 'Secunderabad, Telangana'
FROM "user" u
WHERE u.email = 'kabir.mehta@smartedutrack.local'
ON CONFLICT (user_id) DO UPDATE SET
    admission_number = EXCLUDED.admission_number,
    grade = EXCLUDED.grade,
    section = EXCLUDED.section,
    phone = EXCLUDED.phone,
    address = EXCLUDED.address;

INSERT INTO parent (user_id, phone, occupation, address, relation_label)
SELECT u.id, '+91-9876502001', 'Software Engineer', 'Hyderabad, Telangana', 'Mother'
FROM "user" u
WHERE u.email = 'sunita.patel@smartedutrack.local'
ON CONFLICT (user_id) DO UPDATE SET
    phone = EXCLUDED.phone,
    occupation = EXCLUDED.occupation,
    address = EXCLUDED.address,
    relation_label = EXCLUDED.relation_label;

INSERT INTO parent (user_id, phone, occupation, address, relation_label)
SELECT u.id, '+91-9876502002', 'Business Owner', 'Hyderabad, Telangana', 'Father'
FROM "user" u
WHERE u.email = 'manoj.reddy@smartedutrack.local'
ON CONFLICT (user_id) DO UPDATE SET
    phone = EXCLUDED.phone,
    occupation = EXCLUDED.occupation,
    address = EXCLUDED.address,
    relation_label = EXCLUDED.relation_label;

INSERT INTO subject (name, teacher_id)
SELECT 'Mathematics', u.id
FROM "user" u
WHERE u.email = 'anita.sharma@smartedutrack.local'
AND NOT EXISTS (
    SELECT 1 FROM subject s WHERE s.name = 'Mathematics' AND s.teacher_id = u.id
);

INSERT INTO subject (name, teacher_id)
SELECT 'Physics', u.id
FROM "user" u
WHERE u.email = 'anita.sharma@smartedutrack.local'
AND NOT EXISTS (
    SELECT 1 FROM subject s WHERE s.name = 'Physics' AND s.teacher_id = u.id
);

INSERT INTO subject (name, teacher_id)
SELECT 'English', u.id
FROM "user" u
WHERE u.email = 'rohit.verma@smartedutrack.local'
AND NOT EXISTS (
    SELECT 1 FROM subject s WHERE s.name = 'English' AND s.teacher_id = u.id
);

INSERT INTO subject (name, teacher_id)
SELECT 'History', u.id
FROM "user" u
WHERE u.email = 'rohit.verma@smartedutrack.local'
AND NOT EXISTS (
    SELECT 1 FROM subject s WHERE s.name = 'History' AND s.teacher_id = u.id
);

INSERT INTO teacher_subject (teacher_id, subject_id)
SELECT t.id, s.id
FROM teacher t
JOIN "user" u ON u.id = t.user_id
JOIN subject s ON s.teacher_id = u.id
WHERE u.email = 'anita.sharma@smartedutrack.local'
ON CONFLICT (teacher_id, subject_id) DO NOTHING;

INSERT INTO teacher_subject (teacher_id, subject_id)
SELECT t.id, s.id
FROM teacher t
JOIN "user" u ON u.id = t.user_id
JOIN subject s ON s.teacher_id = u.id
WHERE u.email = 'rohit.verma@smartedutrack.local'
ON CONFLICT (teacher_id, subject_id) DO NOTHING;

INSERT INTO student_subject (student_id, subject_id)
SELECT st.id, sb.id
FROM student st
JOIN "user" u ON u.id = st.user_id
JOIN subject sb ON sb.name = 'Mathematics'
WHERE u.email = 'aarav.patel@smartedutrack.local'
ON CONFLICT (student_id, subject_id) DO NOTHING;

INSERT INTO student_subject (student_id, subject_id)
SELECT st.id, sb.id
FROM student st
JOIN "user" u ON u.id = st.user_id
JOIN subject sb ON sb.name = 'Physics'
WHERE u.email = 'aarav.patel@smartedutrack.local'
ON CONFLICT (student_id, subject_id) DO NOTHING;

INSERT INTO student_subject (student_id, subject_id)
SELECT st.id, sb.id
FROM student st
JOIN "user" u ON u.id = st.user_id
JOIN subject sb ON sb.name = 'English'
WHERE u.email = 'aarav.patel@smartedutrack.local'
ON CONFLICT (student_id, subject_id) DO NOTHING;

INSERT INTO student_subject (student_id, subject_id)
SELECT st.id, sb.id
FROM student st
JOIN "user" u ON u.id = st.user_id
JOIN subject sb ON sb.name = 'Mathematics'
WHERE u.email = 'diya.reddy@smartedutrack.local'
ON CONFLICT (student_id, subject_id) DO NOTHING;

INSERT INTO student_subject (student_id, subject_id)
SELECT st.id, sb.id
FROM student st
JOIN "user" u ON u.id = st.user_id
JOIN subject sb ON sb.name = 'History'
WHERE u.email = 'diya.reddy@smartedutrack.local'
ON CONFLICT (student_id, subject_id) DO NOTHING;

INSERT INTO student_subject (student_id, subject_id)
SELECT st.id, sb.id
FROM student st
JOIN "user" u ON u.id = st.user_id
JOIN subject sb ON sb.name = 'English'
WHERE u.email = 'kabir.mehta@smartedutrack.local'
ON CONFLICT (student_id, subject_id) DO NOTHING;

INSERT INTO student_subject (student_id, subject_id)
SELECT st.id, sb.id
FROM student st
JOIN "user" u ON u.id = st.user_id
JOIN subject sb ON sb.name = 'History'
WHERE u.email = 'kabir.mehta@smartedutrack.local'
ON CONFLICT (student_id, subject_id) DO NOTHING;

INSERT INTO parent_student (parent_id, student_id, relationship_type)
SELECT p.id, st.id, 'Mother'
FROM parent p
JOIN "user" pu ON pu.id = p.user_id
JOIN student st ON TRUE
JOIN "user" su ON su.id = st.user_id
WHERE pu.email = 'sunita.patel@smartedutrack.local'
  AND su.email = 'aarav.patel@smartedutrack.local'
ON CONFLICT (parent_id, student_id) DO UPDATE SET relationship_type = EXCLUDED.relationship_type;

INSERT INTO parent_student (parent_id, student_id, relationship_type)
SELECT p.id, st.id, 'Guardian'
FROM parent p
JOIN "user" pu ON pu.id = p.user_id
JOIN student st ON TRUE
JOIN "user" su ON su.id = st.user_id
WHERE pu.email = 'sunita.patel@smartedutrack.local'
  AND su.email = 'kabir.mehta@smartedutrack.local'
ON CONFLICT (parent_id, student_id) DO UPDATE SET relationship_type = EXCLUDED.relationship_type;

INSERT INTO parent_student (parent_id, student_id, relationship_type)
SELECT p.id, st.id, 'Father'
FROM parent p
JOIN "user" pu ON pu.id = p.user_id
JOIN student st ON TRUE
JOIN "user" su ON su.id = st.user_id
WHERE pu.email = 'manoj.reddy@smartedutrack.local'
  AND su.email = 'diya.reddy@smartedutrack.local'
ON CONFLICT (parent_id, student_id) DO UPDATE SET relationship_type = EXCLUDED.relationship_type;

INSERT INTO session (subject_id, date, start_time, end_time, qr_code, is_active, expires_at, teacher_id, secret_key, latitude, longitude, radius_meters)
SELECT s.id, DATE '2026-04-16', '09:00', '09:45', NULL, TRUE, TIMESTAMP '2026-04-16 09:15:00', u.id, 'ANITAMATHSESSIONKEY000000000001', 17.3850, 78.4867, 100
FROM subject s
JOIN "user" u ON u.id = s.teacher_id
WHERE s.name = 'Mathematics' AND u.email = 'anita.sharma@smartedutrack.local'
AND NOT EXISTS (
    SELECT 1 FROM session se WHERE se.subject_id = s.id AND se.date = DATE '2026-04-16' AND se.start_time = '09:00'
);

INSERT INTO session (subject_id, date, start_time, end_time, qr_code, is_active, expires_at, teacher_id, secret_key, latitude, longitude, radius_meters)
SELECT s.id, DATE '2026-04-16', '11:00', '11:45', NULL, TRUE, TIMESTAMP '2026-04-16 11:15:00', u.id, 'ANITAPHYSESSIONKEY0000000000002', 17.3851, 78.4868, 100
FROM subject s
JOIN "user" u ON u.id = s.teacher_id
WHERE s.name = 'Physics' AND u.email = 'anita.sharma@smartedutrack.local'
AND NOT EXISTS (
    SELECT 1 FROM session se WHERE se.subject_id = s.id AND se.date = DATE '2026-04-16' AND se.start_time = '11:00'
);

INSERT INTO session (subject_id, date, start_time, end_time, qr_code, is_active, expires_at, teacher_id, secret_key, latitude, longitude, radius_meters)
SELECT s.id, DATE '2026-04-17', '10:00', '10:45', NULL, TRUE, TIMESTAMP '2026-04-17 10:15:00', u.id, 'ROHITENGSESSIONKEY0000000000003', 17.3852, 78.4869, 120
FROM subject s
JOIN "user" u ON u.id = s.teacher_id
WHERE s.name = 'English' AND u.email = 'rohit.verma@smartedutrack.local'
AND NOT EXISTS (
    SELECT 1 FROM session se WHERE se.subject_id = s.id AND se.date = DATE '2026-04-17' AND se.start_time = '10:00'
);

INSERT INTO session (subject_id, date, start_time, end_time, qr_code, is_active, expires_at, teacher_id, secret_key, latitude, longitude, radius_meters)
SELECT s.id, DATE '2026-04-17', '12:00', '12:45', NULL, FALSE, TIMESTAMP '2026-04-17 12:15:00', u.id, 'ROHITHISSESSIONKEY0000000000004', 17.3853, 78.4870, 120
FROM subject s
JOIN "user" u ON u.id = s.teacher_id
WHERE s.name = 'History' AND u.email = 'rohit.verma@smartedutrack.local'
AND NOT EXISTS (
    SELECT 1 FROM session se WHERE se.subject_id = s.id AND se.date = DATE '2026-04-17' AND se.start_time = '12:00'
);

INSERT INTO attendance (user_id, session_id, scan_time, status, latitude, longitude, distance_meters, verified_by_geofence)
SELECT u.id, se.id, TIMESTAMP '2026-04-16 09:02:00', 'present', 17.3850, 78.4867, 12.5, TRUE
FROM "user" u
JOIN session se ON se.date = DATE '2026-04-16' AND se.start_time = '09:00'
JOIN subject s ON s.id = se.subject_id
WHERE u.email = 'aarav.patel@smartedutrack.local' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM attendance a WHERE a.user_id = u.id AND a.session_id = se.id);

INSERT INTO attendance (user_id, session_id, scan_time, status, latitude, longitude, distance_meters, verified_by_geofence)
SELECT u.id, se.id, TIMESTAMP '2026-04-16 09:03:00', 'present', 17.3850, 78.4868, 15.2, TRUE
FROM "user" u
JOIN session se ON se.date = DATE '2026-04-16' AND se.start_time = '09:00'
JOIN subject s ON s.id = se.subject_id
WHERE u.email = 'diya.reddy@smartedutrack.local' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM attendance a WHERE a.user_id = u.id AND a.session_id = se.id);

INSERT INTO attendance (user_id, session_id, scan_time, status, latitude, longitude, distance_meters, verified_by_geofence)
SELECT u.id, se.id, TIMESTAMP '2026-04-16 11:02:00', 'present', 17.3851, 78.4868, 8.9, TRUE
FROM "user" u
JOIN session se ON se.date = DATE '2026-04-16' AND se.start_time = '11:00'
JOIN subject s ON s.id = se.subject_id
WHERE u.email = 'aarav.patel@smartedutrack.local' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM attendance a WHERE a.user_id = u.id AND a.session_id = se.id);

INSERT INTO attendance (user_id, session_id, scan_time, status, latitude, longitude, distance_meters, verified_by_geofence)
SELECT u.id, se.id, TIMESTAMP '2026-04-17 10:04:00', 'present', 17.3852, 78.4869, 11.0, TRUE
FROM "user" u
JOIN session se ON se.date = DATE '2026-04-17' AND se.start_time = '10:00'
JOIN subject s ON s.id = se.subject_id
WHERE u.email = 'aarav.patel@smartedutrack.local' AND s.name = 'English'
AND NOT EXISTS (SELECT 1 FROM attendance a WHERE a.user_id = u.id AND a.session_id = se.id);

INSERT INTO attendance (user_id, session_id, scan_time, status, latitude, longitude, distance_meters, verified_by_geofence)
SELECT u.id, se.id, TIMESTAMP '2026-04-17 12:03:00', 'present', 17.3853, 78.4870, 10.3, TRUE
FROM "user" u
JOIN session se ON se.date = DATE '2026-04-17' AND se.start_time = '12:00'
JOIN subject s ON s.id = se.subject_id
WHERE u.email = 'kabir.mehta@smartedutrack.local' AND s.name = 'History'
AND NOT EXISTS (SELECT 1 FROM attendance a WHERE a.user_id = u.id AND a.session_id = se.id);
