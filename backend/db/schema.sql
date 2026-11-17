CREATE DATABASE IF NOT EXISTS musica;
USE musica;

CREATE TABLE brani (
  id     INT AUTO_INCREMENT PRIMARY KEY,
  nome   VARCHAR(100) NOT NULL,
  secondi DECIMAL(8,2) NOT NULL
);
INSERT INTO brani (nome, secondi) VALUES
 ('Notte blu', 210.00), ('Vento', 180.00),
 ('Città', 240.00), ('Onde', 270.00);

CREATE TABLE playlist (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  utente   VARCHAR(100) NOT NULL,
  totale    DECIMAL(10,2) NOT NULL,
  creato_il TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- una playlist con 3 brani = 3 righe qui
CREATE TABLE righe_playlist (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  playlist_id   INT NOT NULL,
  brano_id INT NOT NULL,
  FOREIGN KEY (playlist_id)   REFERENCES playlist(id),
  FOREIGN KEY (brano_id) REFERENCES brani(id)
);