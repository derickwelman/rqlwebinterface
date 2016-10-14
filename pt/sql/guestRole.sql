--CREATE ROLE guest WITH LOGIN;
ALTER ROLE guest WITH PASSWORD 'guest';
SELECT datname FROM pg_database WHERE datistemplate = false;
REVOKE ALL ON DATABASE  "Bees" FROM guest;
GRANT SELECT ON TABLE Hive, Comb, Job, Bee, Hierarchy, Flower, Pollen, Colmeia, Favo, Trabalho, Abelha, Hierarquia, Flor, Polen TO guest;