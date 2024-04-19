-- 删除现有表，以便每次运行此脚本时都能重新开始。
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Studios;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS MovieActors;

-- 根据您的领域模型创建新表
CREATE TABLE Studios (
    studio_id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE Movies (
    movie_id INTEGER PRIMARY KEY,
    title TEXT,
    year_released INTEGER,
    mpaa_rating TEXT,
    studio_id INTEGER,
    FOREIGN KEY (studio_id) REFERENCES Studios(studio_id)
);

CREATE TABLE Actors (
    actor_id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE MovieActors (
    movie_id INTEGER,
    actor_id INTEGER,
    character_name TEXT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

-- 插入反映示例数据的数据到数据库中
INSERT INTO Studios (studio_id, name) VALUES 
    (1, 'Warner Bros.');

INSERT INTO Movies (movie_id, title, year_released, mpaa_rating, studio_id) VALUES 
    (1, 'Batman Begins', 2005, 'PG-13', 1),
    (2, 'The Dark Knight', 2008, 'PG-13', 1),
    (3, 'The Dark Knight Rises', 2012, 'PG-13', 1);

INSERT INTO Actors (actor_id, name) VALUES
    (1, 'Christian Bale'),
    (2, 'Michael Caine'),
    (3, 'Liam Neeson'),
    (4, 'Katie Holmes'),
    (5, 'Gary Oldman'),
    (6, 'Heath Ledger'),
    (7, 'Aaron Eckhart'),
    (8, 'Maggie Gyllenhaal'),
    (9, 'Tom Hardy'),
    (10, 'Joseph Gordon-Levitt'),
    (11, 'Anne Hathaway');

INSERT INTO MovieActors (movie_id, actor_id, character_name) VALUES
    -- 蝙蝠侠：侠影之谜
    (1, 1, 'Bruce Wayne'),
    (1, 2, 'Alfred'),
    (1, 3, 'Ra''s Al Ghul'),
    (1, 4, 'Rachel Dawes'),
    (1, 5, 'Commissioner Gordon'),
    -- 黑暗骑士
    (2, 1, 'Bruce Wayne'),
    (2, 6, 'Joker'),
    (2, 7, 'Harvey Dent'),
    (2, 2, 'Alfred'),
    (2, 8, 'Rachel Dawes'),
    -- 黑暗骑士：黎明之战
    (3, 1, 'Bruce Wayne'),
    (3, 5, 'Commissioner Gordon'),
    (3, 9, 'Bane'),
    (3, 10, 'John Blake'),
    (3, 11, 'Selina Kyle');

-- 打印电影输出的标题
.print "Movies"
.print "======"
.print ""

-- 用于电影输出的SQL语句
SELECT title, year_released, mpaa_rating, name AS studio_name
FROM Movies
JOIN Studios ON Movies.studio_id = Studios.studio_id;

-- 打印演员表输出的标题
.print ""
.print "Top Cast"
.print "========"
.print ""

-- 用于演员表输出的SQL语句
SELECT Movies.title, Actors.name AS actor_name, MovieActors.character_name
FROM Movies
JOIN MovieActors ON Movies.movie_id = MovieActors.movie_id
JOIN Actors ON MovieActors.actor_id = Actors.actor_id;

