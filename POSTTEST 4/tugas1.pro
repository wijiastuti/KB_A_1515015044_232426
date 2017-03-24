DOMAINS
nama,jender,pekerjaan,benda,alasan,zat = symbol
umur=integer
PREDICATES
nondeterm orang(nama, umur, jender, pekerjaan)
nondeterm selingkuh(nama, nama)
terbunuh_dengan(nama, benda)
terbunuh(nama)
nondeterm pembunuh(nama)
motif(alasan)
ternodai(nama, zat)
milik(nama, benda)
nondeterm cara_kerja_mirip(benda, benda)
nondeterm kemungkinan_milik(nama, benda)
nondeterm dicurigai(nama)
/* * * Fakta-fakta tentang pembunuhan * * */
CLAUSES
orang(budi,55,m,tukang_kayu). /*nama budi berumur 55 Tahun pekerjaan tukang kayu*/
orang(aldi,25,m,pemain_sepak_bola)./*nama aldi berumur 25 Tahun pekerjaan pemain bola*/
orang(aldi,25,m,tukang_jagal)./*nama aldi berumur 25 tahun pekerjaan tukang jagal*/
orang(joni,25,m,pencopet)./*joni berumur 25 tahun pekerjaan copet*/
selingkuh(ina,joni)./*ina selingkuh dengan joni*/
selingkuh(ina,budi)./*ina selingkuh dengan budi*/
selingkuh(siti,joni)./*ina selingkuh dengan joni*/
terbunuh_dengan(siti,pentungan)./*siti telah terbunuh dengan pentungan */
terbunuh(siti)./*siti telah terbunuh*/
motif(uang)./*dengan alasan uang*/
motif(cemburu)./*dengan alasan cemburu*/
motif(dendam)./*dengan alasan dendam */
ternodai(budi, darah)./*budi telah ternodai darah*/ 
ternodai(siti, darah)./*siti telah ternodai darah*/
ternodai(aldi, lumpur)./*aldi telah ternodia lumpur */
ternodai(joni, coklat)./*joni telah ternodai coklat*/
ternodai(ina, coklat)./*ina telah ternodi coklat*/
milik(budi,kaki_palsu)./*kaki palsu milik budi*/
milik(joni,pistol)./*pistol milik joni*/
/* * * Basis Pengetahuan * * */
cara_kerja_mirip(kaki_palsu, pentungan)./*cara kerjanya mirip dengan benda yang dia punya yaitu kaki palsu dan pentungan*/
cara_kerja_mirip(balok, pentungan)./*cara kerjanya mirip dengan benda yang dia punya yaitu balok dan pentungan*/ 
cara_kerja_mirip(gunting, pisau)./*cara kerjanya mirip dengan benda yang dia punya yaitu gunting dan pisau*/
cara_kerja_mirip(sepatu_bola, pentungan)./*cara kerjanya dengan benda yang dia punya yaitu sepatu bola dan pentungan*/
kemungkinan_milik(X,sepatu_bola):-/*kemungkinan milik aldi yang mempunyai sepatu bola jika*/
orang(X,_,_,pemain_sepak_bola). 
kemungkinan_milik(X,gunting):-
orang(X,_,_,pekerja_salon).
kemungkinan_milik(X,Benda):-
milik(X,Benda).
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-/*telah dicuriogai aldi*/
terbunuh_dengan(siti,Senjata) ,/*siti telah terbunuh dengan senjata*/
cara_kerja_mirip(Benda,Senjata) ,/*cara kerjanya mirip dengan benda  yang iya miliki dengan senjata*/
kemungkinan_milik(X,Benda)./*kemungkinan benda itu milik aldi*/
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-/*telah dicurigai di x*/
motif(cemburu),/*dengan alasan cemburu*/
orang(X,_,m,_),/* dia adalah x dengan jender m*/
selingkuh(siti,X)./*siti telah selingkuhb dengan x*/
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-/*dicurigai x*/
motif(cemburu),/*dengan alasan cemburu*/
orang(X,_,f,_),/*orangnya adalah si x */
selingkuh(X,Lakilaki),/*aldi telah selingkuh */
selingkuh(siti,Lakilaki)./*siti selingkuh dengan laki_laki*/
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-/*yang dicurigai adalah*/
motif(uang),/*motif pembunuhan dengan alasan*/
orang(X,_,_,pencopet)./* dia adalah ......yang mempunyai pekerjan pencopet*/
pembunuh(Pembunuh):-/*dia adalah pembunuh */
orang(Pembunuh,_,_,_),/*orang yang membunung*/
terbunuh(Terbunuh),/*telah terbunuh*/
Terbunuh <> Pembunuh, /* Bukan bunuh diri */
dicurigai(Pembunuh),/*pembunuh telah dicurigai oleh */
ternodai(Pembunuh,Zat),/*pembunuh ternodai oleh zat....*/
ternodai(Terbunuh,Zat)./*dia telah terbunuh dan ternodai zat.....*/
GOAL
pembunuh(X)./* si x adalah pelaku pembunuhan */
	    /* maka si x = budi*/
	    /*karena pernyataan kasus yang terbunuh adalah siti,dengan senjata yang dipakai adalah pentungan yang menggunakan kaki palsu dan tangan
	    budi yang telah berlumuran darah*/