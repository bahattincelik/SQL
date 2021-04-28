
DROP TABLE calisanlar2;
DROP TABLE aileler;
    CREATE TABLE calisanlar2
    (
    id CHAR(4),
    isim VARCHAR2(50),
    maas NUMBER(5),
    CONSTRAINT id_pk_calisanlar PRIMARY KEY (id)
    );
    INSERT INTO calisanlar2 VALUES('1001', 'Ahmet Aslan', 7000);
    INSERT INTO calisanlar2 VALUES( '1002', 'Mehmet Y?lmaz' ,12000);
    INSERT INTO calisanlar2 VALUES('1003', 'Meryem ', 7215);
    INSERT INTO calisanlar2 VALUES('1004', 'Veli Han', 5000);
    CREATE TABLE aileler
    (
    id CHAR(4),
    cocuk_sayisi VARCHAR2(50),
    ek_gelir NUMBER(5),
    CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar2(id)
    );
    INSERT INTO aileler VALUES('1001', 4, 2000);
    INSERT INTO aileler VALUES('1002', 2, 1500);
    INSERT INTO aileler VALUES('1003', 1, 2200);
    INSERT INTO aileler VALUES('1004', 3, 2400);
    
    SELECT * FROM calisanlar2;
    SELECT * FROM aileler;
--------------------------------------------------------------------------------
/*2-) Veli Han'?n maa??na %20 zam yapacak update komutunu yaz?n?z.
Güncellemeden sonra calisanlar tablosu a?a??da görüldü?ü gibi olmal?d?r.*/

    UPDATE calisanlar2
    SET maas= maas*1.2
    WHERE isim = 'Veli Han';
    
    SELECT * FROM calisanlar2;
--------------------------------------------------------------------------------
/*3-) Maa?? ortalaman?n alt?nda olan çal??anlar?n maa??na %20 zam yap?n?z.
Komut sonras? görünüm a?a??daki gibidir*/

    UPDATE calisanlar2
    SET maas=maas*1.2
    WHERE maas<(SELECT AVG(maas) FROM calisanlar2);
--------------------------------------------------------------------------------
/*4-) Çal??anlar?n isim ve cocuk_sayisi'ni listeleyen bir sorgu yaz?n?z. Komut
sonras? görünüm a?a??daki gibidir*/

    SELECT isim, cocuk_sayisi 
    FROM calisanlar2, aileler 
    WHERE calisanlar2.id=aileler.id;
    
    SELECT isim, (SELECT cocuk_sayisi FROM aileler
                 WHERE calisanlar.id = aileler.id) as cocuk_sayisi
    FROM calisanlar;
--------------------------------------------------------------------------------
/*5-) calisanlar' ?n id, isim ve toplam_gelir'lerini gösteren bir sorgu yaz?n?z.
toplam_gelir = calisanlar.maas + aileler.ek_gelir*/

    SELECT id, isim, (SELECT (calisanlar2.maas+aileler.ek_gelir) FROM aileler
                                WHERE calisanlar2.id=aileler.id)
                                AS toplam_gelir
    FROM calisanlar2;
    
    SELECT id, isim, (SELECT maas + ek_gelir FROM aileler
                      WHERE calisanlar.id = aileler.id) as toplam_gelir
    FROM calisanlar;
--------------------------------------------------------------------------------
/*6-) E?er bir ailenin ki?i ba?? geliri 2000 TL den daha az ise o çal??an?n
-- maa??na ek %10 aile yard?m zamm? yap?n?z.
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)*/

    UPDATE calisanlar2
    SET maas=maas*1.1
    WHERE (SELECT (maas+aileler.ek_gelir) FROM aileler
         WHERE calisanlar2.id=aileler.id)/ (aileler.cocuk_sayisi+2)<2000;
    
      UPDATE calisanlar 
    SET maas = maas * 1.1    
    WHERE (SELECT (maas + ek_gelir)/(cocuk_sayisi + 2) FROM aileler
          WHERE calisanlar.id = aileler.id) < 2000; 
    
    
    
    
    
    
    