-- ---------------------------------------------------------------
-- USERS SEED DATA
-- ---------------------------------------------------------------
INSERT INTO clinic.USERS (ID, USERNAME, EMAIL, PASSWORD_HASH, FIRST_NAME, LAST_NAME, PHONE, STATUS, CREATED_BY, CREATED_DATE, CREATED_IP)
VALUES
    (nextval('clinic.SEQ_USERS'), 'admin', 'admin@clinic.com', '$2b$10$FOLJ0NEccXwiE/IE98Gs6ug6a7aS.CVyMuiIkOHfngBTlDc8UTSIG', 'Admin', 'User', '+905551112233', 'ACTIVE', 'SYSTEM', NOW(), '127.0.0.1');
