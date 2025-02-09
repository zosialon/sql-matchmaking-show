  -- SQL Matchmaking Show: "Filemon's Love Quest"

-- 1. Tabela Kota Filemona (bachelor)
CREATE TABLE bachelor (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    zodiac_sign TEXT,
    description TEXT -- Opis, czego szuka u partnerki
);

-- 2. Tabela Uczestniczek (contestants)
CREATE TABLE contestants (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    zodiac_sign TEXT
);

-- 3. Tabela Zainteresowań (interests)
CREATE TABLE interests (
    contestant_id INTEGER PRIMARY KEY,
    music BOOLEAN,
    travel BOOLEAN,
    sports BOOLEAN,
    books BOOLEAN,
    movies BOOLEAN,
    cooking BOOLEAN,
    FOREIGN KEY (contestant_id) REFERENCES contestants(id)
);

-- 4. Tabela Dopasowań Zodiakalnych (zodiac_matches)
CREATE TABLE zodiac_matches (
    sign1 TEXT,
    sign2 TEXT,
    compatibility_score INTEGER -- 0-100, im więcej, tym lepiej!
);

-- 5. Tabela Wyglądu (appearance)
CREATE TABLE appearance (
    contestant_id INTEGER PRIMARY KEY,
    fur_color TEXT,
    eye_color TEXT,
    whisker_length TEXT, -- Długość wąsów zamiast pazurków
    FOREIGN KEY (contestant_id) REFERENCES contestants(id)
);

-- 6. Tabela "Randek" (dates)
CREATE TABLE dates (
    id INTEGER PRIMARY KEY,
    contestant_id INTEGER,
    success_score INTEGER, -- Jak dobrze poszło? (0-100)
    FOREIGN KEY (contestant_id) REFERENCES contestants(id)
);

-- Dodajemy głównego uczestnika (Kot Filemon)
INSERT INTO bachelor (name, age, zodiac_sign, description) VALUES
('Filemon', 4, 'Leo', 'Szukam kotki o pieknych niebieskich oczach. Od zawsze mam ogromną słabość 
do brunetek o długich 
  wąsach ale wiadomo wygląd nie jest najważniejszy.Bardzo wierzę w horoskopy, więc 
kompatybilność zodiakalna jest kluczowa! 
  Jestem domatorem i kocham muzykę i filmy. Chciałbym zeby moja partnerka nie byla starsza ode 
mnie.');

-- Dodajemy uczestniczki (znane kotki z bajek + dodatkowe uczestniczki)
INSERT INTO contestants (name, age, zodiac_sign) VALUES
('Garfield', 5, 'Taurus'),
('Hello Kitty', 4, 'Libra'),
('Cheshire Cat', 7, 'Gemini'),
('Duchess', 3, 'Cancer'),
('Marie', 2, 'Virgo'),
('Figaro', 3, 'Scorpio'),
('Simba', 4, 'Leo'),
('Nala', 3, 'Aries'),
('Felix', 5, 'Sagittarius'),
('Tom', 6, 'Pisces'),
('Sylvester', 4, 'Aquarius'),
('Puss in Boots', 5, 'Capricorn'),
('Kicia', 3, 'Gemini'),
('Berlioz', 2, 'Libra'),
('Mittens', 3, 'Taurus'),
('Oliver', 3, 'Virgo'),
('Bagheera', 6, 'Leo'),
('Lucifer', 5, 'Capricorn'),
('Snowbell', 4, 'Cancer'),
('Pusia', 4, 'Scorpio'),
('Top Cat', 5, 'Sagittarius'),
('Clawhauser', 6, 'Aquarius'),
('Sabor', 7, 'Pisces'),
('Rufus', 3, 'Gemini'),
('Dinah', 2, 'Libra'),
('Pepper', 3, 'Taurus'),
('Pancake', 4, 'Virgo'),
('Fluffy', 3, 'Cancer'),
('Shadow', 5, 'Leo');

-- Dodajemy wygląd dla każdej uczestniczki
INSERT INTO appearance (contestant_id, fur_color, eye_color, whisker_length) VALUES
(1, 'orange', 'green', 'short'),
(2, 'white', 'black', 'medium'),
(3, 'purple', 'yellow', 'long'),
(4, 'cream', 'blue', 'long'),
(5, 'white', 'green', 'long'),
(6, 'black', 'yellow', 'medium'),
(7, 'golden', 'brown', 'short'),
(8, 'tawny', 'blue', 'medium'),
(9, 'black', 'blue', 'long'),
(10, 'grey', 'green', 'medium'),
(11, 'black and white', 'yellow', 'short'),
(12, 'brown', 'green', 'medium'),
(13, 'brown', 'blue', 'medium'),
(14, 'grey', 'blue', 'short'),
(15, 'black', 'green', 'long'),
(16, 'white', 'brown', 'medium'),
(17, 'black', 'yellow', 'short'),
(18, 'grey', 'blue', 'long'),
(19, 'brown', 'black', 'long'),
(20, 'brown', 'green', 'long'),
(21, 'black', 'yellow', 'short'),
(22, 'grey', 'blue', 'medium'),
(23, 'white', 'brown', 'long'),
(24, 'black', 'yellow', 'medium'),
(25, 'orange', 'green', 'short'),
(26, 'grey', 'blue', 'long'),
(27, 'white', 'black', 'medium'),
(28, 'brown', 'green', 'short'),
(29, 'black', 'yellow', 'long');

-- Dodajemy zainteresowania dla każdej uczestniczki
INSERT INTO interests (contestant_id, music, travel, sports, books, movies, cooking) VALUES
(1, 0, 0, 0, 1, 1, 1),
(2, 1,0, 0, 0, 1, 0),
(13, 1, 0,0, 1, 0, 1),
(4, 1, 0, 0, 0, 1, 1),
(5, 1, 0, 0, 0, 1, 1),
(6, 1, 0, 0, 0, 1, 1),
(7, 1, 0, 0, 0, 1, 1),
(8, 1, 0, 0, 0, 1, 1),
(19, 1, 1, 0, 1, 1, 1),
(10, 1, 0,1, 0, 1, 1);

-- Dodajemy randki
INSERT INTO dates (contestant_id, success_score) VALUES
(13, 80),
(13, 90),
(13, 75),
(13,100),
(2,10),
(2,60),
(19,80),
(19, 90),
(19, 75),
(19,100)
;

-- Dodajemy kompatybilność zodiakalną dla wszystkich znaków
INSERT INTO zodiac_matches (sign1, sign2, compatibility_score) VALUES
('Leo', 'Aries', 90), ('Leo', 'Taurus', 0), ('Leo', 'Gemini', 96), ('Leo', 'Cancer', 91),
('Leo', 'Leo', 75), ('Leo', 'Virgo', 45), ('Leo', 'Libra', 94), ('Leo', 'Scorpio', 70),
('Leo', 'Sagittarius', 95), ('Leo', 'Capricorn', 55), ('Leo', 'Aquarius', 50), ('Leo', 'Pisces', 
40);
