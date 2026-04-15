CREATE TABLE IF NOT EXISTS teacher (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE REFERENCES "user"(id) ON DELETE CASCADE,
    employee_code VARCHAR(50) UNIQUE,
    department VARCHAR(100),
    phone VARCHAR(20),
    qualification VARCHAR(120),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS student (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE REFERENCES "user"(id) ON DELETE CASCADE,
    admission_number VARCHAR(50) UNIQUE,
    grade VARCHAR(50),
    section VARCHAR(50),
    phone VARCHAR(20),
    address VARCHAR(255),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS parent (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE REFERENCES "user"(id) ON DELETE CASCADE,
    phone VARCHAR(20),
    occupation VARCHAR(120),
    address VARCHAR(255),
    relation_label VARCHAR(50),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS teacher_subject (
    id SERIAL PRIMARY KEY,
    teacher_id INTEGER NOT NULL REFERENCES teacher(id) ON DELETE CASCADE,
    subject_id INTEGER NOT NULL REFERENCES subject(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_teacher_subject UNIQUE (teacher_id, subject_id)
);

CREATE TABLE IF NOT EXISTS student_subject (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES student(id) ON DELETE CASCADE,
    subject_id INTEGER NOT NULL REFERENCES subject(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_student_subject UNIQUE (student_id, subject_id)
);

CREATE TABLE IF NOT EXISTS parent_student (
    id SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL REFERENCES parent(id) ON DELETE CASCADE,
    student_id INTEGER NOT NULL REFERENCES student(id) ON DELETE CASCADE,
    relationship_type VARCHAR(50) DEFAULT 'Guardian',
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_parent_student UNIQUE (parent_id, student_id)
);

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
