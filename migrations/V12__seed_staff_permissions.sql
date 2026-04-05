-- ---------------------------------------------------------------
-- STAFF PERMISSIONS
-- ---------------------------------------------------------------
INSERT INTO clinic.PERMISSION (ID, NAME, DESCRIPTION, MODULE, ACTION, STATUS, CREATED_BY, CREATED_DATE, CREATED_IP)
VALUES
    (nextval('clinic.SEQ_PERMISSION'), 'STAFF_READ',          'Personel görüntüleme yetkisi',       'STAFF', 'READ',   'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'STAFF_CREATE',        'Personel oluşturma yetkisi',         'STAFF', 'CREATE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'STAFF_UPDATE',        'Personel güncelleme yetkisi',        'STAFF', 'UPDATE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1'),
    (nextval('clinic.SEQ_PERMISSION'), 'STAFF_DELETE',        'Personel silme yetkisi',             'STAFF', 'DELETE', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1');

-- ---------------------------------------------------------------
-- ROLE_PERMISSION: Yeni yetkileri rollere ata
-- ---------------------------------------------------------------

-- ADMIN: Tüm STAFF yetkiler
INSERT INTO clinic.ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, CREATED_BY, CREATED_DATE, CREATED_IP)
SELECT
    nextval('clinic.SEQ_ROLE_PERMISSION'),
    (SELECT ID FROM clinic.ROLE WHERE NAME = 'ADMIN'),
    p.ID,
    'SYSTEM',
    NOW(),
    '127.0.0.1'
FROM clinic.PERMISSION p
WHERE p.MODULE = 'STAFF';

-- VIEWER: Sadece STAFF READ
INSERT INTO clinic.ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, CREATED_BY, CREATED_DATE, CREATED_IP)
SELECT
    nextval('clinic.SEQ_ROLE_PERMISSION'),
    (SELECT ID FROM clinic.ROLE WHERE NAME = 'VIEWER'),
    p.ID,
    'SYSTEM',
    NOW(),
    '127.0.0.1'
FROM clinic.PERMISSION p
WHERE p.MODULE = 'STAFF'
  AND p.ACTION = 'READ';
