INSERT INTO Usuario (nombre, email, passwordHash, estadoUsuario_id, rolUsuario_id) VALUES
('Juan Perez','juan@academia.com','hash1',1,1),
('Maria Lopez','maria@academia.com','hash2',2,1),
('Carlos Ruiz','carlos@academia.com','hash3',1,1),
('Ana Torres','ana@academia.com','hash4',1,1),
('Luis Gomez','luis@academia.com','hash5',2,1),
('Laura Diaz','laura@academia.com','hash6',1,1),
('Pedro Sanchez','pedro@academia.com','hash7',3,1),
('Sofia Rojas','sofia@academia.com','hash8',1,1),
('Admin Cristopher','admin1@academia.com','hash9',1,2),
('Admin Sebastian','admin2@academia.com','hash10',1,2),
('Admin Andres','admin3@academia.com','hash11',1,2);

INSERT INTO Recurso (titulo, descripcion, url, tipoRecurso_id, comentario, estadoRecurso_id, creadoPor_usuario_id, aprobadoPor_usuario_id, revisadoPor_usuario_id) VALUES
('Present Simple Explanation', 'Video explaining A1 present simple.', 'https://efl.com/vid-p-simple', 1, 'Great for beginners', 2, 1, 9, 10),
('IELTS Speaking Mock Test', 'Audio recording of a band 8 student.', 'https://efl.com/audio-ielts', 2, 'Good for pronunciation prep', 1, 3, NULL, NULL),
('Phrasal Verbs List', 'PDF containing the top 100 phrasal verbs.', 'https://efl.com/doc-phrasals', 3, 'Needs more context examples', 2, 4, 10, 11),
('Business Email Templates', 'Link to formal email structures.', 'https://efl.com/link-email', 4, 'Excellent professional resource', 2, 2, 11, 9),
('Vowel IPA Chart', 'Image showing English vowel placements.', 'https://efl.com/img-vowels', 5, 'High resolution needed', 3, 5, 9, 11),
('Interactive Grammar Quiz', 'Gamified quiz for relative clauses.', 'https://efl.com/link-quiz', 4, NULL, 2, 6, 11, 10),
('Irregular Verbs Song', 'Audio track to memorize past tense verbs.', 'https://efl.com/audio-verbs', 2, 'Very fun for younger students', 2, 7, 10, 9),
('TOEFL Listening Module', 'Full 45-minute listening simulation video.', 'https://efl.com/vid-toefl', 1, 'Pacing is a bit fast', 1, 8, NULL, 9),
('Conditionals Worksheet', 'Printable PDF for conditionals practice.', 'https://efl.com/doc-cond', 3, 'Clear and concise', 2, 1, 9, 10),
('Daily Routines Flashcards', 'Images of morning/evening routines.', 'https://efl.com/img-routines', 5, 'Great visual aid', 2, 3, 10, 11),
('Passive Voice Escape Room', 'Link to digital escape room.', 'https://efl.com/link-passive', 4, 'Very engaging activity', 2, 4, 11, 9),
('English Idioms Podcast', 'MP3 podcast on common idioms.', 'https://efl.com/audio-idioms', 2, 'Updated regularly', 2, 2, 9, 10),
('Reported Speech Converter', 'External site tool for transformations.', 'https://efl.com/link-reported', 4, 'A bit buggy on mobile devices', 3, 5, 10, 11),
('British vs American Vocab', 'Document comparing regional spelling.', 'https://efl.com/doc-vocab', 3, 'Monitor for appropriate usage', 1, 6, NULL, NULL),
('Word Formation Diagram', 'Infographic on nouns and adjectives.', 'https://efl.com/img-suffixes', 5, NULL, 2, 7, 11, 9),
('TED Talk Lesson Plan', 'Video and guide for a B2 lesson.', 'https://efl.com/vid-ted', 1, 'Requires advanced vocabulary', 2, 8, 9, 11),
('Minimal Pairs Drill', 'Audio file with ship vs sheep drills.', 'https://efl.com/audio-pairs', 2, 'Essential for Spanish speakers', 2, 1, 10, 9),
('FCE Use of English Test', 'PDF practice test for Cambridge FCE.', 'https://efl.com/doc-fce', 3, 'Challenging but accurate to exam', 2, 2, 11, 10),
('Present Perfect Timeline', 'Image showing timeline of tenses.', 'https://efl.com/img-perfect', 5, 'Great visual representation', 2, 3, 9, 11),
('Travel Roleplay Scenarios', 'Misc collection of speaking cards.', 'https://efl.com/misc-travel', 6, 'Useful for adult learners', 2, 4, 10, 9);

INSERT INTO CursoClase (nombre, descripcion, orden) VALUES
('Intro A0', 'Basic greetings and introductions.', 1),
('Basic A1', 'Present simple, common verbs, and daily routines.', 2),
('Intermediate A2', 'Past simple, irregular verbs, and travel vocabulary.', 3),
('Upper-Intermediate B1', 'Future tenses, phrasal verbs, and work-related topics.', 4),
('Advanced B2', 'Conditionals, idioms, and academic writing.', 5);

INSERT INTO CursoClaseRecurso (cursoClase_id, recurso_id) VALUES
(1, 8), (1, 10), (1, 16),
(2, 1), (2, 3), (2, 9), (2, 14), (2, 17),
(3, 2), (3, 4), (3, 7), (3, 12), (3, 15),
(4, 5), (4, 6), (4, 11), (4, 13), (4, 18),
(5, 19);

INSERT INTO SolicitudRecurso (tipoSolicitud_id, estadoSolicitud_id, payloadJson, solicitadoPor_usuario_id, recursoObjetivo_id) VALUES
(1, 1, '{"titulo": "New Resource", "descripcion": "Description of the new resource", "url": "https://efl.com/new-resource", "tipoRecurso_id": 1}', 2, 20),
(2, 1, '{"recurso_id": 3, "titulo": "Updated Phrasal Verbs List", "descripcion": "Updated description with more examples", "url": "https://efl.com/doc-phrasals-updated", "tipoRecurso_id": 3}', 3, 3);