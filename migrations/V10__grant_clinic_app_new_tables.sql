-- clinic_app kullanicisina V8'de eklenen yeni tablolar icin erisim izni ver
GRANT ALL PRIVILEGES ON TABLE clinic.patient          TO clinic_app;
GRANT ALL PRIVILEGES ON TABLE clinic.patient_his      TO clinic_app;
GRANT ALL PRIVILEGES ON TABLE clinic.appointment      TO clinic_app;
GRANT ALL PRIVILEGES ON TABLE clinic.appointment_his  TO clinic_app;
GRANT ALL PRIVILEGES ON TABLE clinic.treatment        TO clinic_app;
GRANT ALL PRIVILEGES ON TABLE clinic.treatment_his    TO clinic_app;

GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_PATIENT         TO clinic_app;
GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_PATIENT_HIS     TO clinic_app;
GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_APPOINTMENT     TO clinic_app;
GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_APPOINTMENT_HIS TO clinic_app;
GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_TREATMENT       TO clinic_app;
GRANT ALL PRIVILEGES ON SEQUENCE clinic.SEQ_TREATMENT_HIS   TO clinic_app;

-- Bundan sonra schema'da olusturulacak tum objeler icin otomatik yetki
ALTER DEFAULT PRIVILEGES IN SCHEMA clinic GRANT ALL ON TABLES    TO clinic_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA clinic GRANT ALL ON SEQUENCES TO clinic_app;
