--1. soru: film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT (*) FROM film 
WHERE length > 
(
SELECT AVG(length) FROM film
);

--2. soru: film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT (*) FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

--3. soru: film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT COUNT(*) FROM film
WHERE rental_rate = (SELECT min(rental_rate) FROM film) AND (replacement_cost = (SELECT min(replacement_cost) FROM film));

--4. soru: payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT customer_id, COUNT(*) AS most_payments FROM payment
GROUP BY customer_id
ORDER BY most_payments DESC;