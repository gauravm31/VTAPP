CREATE TABLE colors (
  id INT AUTO_INCREMENT,
  name VARCHAR(15),
  density FLOAT(3,2),
  PRIMARY KEY (id)
);

CREATE TABLE mixtures (
  id INT AUTO_INCREMENT,
  parent1_id INT,
  parent2_id INT,
  mix_id INT,
  mix_density FLOAT(3,2),
  parent1_perc INT,
  parent2_perc INT,
  PRIMARY KEY (id),
  FOREIGN KEY (mix_id) REFERENCES colors(id)
);

ALTER TABLE colors SET autoincrement = 10;


--Populate colors

INSERT INTO colors VALUES (NULL, 'red', 0.20),
                          (NULL, 'green', 0.30),
                          (NULL, 'blue', 0.40),
                          (NULL, 'yellow', 0.20),
                          (NULL, 'pink', 0.30),
                          (NULL, 'cyan', 0.40),
                          (NULL, 'white', 0.28);


-- Populate mixtures

INSERT INTO mixtures VALUES (NULL, 10, 11, 13, 0.6, 30, 70),
                            (NULL, 10, 12, 14, 0.5, 50, 50),
                            (NULL, 11, 12, 15, 0.75, 40, 60),
                            (NULL, 10, 13, 16, 0.28, 80, 20);

-- Find the colors that can be clubbed with 'Red' and also name the resulting color

  SELECT c1.name AS 'combine with', c2.name AS 'resulting color'
  FROM colors as c1 INNER JOIN mixtures
  ON c1.id = mixtures.parent2_id
  INNER JOIN colors as c2
  ON c2.id = mixtures.mix_id
  WHERE parent1_id = 10
  UNION
  SELECT c1.name, c2.name
  FROM colors as c1 INNER JOIN mixtures
  ON c1.id = mixtures.parent1_id
  INNER JOIN colors as c2
  ON c2.id = mixtures.mix_id
  WHERE parent2_id = 10

-- Find mixtures that can be formed without 'Red'

SELECT colors.name
FROM colors
INNER JOIN mixtures
ON colors.id = mixtures.mix_id
WHERE mixtures.parent1_id != 10
AND mixtures.parent2_id != 10;


-- Find the mixtures that have one common parent

SELECT c1.name AS 'parent name', GROUP_CONCAT(c2.name SEPARATOR ' & ') AS 'possible mixture'
FROM colors AS c1
INNER JOIN mixtures as m
ON c1.id = m.parent1_id OR c1.id = m.parent2_id
INNER JOIN colors as c2
ON m.mix_id = c2.id
GROUP BY c1.name
ORDER BY c1.id;

-- Find parent colors(as a couple) that give mix colors with density higher than the color density originally

SELECT CONCAT(parent1_id, ' & ', parent2_id) AS 'parent colors', mix_id, mix_density, colors.density AS 'original density'
FROM colors
INNER JOIN mixtures
ON colors.id = mixtures.mix_id
WHERE mix_density > colors.density;

-- calculate the total amount of color 'Red'(in kgs) needed to make a 1kg mix each for its possible mixtures(yellow,pink..)

SELECT CONVERT((IFNULL(SUM(m1.parent1_perc), 0) + IFNULL(SUM(m2.parent2_perc), 0))/100, DECIMAL(3,1)) AS amount
  FROM colors AS c
  INNER JOIN mixtures AS m1
  ON c.id = m1.parent1_id
  LEFT JOIN mixtures AS m2
  ON c.id = m2.parent2_id
  GROUP BY c.name
  HAVING c.name = 'red';
  

