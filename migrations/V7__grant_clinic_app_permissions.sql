DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'clinic_app') THEN
        CREATE ROLE clinic_app WITH LOGIN PASSWORD 'clinic_app';
    END IF;
END
$$;

GRANT USAGE ON SCHEMA clinic TO clinic_app;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA clinic TO clinic_app;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA clinic TO clinic_app;
