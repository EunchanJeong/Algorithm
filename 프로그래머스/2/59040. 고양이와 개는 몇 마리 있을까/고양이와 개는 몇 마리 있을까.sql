SELECT animal_type, count(animal_type) as count
FROM ANIMAL_INS
GROUP BY animal_type
ORDER BY animal_type;