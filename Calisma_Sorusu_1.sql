--========== CALISMA SORUSU - 1 =======================

/*
a) A?a??da verilen “personel” tablosunu olu?turunuz.
b) Tablodan maa?? 5000’den az veya ünvan? i?çi olanlar?n isimlerini listeleyin
c) ?sçilerin tüm bilgilerini listeleyin.
d) Soyad? Can, Cem veya Gül olanlar?n unvanlar?n? ve maa?lar?n? listeleyin.
e) Maa?? 5000’den çok olanlar?n email ve i?e ba?lama tarihlerini listeleyin
f) Maa?? 5000’den çok veya 7000’den az olanlar?n tüm bilgilerini listeleyiniz.
*/

    CREATE TABLE personel2(
        
        id NUMBER(9)  ,
        isim VARCHAR2(20)  ,
        soyisim VARCHAR2(20)  ,
        email VARCHAR2(30) ,
        ise_baslama_tar DATE  ,
        is_unvani VARCHAR2(20)  ,
        maas NUMBER(30) 
    
    );
    
    INSERT INTO personel2 VALUES (123456789, 'Ali', 'Can', 'alican@gmail.com', '10-04-2010','isci',5000);
    INSERT INTO personel2 VALUES (123456788, 'Veli', 'Cem', 'velicem@gmail.com', '10-06-2012','isci',5500);
    INSERT INTO personel2 VALUES (123456787, 'Ayse', 'Gul', 'aysegul@gmail.com', '01-05-2014','muhasebeci',4500);
    INSERT INTO personel2 VALUES (123456789, 'Fatma', 'Yasa', 'fatmayasa@gmail.com', '10-04-2009','muhendis',7500);

    
------------------------------------------------------------------------------------------------
//a)
    SELECT
        *
    FROM personel2;
--------------------------------------------------------------------------------------
//b)
    SELECT isim 
    FROM personel2
    WHERE maas<5000 OR is_unvani='isci';
--------------------------------------------------------------------------------------
//c)
    SELECT * FROM personel2
    WHERE is_unvani='isci';
------------------------------------------------------------------------------------
//d)
    SELECT is_unvani, maas 
    FROM personel2
    WHERE soyisim IN('Can', 'Cem', 'Gul');
-------------------------------------------------------------------------------------
//e)
    SELECT email,ise_baslama_tar 
    FROM personel2
    WHERE maas>5000;
-------------------------------------------------------------------------------------------
//f)
    SELECT * FROM personel2
    WHERE maas>5000 OR maas<7000;












