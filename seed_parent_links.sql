SELECT pu.name AS parent_name, su.name AS student_name, ps.relationship_type
FROM parent_student ps
JOIN parent p ON p.id = ps.parent_id
JOIN student s ON s.id = ps.student_id
JOIN "user" pu ON pu.id = p.user_id
JOIN "user" su ON su.id = s.user_id
ORDER BY pu.name, su.name;
