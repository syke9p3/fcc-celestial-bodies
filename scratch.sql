-- have name
-- at least3 rows
-- at least 3 columns
-- one UNIQUE column


-- 1. Fix connection

sudo cp ./.freeCodeCamp/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
sudo chown -R postgres:postgres /var/lib/postgresql/12/main
sudo service postgresql restart
echo "SELECT 'CREATE USER freecodecamp WITH CREATEDB' WHERE NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname='freecodecamp')\gexec" | psql -U postgres -X

-- 2. Connect to postgresql 
psql --username=freecodecamp --dbname=univverse

-- 3. Create database 
CREATE DATABASE universe;

-- 4. Connect to database 
\c universe

-- 5. Create tables with columns 
CREATE TABLE galaxy (galaxy_id SERIAL PRIMARY KEY NOT NULL, description TEXT UNIQUE NOT NULL, name character varying(255) NOT NULL, distance_from_earth FLOAT, type varchar(30));

CREATE TABLE planet (planet_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL, description text UNIQUE NOT NULL, mass FLOAT, radius NUMERIC(20, 2), has_water boolean, has_life boolean);

CREATE TABLE star (star_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL, description TEXT UNIQUE NOT NULL, age integer, distance_from_earth FLOAT, color VARCHAR(30));

CREATE TABLE moon (moon_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL, description TEXT UNIQUE NOT NULL, age INT,  distance_from_earth FLOAT);

CREATE TABLE astronomer (astronomer_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL, email VARCHAR(255) UNIQUE, country VARCHAR(255) NOT NULL, notable_for TEXT);


-- 6. Create add foreign keys 
ALTER TABLE star ADD COLUMN galaxy_id INT; ALTER TABLE star ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id); ALTER TABLE planet ADD COLUMN star_id INT; ALTER TABLE planet ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES star(star_id); ALTER TABLE moon ADD COLUMN planet_id INT; ALTER TABLE moon ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES planet(planet_id);


-- 6. Seed tables
INSERT INTO galaxy(name, description,  distance_from_earth, type) VALUES ('Milky Way', 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 0, 'barred spiral'), ('Andromeda', 'The Andromeda Galaxy is one of the few visible to the unaided eye, appearing as a milky blur. It is located about 2,480,000 light-years from Earth; its diameter is approximately 200,000 light-years; and it shares various characteristics with the Milky Way system.', 2.537, 'barred spiral') , ('Black Eye', 'Easily identified by the spectacular band of absorbing dust partially obscuring its bright nucleus, Messier 64, or the Black Eye Galaxy, is characterized by its bizarre internal motion. The gas in the outer regions of this remarkable galaxy is rotating in the opposite direction from the gas and stars in its inner regions. This strange behavior can be attributed to a merger between M64 and a satellite galaxy over a billion years ago.', 17.29, 'spiral'); INSERT INTO galaxy(name, description, type) VALUES ('Bode''s', 't is a spiral galaxy about 12 million light-years away, in the constellation Ursa Major. It was discovered by Johann Elert Bode on December 31, 1774.', 'spiral'), ('Cartwheel', 'It is a lenticular galaxy and ring galaxy about 500 million light-years away in the constellation Sculptor. It looks like a cartwheel that''s why astronomers called it a ''Cartwheel''.', 'lenticular'), ('Cigar', 'It is a starburst galaxy approximately 12 million light-years away in the constellation Ursa Major.', 'starburst');

INSERT INTO star(name, description, age, distance_from_earth, color, galaxy_id) VALUES ('Sun', 'The Sun is the star at the center of the Solar System. It is a massive, nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy from its surface mainly as visible light and infrared radiation with 10% at ultraviolet energies. It is by far the most important source of energy for life on Earth. The Sun has been an object of veneration in many cultures. It has been a central subject for astronomical research since antiquity.', 4600, 149600000, 'Yellow', 1); INSERT INTO star(name, description) VALUES  ('Betelgeuse', 'Pronounced "Beetle-juice" (yes, the same as the 1988 Tim Burton movie), this bright red supergiant is roughly 65o light-year from Earth. Also known as Alpha Orionis, it is nevertheless easy to spot in the Orion constellation since it is one of the largest and most luminous stars in the night sky.'), ('Rigel', 'Also known as Beta Orionis, and located between 700 and 900 light years away, Rigel is the brightest star in the constellation Orion and the seventh brightest star in the night sky. Here too, what appears to be a blue supergiant is actually a multistar system. The primary star (Rigel A) is a blue-white supergiant that is 21 times more massive than our sun, and shines with approximately 120,000 times the luminosity.'), ('Vega', 'Vega is another bright blue star that anchors the otherwise faint Lyra constellation (the Harp). Along with Deneb (from Cygnus) and Altair (from Aquila), it is a part of the Summer Triangle in the Northern hemisphere. It is also the brightest star in the constellation Lyra, the fifth brightest star in the night sky and the second brightest star in the northern celestial hemisphere (after Arcturus).'), ('Polaris', 'Also known as the North Star (as well as the Pole Star, Lodestar, and sometimes Guiding Star), Polaris is the 45th brightest star in the night sky. It is very close to the north celestial pole, which is why it has been used as a navigational tool in the northern hemisphere for centuries. Scientifically speaking, this star is known as Alpha Ursae Minoris because it is the alpha star in the constellation Ursa Minor (the Little Bear).'), ('Sirius', 'Also known as the Dog Star, because it''s the brightest star in Canis Major (the "Big Dog"), Sirius is also the brightest star in the night sky. The name "Sirius" is derived from the Ancient Greek "Seirios", which translates to "glowing" or "scorcher". Whereas it appears to be a single bright star to the naked eye, Sirius is actually a binary star system, consisting of a white main-sequence star named Sirius A, and a faint white dwarf companion named Sirius B.');



INSERT INTO planet(name, description, mass, has_water, has_life, star_id) VALUES ('Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', 5.972168e+24, true, true, 1);

INSERT INTO planet(name, description, mass, has_water, has_life, star_id) VALUES ('Mercury', 'Mercury is the closest planet to the Sun, and the smallest planet in our solar system - only slightly larger than Earth''s Moon.', 3.285e+23, false, false, 1), ('Venus', 'Venus is the second planet from the Sun, and the sixth largest planet. It''s the hottest planet in our solar system.', 4.867e+24, false, false, 1), ('Mars', 'Mars – the fourth planet from the Sun – is a dusty, cold, desert world with a very thin atmosphere. This dynamic planet has seasons, polar ice caps, extinct volcanoes, canyons and weather.', 6.39e+23, false, false, 1), ('Jupiter', 'Jupiter is a world of extremes. It''s the largest planet in our solar system. If Jupiter was a hollow shell, 1,000 Earths could fit inside. Jupiter also is the oldest planet, forming from the dust and gases left over from the Sun''s formation 4.5 billion years ago.', 1.89813e+27, false, false, 1), ('Saturn', 'Saturn is a massive ball made mostly of hydrogen and helium. The farthest planet from Earth discovered by the unaided human eye, Saturn has been known since ancient times. The planet is named for the Roman god of agriculture and wealth, who was also the father of Jupiter.', 5.6834e+26, false, false, 1), ('Uranus', 'Uranus is a very cold and windy planet. It is surrounded by faint rings, and more than two dozen small moons as it rotates at a nearly 90-degree angle from the plane of its orbit. This unique tilt makes Uranus appear to spin on its side.', 8.681e+25, false, false, 1), ('Neptune', 'Dark, cold and whipped by supersonic winds, giant Neptune is the eighth and most distant major planet orbiting our Sun. More than 30 times as far from the Sun as Earth, Neptune is not visible to the naked eye.', 1.024e+26, false, false, 1), ('PA-99-N2', 'A team of scientists has used gravitational microlensing to come up with a tentative detection of an extragalactic exoplanet in Andromeda, the Milky Way''s nearest large galactic neighbor. The lensing pattern fits a star with a smaller companion, PA-99-N2, weighing just around 6.34 times the mass of Jupiter. This suspected planet is the first announced in the Andromeda Galaxy.', 1.20341442e+28, false, false, 2);

INSERT INTO planet(name, description, has_water, has_life, star_id) VALUES ('Tugn', 'Rigel I is a class D Planetoid that barley classifies as a true planet. It resides on the inner side of the Hakiel Belt and is one of the most inhospitable places in the known galaxy. It is not dissimilar to the Terran Jovian Moon IO, being constantly stretched by Rigel A''s massive Gravitational forces. Its surface is the consistency of molten mercury, supporting no life or structures, despite Rigel''s long history.', false, false, 3), ('Atugn', 'Rigel''s II is a class K dust ball, barley terraformed enough to support life within it''s limited gravity outside of enclosed colony sites. Unlike Rigel''s III and IV which are class M words, collectively they are often referred to as the Rigel Colonies when they were settled by early Terran explorers more then almost 300 years ago. Their Native names are Atugn (Rigel II) Volumn (Rigel III) and Valosm (Rigel IV) and Supports a Combined Population of over 16 Billion people, and are Major Federation worlds.', false, false, 3), ('Volumn', '"Chelar," the native term for Rigel III, means "deep place" or "the pit." Chelar is 700 million square miles of wetlands, jungle, and smoking volcanoes. She''s as ancient and storied as any rock warmed by Rigel, but her secrets are well hidden. To know Chelar is to be drawn down into the hot muck of the pit, to lose yourself in the deep place.', false, false, 3);


INSERT INTO moon(name, description, age, distance_from_earth, planet_id) VALUES ('Moon', 'The Moon is Earth''s only natural satellite. It orbits at an average distance of 384,400 km (238,900 mi), about 30 times the diameter of Earth.', 4460, 384400, 1);

INSERT INTO moon(name, description, planet_id) VALUES ('Phobos', 'Phobos is the larger of Mars'' two moons and is 17 x 14 x 11 miles (27 by 22 by 18 kilometers) in diameter. It orbits Mars three times a day, and is so close to the planet''s surface that in some locations on Mars it cannot always be seen.', 9), ('Deimos', 'Like Phobos, Deimos is a small and lumpy, heavily cratered object. Its craters are generally smaller than 1.6 miles (2.5 kilometers) in diameter, however, and it lacks the grooves and ridges seen on Phobos. When impacted, dust and debris will leave the surface of the moon because it doesn''t have enough gravitational pull to retain the ejecta. However, the gravity from Mars will keep a ring of this debris around the planet in approximately the same region that the moon orbits. As the moon revolves, the debris is redeposited as a dusty layer on its surface.', 9);

INSERT INTO moon(name, description, planet_id) VALUES ( 'Ganymede','Ganymede is Jupiter''s largest moon, and the largest moon in our solar system. It''s even bigger than Mercury, and Pluto.', 5), ('Callisto', 'Callisto is Jupiter''s second largest moon and the third largest moon in our solar system.', 5), ('Io', 'Io is Jupiter''s third largest moon, and the most volcanically active world in our solar system.', 5), ('Europa', 'Europa is Jupiter''s fourth largest moon. It''s about 90% the size of Earth''s Moon.', 5);

INSERT INTO moon(name, description, planet_id) VALUES ('Mimas', 'Less than 123 miles (198 kilometers) in mean radius, crater-covered Mimas is the smallest and innermost of Saturn''s major moons. It is not quite big enough to hold a round shape, so it is somewhat ovoid with dimensions of 129 x 122 x 119 miles (207 x 197 x 191 kilometers, respectively). Its low density suggests that it consists almost entirely of water ice, which is the only substance ever detected on Mimas.', 6), ('Enceladus', 'Saturn''s moon Enceladus is a small, icy world that has geyser-like jets spewing water vapor and ice particles into space.', 6), ('Tethys', 'Tethys is Saturn''s fifth largest moon. Its irregular shape is 331 miles (533 kilometers) in mean radius, with dimensions 669 x 657 x 654 miles (1076.8 x 1057.4 x 1052.6 kilometers). This cold, airless and heavily scarred body is very similar to sister moons Dione and Rhea except that Tethys is not as heavily cratered as the other two. This may be because its proximity to Saturn causes more tidal warming, and that warming kept Tethys partially molten longer, erasing or dulling more of the early terrain.', 6), ('Dione', 'Dione is a small moon of 349 miles (562 km) in mean radius orbiting Saturn every 2.7 days at a distance of 234,500 miles (377,400 km), which is roughly the same distance that our Moon orbits Earth.', 6), ('Miranda', 'Like Frankenstein''s monster, Miranda looks like it was pieced together from parts that didn''t quite merge properly. At about 500 km in diameter, it''s only one-seventh as large as Earth''s moon, a size that seems unlikely to support much tectonic activity.', 7),  ('Ariel', 'Ariel''s surface appears to be the youngest of all the moons of Uranus. It has few large craters and many small ones, indicating that fairly recent low-impact collisions wiped out the large craters that would have been left by much earlier, bigger strikes. Ariel is also thought to have had the most recent geologic activity of Uranus'' larger moons. It is transected by grabens, which are fault-bounded valleys.', 7), ('Umbriel', 'Umbriel is the darkest of Uranus'' largest moons. It reflects only 16 percent of the light that strikes its surface, a feature similar to the highland areas of Earth''s Moon. Other Uranian moons are much brighter. The process by which Umbriel''s ancient cratered surface was darkened remains a mystery.', 7), ('Titania', 'Titania is Uranus'' largest moon. Images taken by Voyager 2 almost 200 years after Titania''s discovery revealed signs that the moon was geologically active.', 7), ('Oberon', 'Oberon is the second largest moon of Uranus. Discovered in 1787, little was known about this moon until Voyager 2 passed it during its flyby of Uranus in January 1986. Oberon is heavily cratered―similar to Umbriel―especially when compared to three other moons of Uranus: Ariel, Titania and Miranda. Like all of Uranus'' large moons, Oberon is composed of roughly half ice and half rock. Oberon has at least one large mountain that rises about 6 km off the surface.', 7);

INSERT INTO moon(name, description, planet_id) VALUES 
('Triton', 'Triton is the largest natural satellite of the planet Neptune. It is the only moon of Neptune massive enough to be rounded under its own gravity and hosts a thin but well-structured atmosphere. Triton orbits Neptune in a retrograde orbit— revolving in the opposite direction to the parent planet''s rotation — the only large moon in the Solar System to do so.', 8),
('Despina', 'Despina is a tiny moon, measuring only 148 kilometers in diameter, and is irregularly shaped, with a heavily cratered surface and an elongated, distorted shape.', 8),
('Galatea', 'Galatea is a small moon of Neptune. It is one of Neptune''s inner moons and is the third closest moon to orbit the planet. Galatea has a diameter of approximately 175 kilometres (109 miles). It orbits Neptune at a distance of just over 61,500 kilometres (38,300 miles). A length of an orbit takes only 10 hours which means that it orbits Neptune faster than the planet spins.', 8),
('Halimede', 'Halimede is an outer irregular, retrograde moon of Neptune. It could be a captured asteroid or a fragment of the moon Nereid. Its diameter is around 60 km. It appears neutral grey in color and is made of water ice with some impurities. Not much is known about Halimede, except that it orbits Neptune in a highly inclined plain, retrograde and with an elliptical orbit. Being so small, it cannot be spherical. Also, it is not tidal locked. Given its small size, there is a high chance that it has a chaotic rotation.', 8);



INSERT INTO astronomer(name, country, notable_for) VALUES ('Johannes Kepler', 'Denmark',  'Best known for his laws of planetary motion, and his books Astronomia nova, Harmonice Mundi, and Epitome Astronomiae Copernicanae, influencing among others Isaac Newton, providing one of the foundations for his theory of universal gravitation.'), ('Nicolaus Copernicus', 'Poland',  'Heliocentric theory - a model of the universe that placed the Sun rather than Earth at its center'), ('Christiaan Huygens', 'Netherlands',  'His improvements on the telescope allowed him to make the first observations of Saturn''s rings and to discover its largest moon, Titan.');

-- 6. Confirm
SELECT galaxy_id, name FROM galaxy;
SELECT name, age, distance_from_earth, color, galaxy_id FROM star;
SELECT planet_id, name, mass, radius, has_water, has_life, star_id FROM planet;
SELECT name, age, distance_from_earth, planet_id FROM moon;

-- count for each table
SELECT table_name, (SELECT n_live_tup FROM pg_stat_user_tables WHERE relname = table_name) AS row_count
FROM information_schema.tables
WHERE table_schema = 'public';

-- https://tembo.io/docs/getting-started/postgres_guides/postgres-basics/row-count


-- 7. Update

UPDATE galaxy SET type='barred spiral' WHERE name='Milky Way'; 
UPDATE planet SET has_water=true WHERE name='Mars'; 
UPDATE planet SET star_id=2 WHERE planet_id=9; 
UPDATE star SET galaxy_id=1; 



