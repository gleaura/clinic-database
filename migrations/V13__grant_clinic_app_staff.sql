-- clinic_app kullanicisina STAFF tablolari icin erisim izni ver
GRANT ALL PRIVILEGES ON TABLE clinic.staff          TO clinic_app;
GRANT ALL PRIVILEGES ON TABLE clinic.staff_his      TO clinic_app;

GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_STAFF       TO clinic_app;
GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_STAFF_HIS   TO clinic_app;
