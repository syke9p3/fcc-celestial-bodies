--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255),
    country character varying(255) NOT NULL,
    notable_for text
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth double precision,
    type character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    age integer,
    distance_from_earth double precision,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    mass double precision,
    has_water boolean,
    has_life boolean,
    star_id integer,
    radius numeric(20,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    age integer,
    distance_from_earth double precision,
    color character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Johannes Kepler', NULL, '', 'Best known for his laws of planetary motion, and his books Astronomia nova, Harmonice Mundi, and Epitome Astronomiae Copernicanae, influencing among others Isaac Newton, providing one of the foundations for his theory of universal gravitation.');
INSERT INTO public.astronomer VALUES (2, 'Nicolaus Copernicus', NULL, 'Poland', 'Heliocentric theory - a model of the universe that placed the Sun rather than Earth at its center');
INSERT INTO public.astronomer VALUES (3, 'Christiaan Huygens', NULL, 'Netherlands', 'His improvements on the telescope allowed him to make the first observations of Saturn''s rings and to discover its largest moon, Titan.');
INSERT INTO public.astronomer VALUES (4, 'Johannes Kepler', NULL, '', 'Best known for his laws of planetary motion, and his books Astronomia nova, Harmonice Mundi, and Epitome Astronomiae Copernicanae, influencing among others Isaac Newton, providing one of the foundations for his theory of universal gravitation.');
INSERT INTO public.astronomer VALUES (5, 'Nicolaus Copernicus', NULL, 'Poland', 'Heliocentric theory - a model of the universe that placed the Sun rather than Earth at its center');
INSERT INTO public.astronomer VALUES (6, 'Christiaan Huygens', NULL, 'Netherlands', 'His improvements on the telescope allowed him to make the first observations of Saturn''s rings and to discover its largest moon, Titan.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 'Milky Way', 0, 'barred spiral');
INSERT INTO public.galaxy VALUES (2, 'The Andromeda Galaxy is one of the few visible to the unaided eye, appearing as a milky blur. It is located about 2,480,000 light-years from Earth; its diameter is approximately 200,000 light-years; and it shares various characteristics with the Milky Way system.', 'Andromeda', 2.537, 'barred spiral');
INSERT INTO public.galaxy VALUES (3, 'Easily identified by the spectacular band of absorbing dust partially obscuring its bright nucleus, Messier 64, or the Black Eye Galaxy, is characterized by its bizarre internal motion. The gas in the outer regions of this remarkable galaxy is rotating in the opposite direction from the gas and stars in its inner regions. This strange behavior can be attributed to a merger between M64 and a satellite galaxy over a billion years ago.', 'Black Eye', 17.29, 'spiral');
INSERT INTO public.galaxy VALUES (4, 't is a spiral galaxy about 12 million light-years away, in the constellation Ursa Major. It was discovered by Johann Elert Bode on December 31, 1774.', 'Bode''s', NULL, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'It is a lenticular galaxy and ring galaxy about 500 million light-years away in the constellation Sculptor. It looks like a cartwheel that''s why astronomers called it a ''Cartwheel''.', 'Cartwheel', NULL, 'lenticular');
INSERT INTO public.galaxy VALUES (6, 'It is a starburst galaxy approximately 12 million light-years away in the constellation Ursa Major.', 'Cigar', NULL, 'starburst');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 'Phobos is the larger of Mars'' two moons and is 17 x 14 x 11 miles (27 by 22 by 18 kilometers) in diameter. It orbits Mars three times a day, and is so close to the planet''s surface that in some locations on Mars it cannot always be seen.', NULL, NULL, 9);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Like Phobos, Deimos is a small and lumpy, heavily cratered object. Its craters are generally smaller than 1.6 miles (2.5 kilometers) in diameter, however, and it lacks the grooves and ridges seen on Phobos. When impacted, dust and debris will leave the surface of the moon because it doesn''t have enough gravitational pull to retain the ejecta. However, the gravity from Mars will keep a ring of this debris around the planet in approximately the same region that the moon orbits. As the moon revolves, the debris is redeposited as a dusty layer on its surface.', NULL, NULL, 9);
INSERT INTO public.moon VALUES (3, 'Moon', 'The Moon is Earth''s only natural satellite. It orbits at an average distance of 384,400 km (238,900 mi), about 30 times the diameter of Earth.', 4460, 384400, 1);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Ganymede is Jupiter''s largest moon, and the largest moon in our solar system. It''s even bigger than Mercury, and Pluto.', NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Callisto is Jupiter''s second largest moon and the third largest moon in our solar system.', NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Io is Jupiter''s third largest moon, and the most volcanically active world in our solar system.', NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Europa is Jupiter''s fourth largest moon. It''s about 90% the size of Earth''s Moon.', NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Less than 123 miles (198 kilometers) in mean radius, crater-covered Mimas is the smallest and innermost of Saturn''s major moons. It is not quite big enough to hold a round shape, so it is somewhat ovoid with dimensions of 129 x 122 x 119 miles (207 x 197 x 191 kilometers, respectively). Its low density suggests that it consists almost entirely of water ice, which is the only substance ever detected on Mimas.', NULL, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn''s moon Enceladus is a small, icy world that has geyser-like jets spewing water vapor and ice particles into space.', NULL, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 'Tethys is Saturn''s fifth largest moon. Its irregular shape is 331 miles (533 kilometers) in mean radius, with dimensions 669 x 657 x 654 miles (1076.8 x 1057.4 x 1052.6 kilometers). This cold, airless and heavily scarred body is very similar to sister moons Dione and Rhea except that Tethys is not as heavily cratered as the other two. This may be because its proximity to Saturn causes more tidal warming, and that warming kept Tethys partially molten longer, erasing or dulling more of the early terrain.', NULL, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'Dione is a small moon of 349 miles (562 km) in mean radius orbiting Saturn every 2.7 days at a distance of 234,500 miles (377,400 km), which is roughly the same distance that our Moon orbits Earth.', NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Miranda', 'Like Frankenstein''s monster, Miranda looks like it was pieced together from parts that didn''t quite merge properly. At about 500 km in diameter, it''s only one-seventh as large as Earth''s moon, a size that seems unlikely to support much tectonic activity.', NULL, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Ariel', 'Ariel''s surface appears to be the youngest of all the moons of Uranus. It has few large craters and many small ones, indicating that fairly recent low-impact collisions wiped out the large craters that would have been left by much earlier, bigger strikes. Ariel is also thought to have had the most recent geologic activity of Uranus'' larger moons. It is transected by grabens, which are fault-bounded valleys.', NULL, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 'Umbriel is the darkest of Uranus'' largest moons. It reflects only 16 percent of the light that strikes its surface, a feature similar to the highland areas of Earth''s Moon. Other Uranian moons are much brighter. The process by which Umbriel''s ancient cratered surface was darkened remains a mystery.', NULL, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Titania', 'Titania is Uranus'' largest moon. Images taken by Voyager 2 almost 200 years after Titania''s discovery revealed signs that the moon was geologically active.', NULL, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 'Oberon is the second largest moon of Uranus. Discovered in 1787, little was known about this moon until Voyager 2 passed it during its flyby of Uranus in January 1986. Oberon is heavily cratered―similar to Umbriel―especially when compared to three other moons of Uranus: Ariel, Titania and Miranda. Like all of Uranus'' large moons, Oberon is composed of roughly half ice and half rock. Oberon has at least one large mountain that rises about 6 km off the surface.', NULL, NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 'Mercury is the closest planet to the Sun, and the smallest planet in our solar system - only slightly larger than Earth''s Moon.', 3.285e+23, false, false, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 'Venus is the second planet from the Sun, and the sixth largest planet. It''s the hottest planet in our solar system.', 4.867e+24, false, false, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is a world of extremes. It''s the largest planet in our solar system. If Jupiter was a hollow shell, 1,000 Earths could fit inside. Jupiter also is the oldest planet, forming from the dust and gases left over from the Sun''s formation 4.5 billion years ago.', 1.89813e+27, false, false, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is a massive ball made mostly of hydrogen and helium. The farthest planet from Earth discovered by the unaided human eye, Saturn has been known since ancient times. The planet is named for the Roman god of agriculture and wealth, who was also the father of Jupiter.', 5.6834e+26, false, false, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus is a very cold and windy planet. It is surrounded by faint rings, and more than two dozen small moons as it rotates at a nearly 90-degree angle from the plane of its orbit. This unique tilt makes Uranus appear to spin on its side.', 8.681e+25, false, false, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Dark, cold and whipped by supersonic winds, giant Neptune is the eighth and most distant major planet orbiting our Sun. More than 30 times as far from the Sun as Earth, Neptune is not visible to the naked eye.', 1.0239999999999999e+26, false, false, 1, NULL);
INSERT INTO public.planet VALUES (1, 'Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', 5.972168e+24, true, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars – the fourth planet from the Sun – is a dusty, cold, desert world with a very thin atmosphere. This dynamic planet has seasons, polar ice caps, extinct volcanoes, canyons and weather.', 6.39e+23, true, false, 1, NULL);
INSERT INTO public.planet VALUES (9, 'PA-99-N2', 'A team of scientists has used gravitational microlensing to come up with a tentative detection of an extragalactic exoplanet in Andromeda, the Milky Way''s nearest large galactic neighbor. The lensing pattern fits a star with a smaller companion, PA-99-N2, weighing just around 6.34 times the mass of Jupiter. This suspected planet is the first announced in the Andromeda Galaxy.', 1.20341442e+28, false, false, 2, NULL);
INSERT INTO public.planet VALUES (12, 'Tugn', 'Rigel I is a class D Planetoid that barley classifies as a true planet. It resides on the inner side of the Hakiel Belt and is one of the most inhospitable places in the known galaxy. It is not dissimilar to the Terran Jovian Moon IO, being constantly stretched by Rigel A''s massive Gravitational forces. Its surface is the consistency of molten mercury, supporting no life or structures, despite Rigel''s long history.', NULL, false, false, 3, NULL);
INSERT INTO public.planet VALUES (13, 'Atugn', 'Rigel''s II is a class K dust ball, barley terraformed enough to support life within it''s limited gravity outside of enclosed colony sites. Unlike Rigel''s III and IV which are class M words, collectively they are often referred to as the Rigel Colonies when they were settled by early Terran explorers more then almost 300 years ago. Their Native names are Atugn (Rigel II) Volumn (Rigel III) and Valosm (Rigel IV) and Supports a Combined Population of over 16 Billion people, and are Major Federation worlds.', NULL, false, false, 3, NULL);
INSERT INTO public.planet VALUES (14, 'Volumn', '"Chelar," the native term for Rigel III, means "deep place" or "the pit." Chelar is 700 million square miles of wetlands, jungle, and smoking volcanoes. She''s as ancient and storied as any rock warmed by Rigel, but her secrets are well hidden. To know Chelar is to be drawn down into the hot muck of the pit, to lose yourself in the deep place.', NULL, false, false, 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the center of the Solar System. It is a massive, nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy from its surface mainly as visible light and infrared radiation with 10% at ultraviolet energies. It is by far the most important source of energy for life on Earth. The Sun has been an object of veneration in many cultures. It has been a central subject for astronomical research since antiquity.', 4600, 149600000, 'Yellow', 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Pronounced "Beetle-juice" (yes, the same as the 1988 Tim Burton movie), this bright red supergiant is roughly 65o light-year from Earth. Also known as Alpha Orionis, it is nevertheless easy to spot in the Orion constellation since it is one of the largest and most luminous stars in the night sky.', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Rigel', 'Also known as Beta Orionis, and located between 700 and 900 light years away, Rigel is the brightest star in the constellation Orion and the seventh brightest star in the night sky. Here too, what appears to be a blue supergiant is actually a multistar system. The primary star (Rigel A) is a blue-white supergiant that is 21 times more massive than our sun, and shines with approximately 120,000 times the luminosity.', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'Vega is another bright blue star that anchors the otherwise faint Lyra constellation (the Harp). Along with Deneb (from Cygnus) and Altair (from Aquila), it is a part of the Summer Triangle in the Northern hemisphere. It is also the brightest star in the constellation Lyra, the fifth brightest star in the night sky and the second brightest star in the northern celestial hemisphere (after Arcturus).', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'Polaris', 'Also known as the North Star (as well as the Pole Star, Lodestar, and sometimes Guiding Star), Polaris is the 45th brightest star in the night sky. It is very close to the north celestial pole, which is why it has been used as a navigational tool in the northern hemisphere for centuries. Scientifically speaking, this star is known as Alpha Ursae Minoris because it is the alpha star in the constellation Ursa Minor (the Little Bear).', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'Sirius', 'Also known as the Dog Star, because it''s the brightest star in Canis Major (the "Big Dog"), Sirius is also the brightest star in the night sky. The name "Sirius" is derived from the Ancient Greek "Seirios", which translates to "glowing" or "scorcher". Whereas it appears to be a single bright star to the naked eye, Sirius is actually a binary star system, consisting of a white main-sequence star named Sirius A, and a faint white dwarf companion named Sirius B.', NULL, NULL, NULL, 1);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 17, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronomer astronomer_email_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_email_key UNIQUE (email);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

