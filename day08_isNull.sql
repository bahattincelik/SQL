/*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmad???n? kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. E?er ald??? tüm ifadeler NULL ise NULL döndürürür.
    
    sutun_adi = COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/

    CREATE TABLE insanlar 
    (
        ssn CHAR(9),
        isim VARCHAR2(50), 
        adres VARCHAR2(50) 
    );

    INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES('999111222');
    
    DELETE FROM insanlar;
/* ----------------------------------------------------------------------------
    ORNEK1: isim 'i NULL olanlar? sorgulay?n?z.
 -----------------------------------------------------------------------------*/     
    SELECT * FROM insanlar
    WHERE isim IS NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK2: isim 'i NULL olmayanlar? sorgulay?n?z.
 -----------------------------------------------------------------------------*/  
    SELECT * FROM insanlar
    WHERE isim IS NOT NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK3: isim 'i NULL olan ki?ilerin isim'ine NO NAME atay?n?z. 
-----------------------------------------------------------------------------*/   
    UPDATE insanlar
    SET isim = 'NO NAME'
    WHERE isim IS NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK4:   isim 'i NULL olanlara 'Henuz isim girilmedi'
            adres 'i NULL olanlara 'Henuz adres girilmedi'
            ssn 'i NULL olanlara ' no ssn' atayal?m.
-----------------------------------------------------------------------------*/    
   UPDATE insanlar
   SET isim = COALESCE (isim, 'Henüz isim girilmedi'),
       adres = COALESCE (adres, 'Henüz adres girilmedi'),
       ssn= COALESCE (ssn, 'No SSN');
       
    
/*================================ ORDER BY  ===================================
   ORDER BY cümleci?i bir SORGU deyimi içerisinde belli bir SUTUNa göre 
   SIRALAMA yapmak için kullan?l?r.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/       
    CREATE TABLE kisiler 
    (
        ssn CHAR(9) PRIMARY KEY,
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

    SELECT * FROM kisiler;
    
/* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres'e göre s?ralayarak sorgulay?n?z.
 -----------------------------------------------------------------------------*/ 
 
    SELECT * FROM kisiler
    ORDER BY adres;   --- ASC gibi s?rad?.

/* ----------------------------------------------------------------------------
  ORNEK2: kisiler tablosunu maas'a göre s?ralayarak sorgulay?n?z.
 -----------------------------------------------------------------------------*/  
    SELECT * FROM kisiler
    ORDER BY maas;  
 
 /* ----------------------------------------------------------------------------
  ORNEK3: kisiler tablosunu maas'a göre AZALAN s?rada sorgulay?n?z.
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM kisiler
    ORDER BY maas DESC;  -- Azalan
 
/* ----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanlar?, SSN'e göre AZALAN s?rada sorgulay?n?z.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    WHERE isim = 'Mine'
    ORDER BY ssn DESC;
/* ----------------------------------------------------------------------------
  ORNEK5: soyismi 'i Bulut olanlar? isim s?ral? olarak sorgulay?n?z.
-----------------------------------------------------------------------------*/ 
    SELECT * FROM kisiler
    WHERE soyisim = 'Bulut'
    ORDER BY 2;                 -- isim'e göre s?ralanm??
     
       
/*====================== FETCH NEXT, OFFSET (12C VE ÜSTÜ) ======================
   FETCH cümleci?i ile listelenecek kay?tlar? s?n?rland?rabiliriz. ?stersek 
   sat?r say?s?na göre istersek de toplam sat?r say?s?n?n belli bir yüzdesine 
   göre s?n?rland?rma koymak mümkündür. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET Cümleci?i ile de listenecek olan sat?rlardan s?ras?yla istedi?imiz 
   kadar?n? atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET sat?r_sayisi ROWS;
  
==============================================================================*/ 
/* ----------------------------------------------------------------------------
  ORNEK1: MAA?'? en yüksek 3 ki?inin bilgilerini listeleyen sorguyu yaz?n?z.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas DESC
    FETCH NEXT 3 ROWS ONLY;
    
/* ----------------------------------------------------------------------------
  ORNEK2: MAA?'? en DÜ?ÜK 2 ki?inin bilgilerini listeleyen sorguyu yaz?n?z.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas ASC
    FETCH NEXT 2 ROWS ONLY;
    
/* ----------------------------------------------------------------------------
  ORNEK3: MAA?'a göre s?ralamada 4. ile 6. ki?ilerin bilgilerini listeleyen 
  sorguyu yaz?n?z.
-----------------------------------------------------------------------------*/     
    SELECT * FROM kisiler
    ORDER BY maas DESC
    OFFSET 3 ROWS           -- ilk 3 kayd? atlad?k
    FETCH NEXT 3 ROWS ONLY; -- sonraki 3 kayd? seçtik.