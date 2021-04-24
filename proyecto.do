**************************************************************************************************
**** PROYECTO: CÁLCULO DE INDICADORES
**** OBJETIVO: Crear el Indicador:  Hogares con presencia de **** algún menor de 18 años de edad, según área de residencia 
**** Año	 : 2019
**** FECHA	 : 24/04/2021
**** Stata   : version 16
**** Restricciones:
**** - Se consideraron a las viviendas con a lo más hogares para ser comparado con la ENAHO
**** - Se analiza en la población miembro del hogar en viv.particulares con ocupantes presentes
**** - Se usa el factor de ponderació hogares
**************************************************************************************************

clear all
cd "D:\Indicadores en STATA16\Sesion 1\bases1"
dir*

*Traslate a unicode (STATA-16)
unicode analyze * //traslate a todas las bases de la carpeta
unicode encoding set ISO-8859-1 //código latino
unicode translate *
*unicode restore * //para regresar a código original

*Abriendo base de datos
use enaho01-2019-200,clear  //Población

use enaho01-2019-100, clear
sort conglome vivienda hogar
* "result" es tipo "byte" por eso no se le pone comillas
keep if result==1 | result==2
save "cap100_result_1_2.dta", replace

use "enaho01-2019-200", clear
merge m:1 conglome vivienda hogar using enaho01-2019-100

gen residente=1 if (((p204==1 & p205==2) | (p204==2 & p206==1))) 
keep if residente==1



*Ver duplicados de hogares (En una vivienda puede haber mas de 1 hogar)
sort conglome vivienda hogar
duplicates tag conglome vivienda hogar, gen(duplicados)
tab dup
br if dup==1

* Total hogares
preserve
keep if p204==1
sort conglome vivienda hogar codperso
duplicates drop conglome vivienda hogar, force
tab dominio [iw=facpob07 ]
restore

* hogares con NNA <=17
keep if p204==1
keep if p208a<=17

sort conglome vivienda hogar codperso
duplicates drop conglome vivienda hogar, force
tab departamento p105a [iw=facpob07 ], nofreq row
 
 
 tab 
 
destring ubigeo, replace
gen departamento = ubigeo

replace departamento = 1 if (ubigeo >=10000 & ubigeo <20000)
replace departamento = 2 if (ubigeo >=20000 & ubigeo <30000)
replace departamento = 3 if (ubigeo >=30000 & ubigeo <40000)
replace departamento = 4 if (ubigeo >=40000 & ubigeo <50000)
replace departamento = 5 if (ubigeo >=50000 & ubigeo <60000)
replace departamento = 6 if (ubigeo >=60000 & ubigeo <70000)
replace departamento = 7 if (ubigeo >=70000 & ubigeo <80000)
replace departamento = 8 if (ubigeo >=80000 & ubigeo <90000)
replace departamento = 9 if (ubigeo >=90000 & ubigeo <100000)
replace departamento = 10 if (ubigeo >=100000 & ubigeo <110000)
replace departamento = 11 if (ubigeo >=110000 & ubigeo <120000)
replace departamento = 12 if (ubigeo >=120000 & ubigeo <130000)
replace departamento = 13 if (ubigeo >=130000 & ubigeo <140000)
replace departamento = 14 if (ubigeo >=140000 & ubigeo <150000)
replace departamento = 15 if (ubigeo >=150000 & ubigeo <150200)
replace departamento = 16 if (ubigeo >=150200 & ubigeo <160000)
replace departamento = 17 if (ubigeo >=160000 & ubigeo <170000)
replace departamento = 18 if (ubigeo >=170000 & ubigeo <180000)
replace departamento = 19 if (ubigeo >=180000 & ubigeo <190000)
replace departamento = 20 if (ubigeo >=190000 & ubigeo <200000)
replace departamento = 21 if (ubigeo >=200000 & ubigeo <210000)
replace departamento = 22 if (ubigeo >=210000 & ubigeo <220000)
replace departamento = 23 if (ubigeo >=220000 & ubigeo <230000)
replace departamento = 24 if (ubigeo >=230000 & ubigeo <240000)
replace departamento = 25 if (ubigeo >=240000 & ubigeo <250000)
replace departamento = 26 if (ubigeo >=250000 & ubigeo <260000)


#delimit ; 
lab def dptos 1 "AMAZONAS" 2 "ANCASH" 3 "APURIMAC" 4 "AREQUIPA" 5 "AYACUCHO" 6 "CAJAMARCA" 7 "CALLAO"
8 "CUSCO" 9 "HUANCAVELICA" 10 "HUANUCO" 11 "ICA" 12 "JUNIN" 13 "LA LIBERTAD" 14 "LAMBAYEQUE" 15 "PROVINCIA DE LIMA" 16 "REGIÓN LIMA"
17 "LORETO" 18 "MADRE DE DIOS" 19 "MOQUEGUA" 20 "PASCO" 21 "PIURA" 22 "PUNO" 23 "SAN MARTIN" 24 "TACNA"
25 "TUMBES" 26 "UCAYALI";
#delimit cr
lab val departamento dptos

