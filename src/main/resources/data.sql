-- Clear existing data
TRUNCATE TABLE users RESTART IDENTITY CASCADE;

-- Insert sample users
INSERT INTO users (name, email) VALUES
    ('John Doe', 'john.doe@example.com'),
    ('Jane Smith', 'jane.smith@example.com'),
    ('Michael Johnson', 'michael.j@example.com'),
    ('Emily Brown', 'emily.brown@example.com'),
    ('David Wilson', 'david.wilson@example.com'),
    ('Sarah Davis', 'sarah.davis@example.com'),
    ('James Miller', 'james.miller@example.com'),
    ('Lisa Anderson', 'lisa.anderson@example.com'),
    ('Robert Taylor', 'robert.taylor@example.com'),
    ('Jennifer White', 'jennifer.white@example.com'); 