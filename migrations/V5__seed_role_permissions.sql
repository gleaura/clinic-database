-- ---------------------------------------------------------------
-- ROLE_PERMISSION SEED DATA
-- ---------------------------------------------------------------

-- ADMIN: Tüm yetkiler
INSERT INTO clinic.ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, CREATED_BY, CREATED_DATE, CREATED_IP)
SELECT
    nextval('clinic.SEQ_ROLE_PERMISSION'),
    (SELECT ID FROM clinic.ROLE WHERE NAME = 'ADMIN'),
    p.ID,
    'SYSTEM',
    NOW(),
    '127.0.0.1'
FROM clinic.PERMISSION p;

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
WHERE p.ACTION = 'READ';
