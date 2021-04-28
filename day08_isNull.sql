 
         
 /*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL BOOLEAN operat�rleridir. Bir ifadenin NULL olup 
    olmad???n? kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve i�erisindeki parameterelerden NULL olmayan
    ilk ifadeyi d�nd�r�r. E?er ald??? t�m ifadeler NULL ise NULL d�nd�r�r�r.
    
    COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/

    CREATE TABLE insanlar 
    (
        ssn CHAR(9),
        isim VARCHAR2(50), 
        adres VARCHAR2(50) 
    );
?
    INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES(999111222);
    
 /* ----------------------------------------------------------------------------
  ORNEK1: isim �i NULL olanlar? sorgulay?n?z.
-----------------------------------------------------------------------------*/   
    
    SELECT * FROM insanlar
    WHERE isim IS NULL;
    
    
    
    SELECT * FROM insanlar
    WHERE isim IS NOT NULL;
    
    /* ----------------------------------------------------------------------------
  ORNEK3: isim �i NULL olan ki?ilerin isim�ine NO NAME atay?n?z.
-----------------------------------------------------------------------------*/
    
    UPDATE insanlar
    SET isim='NO NAME'
    WHERE isim IS NULL;
    
    
    UPDATE insanlar
    SET isim = COALESCE(isim, 'Henuz isim girilmedi'),
        adres= COALESCE(adres, 'Henuz adres girilmedi'),
        ssn = COALESCE (ssn, 'No SSN');
 /*================================ ORDER BY  ===================================
   ORDER BY c�mleci?i bir SORGU deyimi i�erisinde belli bir SUTUN�a g�re 
   SIRALAMA yapmak i�in kullan?l?r.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/   
    CREATE TABLE kisiler 
    (
        ssn char(9) PRIMARY KEY,
        isim VARCHAR2(50), 
        soyisim VARCHAR2(50), 
        maas NUMBER,
        adres VARCHAR2(50) 
    );
    
    INSERT INTO kisiler VALUES(123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(345678901, 'Mine','Bulut',4200,'Ankara');
    INSERT INTO kisiler VALUES(256789012, 'Mahmut','Bulut',3150,'Istanbul');
    INSERT INTO kisiler VALUES (344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (345458901, 'Veli','Yilmaz',7000,'Istanbul');
?
    SELECT * FROM kisiler;
    /* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres�e g�re s?ralayarak sorgulay?n?z.
-----------------------------------------------------------------------------*/

    SELECT * FROM kisiler 
    ORDER BY adres;

/*----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanlar?, SSN�e g�re AZALAN s?rada sorgulay?n?z.
-----------------------------------------------------------------------------*/   

    SELECT * FROM kisiler
    WHERE isim='Mine'
    ORDER BY SSN DESC;
    
    SELECT * FROM kisiler
    WHERE soyisim='Bulut'
    ORDER BY 2;
    
/* ----------------------------------------------------------------------------
  ORNEK1: MAA?�? en y�ksek 3 ki?inin bilgilerini listeleyen sorguyu yaz?n?z.
-----------------------------------------------------------------------------*/
    
    SELECT * FROM kisiler
    ORDER BY maas DESC
    FETCH NEXT 3 ROWS ONLY;
    
 /*====================== FETCH NEXT, OFFSET (12C VE �ST�) ======================
   FETCH c�mleci?i ile listelenecek kay?tlar? s?n?rland?rabiliriz. ?stersek 
   sat?r say?s?na g�re istersek de toplam sat?r say?s?n?n belli bir y�zdesine 
   g�re s?n?rland?rma koymak m�mk�nd�r. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET C�mleci?i ile de listenecek olan sat?rlardan s?ras?yla istedi?imiz 
   kadar?n? atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET sat?r_sayisi ROWS;
  
==============================================================================*/ 
    SELECT * FROM kisiler
    ORDER BY maas DESC
    OFFSET 3 ROWS 
    FETCH NEXT 3 ROWS ONLY;
    
/*============================= GROUP BY =====================================
    
    GROUP BY c�mleci?i bir SELECT ifadesinde sat?rlar?, sutunlar?n de?erlerine 
    g�re �zet olarak gruplamak i�in kullan?l?r. 
   
    GROUP BY c�mlece?i her grup ba??na bir sat?r d�nd�r�r. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlar? ile birlikte kullan?l?r.
    
==============================================================================*/    
    
    
    
    
    
    
    
    
    