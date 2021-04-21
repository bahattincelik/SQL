--TABLO OLUSTURMA
/*  
COMMENT LINE
*/
CREATE TABLE student 
(
    std_id CHAR(3),
    std_name VARCHAR2(20),
    std_age NUMBER
);

INSERT INTO student VALUES('101','AHMET CAN',30);
INSERT INTO student VALUES('102','BAHATTIN CELIK',33);
INSERT INTO student VALUES('103','MUSTAFA ALI',29);
INSERT INTO student VALUES('104','AYSE YILMAZ',25);

INSERT INTO student(std_id,std_name)VALUES('105', 'SEYDA CELIK');

SELECT * FROM student;

------------------------------------------------------------------
--ORNEK-1 CRUD
--1.Veritaban?m?zda ÜRÜNLER ad?nda bir Tablo olu?tural?m.
--•ürün_id => NUMBER
--•ürün_ad? => VARCHAR2(50)
--•fiyat => NUMBER(5,2)
--•TETT => DATE,   
--•stok_adedi => NUMBER(10) 
--•
--2.Bu tabloya, belirledi?imiz veri tiplerine uygun olacak ?ekilde Ürün giri?i yapal?m.
--•Örne?in C?PS, KOLA, AYRAN, B?SKÜV?, 
--•(100, ‘C?PS’, 5.50, ‘01-05-2022’, 500)
--3.Veri giri?inden sonra SELECT komutu ile verilerimizi çekelim.


CREATE TABLE urunler 
(
    urun_id  NUMBER,
    urun_adi VARCHAR2(50),
    fiyat    NUMBER(5,2),
    TETT     DATE,   
    stok_adedi NUMBER(10)

);

INSERT INTO urunler VALUES(100,'CIPS',5.50,'14-2-21',500);
--SELECT   *  FROM urunler;
DROP TABLE urunler;

DROP TABLE student;

 select * from nls_session_parameters;


