-- Clef secondaire
SELECT id, year, host, category, nominee, movie, character, won 
FROM cereminies
INNER JOIN nominations
ON nominations.ceremony_id == cermonies.id

-- one_to_many
    -- plusieurs lignes d'une table ont une référence à une ligne d'une autre table 
    -- une référence dans un seul sens 

    -- tous les film qui ont reçus un oscart en 2010
SELECT movie
FROM nominations
INNER JOIN ceremonies
ON nominations.ceremony_id == ceremonies.id
WHERE ceremonies.year == 2010 AND nominations.won == 1
;
    -- 
SELECT ceremonies.year, cereminies.host, nominations.movie, nominations.nominee
FROM nominations
INNER JOIN ceremonies
ON nominations.ceremony_id == ceremonies.id
WHERE ceremonies.year == 2010 AND nominations.won == 1 
;
    -- tous les film pour lesquels l'actrice Natalie Portman fut nominée pour un oscar en indiquant l'année. 
SELECT nominations.nominee, ceremonies.year 
FROM nominations
INNER JOIN ceremonies
ON nominations.ceremony_id == ceremonies.id
WHERE nominations.nominee == 'Natalie Portman'
;
-- many_to_many
    -- Créer une join table ou table intermédiaire
CREATE TABLE movies_actors(
    id INTEGER PRIMARY KEY, 
    movie_id INTEGER REFERENCES movies(id),
    actor_id INTEGER REFERENCES actors(id)
);

    -- Requete sql pour une relation many_to_many
    -- les acteurs de film invictus 
SELECT actors.actor
FROM movies
INNER join movies_actors
ON movies.id == movies_actors.movie_id
INNER JOIN actors 
ON movies_actors.actor_id == actors.id
WHERE movies.movie == 'invictus'
;
    -- tous les films dans lesquels 'natalie portman' a joué
SELECT movies.movie
FROM movies
INNER JOIN movies_actors ON movies.id == movies_actors.movie_id
INNER JOIN actors ON movies_actors.actor_id == actors.id 
WHERE actors.actor == 'Natalie Portman'
