use p11;

-- Membuat tabel Departemen
CREATE TABLE Departemen (
    KodeDept VARCHAR(10) PRIMARY KEY,
    NamaDept VARCHAR(50)
);

CREATE TABLE Pegawai (
    KodePegawai VARCHAR(10) PRIMARY KEY,
    NamaPegawai VARCHAR(50),
    KodeDept VARCHAR(10),
    KodePemimpin VARCHAR(10),
    FOREIGN KEY (KodeDept) REFERENCES Departemen(KodeDept),
    FOREIGN KEY (KodePemimpin) REFERENCES Pegawai(KodePegawai)
);


-- Masukkan data ke tabel Departemen
INSERT INTO Departemen (KodeDept, NamaDept) VALUES
('D001', 'HR'),
('D002', 'Finance');
INSERT INTO Pegawai (KodePegawai, NamaPegawai, KodeDept, KodePemimpin) VALUES
('P001', 'Ali', 'D001', NULL),    -- Ali adalah pemimpin tertinggi
('P002', 'Budi', 'D001', 'P001'), -- Budi dipimpin Ali
('P003', 'Citra', 'D002', 'P001'), -- Citra juga dipimpin Ali
('P004', 'Dewi', 'D002', 'P002'); -- Dewi dipimpin oleh Budi
  
  SELECT 
    p1.KodePegawai,
    p1.NamaPegawai,
    p1.KodeDept,
    d1.NamaDept,
    p1.KodePemimpin,
    p2.NamaPegawai AS NamaPemimpin
FROM Pegawai p1
LEFT JOIN Pegawai p2 ON p1.KodePemimpin = p2.KodePegawai
LEFT JOIN Departemen d1 ON p1.KodeDept = d1.KodeDept
ORDER BY p1.KodePegawai;

