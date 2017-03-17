Predicates
nondeterm dapat_membeli(symbol,symbol)/* berfungsi untuk sebuah penghubung atau relasi */
nondeterm orang(symbol)
nondeterm mobil(symbol)
suka(symbol, symbol)
dijual(symbol)

Clauses
dapat_membeli(X,Y):-
orang(X), mobil(Y), suka(X,Y), dijual(Y).  /* jadi disini X dapat membeli Y jika X adalah orang sedangkan Y adalah mobil , X suka Y dan Y dijual */

orang(nur)./* nur adalah orang */
orang(yudi). /*yudi adalah orang */
orang(dian). /*dian adalah orang */
orang(heri)./*heri adalah orang */

mobil(atoz). /* atoz adalah mobil*/
mobil(kijang)./* kijang adalah mobil*/

suka(dian, atoz)./* dian suka mobil atoz*/
suka(yudi, pecel)./*yudi suka pecel*/
suka(heri, buku)./*heri suka buku*/
suka(nur, komputer)./*nur suka komputer*/

dijual(kijang)./*kijang dijual*/
dijual(atoz)./*atoz dijual*/
dijual(buku)./*buku dijual*/

Goal
dapat_membeli(Siapa,Apa)./* jadi disini siapa yang dapat membeli dan apa yang dibeli*/
%suka(_,Apa).		/* dan hasil nya nanti adalah (dian) (atoz) kenapa, karena disinin nondetermnya menunjukan dapat_membeli,
%suka(Siapa,_).		/* orang dan mobil yang artinya orang (dian) yang dapat membeli mobil(atoz) dan atoz dijual maka dia dapat membeli atoz karena dian suka mobil atoz */
%dapat_membeli(_,Apa).
%dapat_membeli(Siapa,_).