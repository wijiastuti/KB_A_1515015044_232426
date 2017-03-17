Predicates 
nondeterm suka(symbol,symbol) //*jadi disini predikat berfungsi sebagai relasi dan disertai dengan sebuah argumen, dan disini (symbol,symbol) bisa kita analisis sebagai orang dan hobby *//

Clauses
suka(asep,membaca). /*Asep suka hobby membaca (PERNYATAAN) */
suka(asari,computers). /*asari suka hobby komputer (PERNYATAAN) */
suka(nunung,bulutangkis). /* nunung suka hobby bulutangkis (PERNYATAAN) */
suka(vida,bulutangkis)./* vida suka hooby bulutangkis (PERNYATAAN) */
suka(astana,renang)./* astana suka hobby renang */  
suka(astana.membaca)./* astana suka hobby membaca */

Goal
suka(Orang, membaca), /* siapa saja yang suka hobby membaca dan siapa kah yang suka hobby renang */  
suka(Orang,renang). /* dan akan muncul yaitu asep dan astana (yang suka hobby membaca) dan astana (yang suka hobby renang) */