-- ---------------------------------------------------------------
-- USERS_ROLE SEED DATA
-- ---------------------------------------------------------------

-- admin kullanicisina ADMIN rolu
INSERT INTO clinic.USERS_ROLE (ID, USERS_ID, ROLE_ID, ASSIGNED_BY, ASSIGNED_DATE, CREATED_BY, CREATED_DATE, CREATED_IP)
SELECT
    nextval('clinic.SEQ_USERS_ROLE'),
    (SELECT ID FROM clinic.USERS WHERE USERNAME = 'admin'),
    (SELECT ID FROM clinic.ROLE WHERE NAME = 'ADMIN'),
    'SYSTEM',
    NOW(),
    'SYSTEM',
    NOW(),
    '127.0.0.1';
