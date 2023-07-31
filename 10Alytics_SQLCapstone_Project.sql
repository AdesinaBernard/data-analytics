SELECT * FROM donor_data LIMIT 10;
SELECT * FROM donation_data LIMIT 10;


-- SQL CAPSTONE PROJECT SOLUTION STARTS FROM HERE

-- How much is the total donation
SELECT SUM(donation) AS total_donation
FROM donation_data;

-- Total donation by gender
SELECT gender, SUM(donation) AS total_donation_by_gender
FROM donation_data
GROUP BY gender;

-- Total donation and count of donation by gender
SELECT gender, SUM(donation) AS total_donation, COUNT(donation) AS count_of_donation
FROM donation_data
GROUP BY gender;

-- Total donation by frequency of donation
SELECT donation_frequency AS frequency, SUM(donation) AS total_donation
FROM donation_data AS dd
JOIN donor_data AS dod
ON dd.id = dod.id
GROUP BY frequency;

-- Total donation and number of donation by job field
SELECT job_field, COUNT(donation) AS count_of_donation, SUM(donation) AS total_donation
FROM donation_data
GROUP BY job_field;

-- Total donantion and number of donation above $200
SELECT COUNT(donation) AS donation_above200, SUM(donation) AS total_donation
FROM donation_data
WHERE donation > 200;

-- Total donantion and number of donation below $200
SELECT COUNT(donation) AS donation_below200, SUM(donation) AS total_donation
FROM donation_data
WHERE donation < 200;

-- Top 10 states with the highest donation
SELECT state, SUM(donation) AS total_donation
FROM donation_data
GROUP BY state
ORDER BY total_donation DESC
LIMIT 10;

-- Top 10 states with the least donation
SELECT state, SUM(donation) AS total_donation
FROM donation_data
GROUP BY state
ORDER BY total_donation ASC
LIMIT 10;

-- Top 10 cars driven by the highest donors
SELECT car, SUM(donation) AS total_donation
FROM donation_data AS dd
JOIN donor_data AS dod
ON dd.id = dod.id
GROUP BY car
ORDER BY total_donation DESC
LIMIT 10;
