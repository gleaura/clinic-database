-- ---------------------------------------------------------------
-- PATIENT / APPOINTMENT / TREATMENT PERMISSIONS
-- ---------------------------------------------------------------
INSERT INTO clinic.PERMISSION (ID, NAME, DESCRIPTION, MODULE, ACTION, STATUS, CREATED_BY, CREATED_DATE, CREATED_IP)
VALUES
    -- PATIENT
    (nextval('clinic.SEQ_PERMISSION'), 'PATIENT_READ',          'Hasta görüntüleme yetkisi',       'PATIENT',     'READ',   'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'PATIENT_CREATE',        'Hasta oluşturma yetkisi',         'PATIENT',     'CREATE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'PATIENT_UPDATE',        'Hasta güncelleme yetkisi',        'PATIENT',     'UPDATE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'PATIENT_DELETE',        'Hasta silme yetkisi',             'PATIENT',     'DELETE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    -- APPOINTMENT
    (nextval('clinic.SEQ_PERMISSION'), 'APPOINTMENT_READ',      'Randevu görüntüleme yetkisi',     'APPOINTMENT', 'READ',   'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'APPOINTMENT_CREATE',    'Randevu oluşturma yetkisi',       'APPOINTMENT', 'CREATE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'APPOINTMENT_UPDATE',    'Randevu güncelleme yetkisi',      'APPOINTMENT', 'UPDATE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'APPOINTMENT_DELETE',    'Randevu silme yetkisi',           'APPOINTMENT', 'DELETE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    -- TREATMENT
    (nextval('clinic.SEQ_PERMISSION'), 'TREATMENT_READ',        'Tedavi görüntüleme yetkisi',      'TREATMENT',   'READ',   'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'TREATMENT_CREATE',      'Tedavi oluşturma yetkisi',        'TREATMENT',   'CREATE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'TREATMENT_UPDATE',      'Tedavi güncelleme yetkisi',       'TREATMENT',   'UPDATE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'TREATMENT_DELETE',      'Tedavi silme yetkisi',            'TREATMENT',   'DELETE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1');

-- ---------------------------------------------------------------
-- ROLE_PERMISSION: Yeni yetkileri rollere ata
-- ---------------------------------------------------------------

-- ADMIN: Tüm yeni yetkiler
INSERT INTO clinic.ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, CREATED_BY, CREATED_DATE, CREATED_IP)
SELECT
    nextval('clinic.SEQ_ROLE_PERMISSION'),
    (SELECT ID FROM clinic.ROLE WHERE NAME = 'ADMIN'),
    p.ID,
    'SYSTEM',
    NOW(),
    '127.0.0.1'
FROM clinic.PERMISSION p
WHERE p.MODULE IN ('PATIENT', 'APPOINTMENT', 'TREATMENT');

-- VIEWER: Sadece READ yetkiler
INSERT INTO clinic.ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, CREATED_BY, CREATED_DATE, CREATED_IP)
SELECT
    nextval('clinic.SEQ_ROLE_PERMISSION'),
    (SELECT ID FROM clinic.ROLE WHERE NAME = 'VIEWER'),
    p.ID,
    'SYSTEM',
    NOW(),
    '127.0.0.1'
FROM clinic.PERMISSION p
WHERE p.MODULE IN ('PATIENT', 'APPOINTMENT', 'TREATMENT')
  AND p.ACTION = 'READ';
