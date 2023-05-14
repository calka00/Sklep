CREATE TABLE Uzytkownicy (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nazwa VARCHAR(50) NOT NULL,
    Haslo VARCHAR(50) NOT NULL,
    Imie VARCHAR(50) NOT NULL,
    Nazwisko VARCHAR(50) NOT NULL
)

CREATE TABLE Kategorie (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nazwa VARCHAR(50) NOT NULL
)

CREATE TABLE Podzespoly (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nazwa VARCHAR(50) NOT NULL,
    Cena DECIMAL(10,2) NOT NULL,
    Opis VARCHAR(MAX),
    KategoriaId INT NOT NULL,
    CONSTRAINT FK_Podzespoly_Kategorie FOREIGN KEY (KategoriaId) REFERENCES Kategorie(Id)
)

CREATE TABLE Koszyk (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    UzytkownikId INT NOT NULL,
    PodzespolId INT NOT NULL,
    Ilosc INT NOT NULL,
    CONSTRAINT FK_Koszyk_Uzytkownicy FOREIGN KEY (UzytkownikId) REFERENCES Uzytkownicy(Id),
    CONSTRAINT FK_Koszyk_Podzespoly FOREIGN KEY (PodzespolId) REFERENCES Podzespoly(Id)
)

CREATE TABLE Koszyk_Podzespol (
    KoszykId INT NOT NULL,
    PodzespolId INT NOT NULL,
    Sztuki INT NOT NULL,
    CONSTRAINT PK_Koszyk_Podzespol PRIMARY KEY (KoszykId, PodzespolId),
    CONSTRAINT FK_Koszyk_Podzespol_Koszyk FOREIGN KEY (KoszykId) REFERENCES Koszyk(Id),
    CONSTRAINT FK_Koszyk_Podzespol_Podzespoly FOREIGN KEY (PodzespolId) REFERENCES Podzespoly(Id)
)

CREATE INDEX IX_Koszyk_UzytkownikId ON Koszyk (UzytkownikId)

CREATE INDEX IX_Koszyk_PodzespolId ON Koszyk (PodzespolId)

CREATE INDEX IX_Koszyk_Podzespol_PodzespolId ON Koszyk_Podzespol (PodzespolId)
