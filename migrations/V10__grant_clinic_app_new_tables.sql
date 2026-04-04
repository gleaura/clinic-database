-- clinic_app kullanicisina V8'de eklenen yeni tablolar icin erisim izni ver
GRANT ALL PRIVILEGES ON TABLE clinic.patient     TO clinic_app;
GRANT ALL PRIVILEGES ON TABLE clinic.appointment TO clinic_app;
GRANT ALL PRIVILEGES ON TABLE clinic.treatment   TO clinic_app;

GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_PATIENT     TO clinic_app;
GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_APPOINTMENT TO clinic_app;
GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_TREATMENT   TO clinic_app;
