/*1*/
SELECT id 'Código', titulo, duracion, produccion FROM peliculas WHERE titulo=titulo_original AND produccion>1990 ORDER BY duracion desc;
/*2*/

/*3*/
SELECT count(pelicula_id) as Cantidad, director 'Director' FROM peliculas_directores re, directores d WHERE re.director_id=d.id GROUP BY director_id ORDER BY cantidad desc;
/*4*/
SELECT max(ttp.cantidad), ttp.nombre FROM
(SELECT count(pelicula_id) as cantidad, actor as nombre FROM peliculas_actores, actores WHERE actores.id=peliculas_actores.actor_id GROUP BY actor) as ttp;
/*5*/
SELECT titulo, calificacion, duracion, actor FROM actores a, peliculas p, peliculas_actores re WHERE (re.pelicula_id=p.id AND a.id=re.actor_id) AND (actor LIKE 'robert%') AND 
duracion>100 AND (calificacion BETWEEN 1 AND 3)
ORDER BY duracion desc;
/*6*/
SELECT titulo, productor, director, produccion FROM peliculas p, peliculas_directores re1, directores d, peliculas_productores re2, productores pr WHERE
p.id=re1.pelicula_id AND re1.director_id=d.id AND re2.pelicula_id=p.id AND re2.productor_id=pr.id AND productor LIKE '%kennedy'
ORDER BY produccion;
/*7*/

/*8*/
SELECT genero, count(titulo) 'Cantidad de Peliculas' FROM generos g, peliculas p, peliculas_generos re, peliculas_directores re2, directores d WHERE
g.id=re.genero_id AND p.id=re.pelicula_id AND d.id=re2.director_id AND re2.pelicula_id=p.id AND d.director LIKE '%ford'
GROUP BY g.genero;
/*9*/
SELECT tp1.cprod 'Peliculas con produccion',  tp2.sprod 'Peliculas sin produccion', tp3.maximo as Maximo, tp4.minimo as Minimo, Maximo-Minimo FROM
(SELECT count(*) as cprod FROM peliculas WHERE produccion IS NOT NULL) as tp1,
(SELECT count(*) as sprod FROM peliculas WHERE produccion IS NULL) as tp2,
(SELECT max(produccion) as maximo FROM peliculas) as tp3,
(SELECT min(produccion) as minimo FROM peliculas) as tp4;
/*10*/
SELECT titulo, produccion, genero FROM peliculas p, generos g, peliculas_generos re WHERE p.id=re.pelicula_id AND g.id=re.genero_id AND (g.id=13 OR g.id=17);
/*11*/
SELECT titulo, produccion, BN, sinopsis FROM peliculas p, peliculas_sinopsis re WHERE
p.id=re.pelicula_id AND BN=-1;
/*12*/

/*13*/

/*14*/
SELECT upper(titulo) FROM peliculas NATURAL JOIN peliculas_generos WHERE peliculas_generos.genero_id=17;
/*15*/
SELECT tp1.cto 'Con titulo original',  tp2.sto 'Sin titulo original',  tp3.tig 'Con titulos iguales', tp4.tdf 'Sin titulos iguales' FROM
(SELECT count(*) as cto FROM peliculas WHERE titulo_original IS NULL) as tp1,
(SELECT count(*) as sto FROM peliculas WHERE titulo_original IS NOT NULL) as tp2,
(SELECT count(*) as tig FROM peliculas WHERE titulo=titulo_original) as tp3,
(SELECT count(*) as tdf FROM peliculas WHERE titulo NOT IN (titulo_original)) as tp4;