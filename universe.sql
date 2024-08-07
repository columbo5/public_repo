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
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(60) NOT NULL,
    atomic_mass integer NOT NULL,
    is_metal boolean
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.element_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_element_id_seq OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.element_element_id_seq OWNED BY public.element.element_id;


--
-- Name: element_on_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element_on_planet (
    element_id integer NOT NULL,
    planet_id integer NOT NULL,
    percentage numeric(3,1) NOT NULL,
    name character varying(60),
    element_on_planet_id integer NOT NULL
);


ALTER TABLE public.element_on_planet OWNER TO freecodecamp;

--
-- Name: element_on_planet_element_on_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.element_on_planet_element_on_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_on_planet_element_on_planet_id_seq OWNER TO freecodecamp;

--
-- Name: element_on_planet_element_on_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.element_on_planet_element_on_planet_id_seq OWNED BY public.element_on_planet.element_on_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    weight_in_tons integer,
    travel_direction text,
    has_flamingos boolean NOT NULL
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
    name character varying(60) NOT NULL,
    planet_id integer,
    number_of_flamingos integer NOT NULL,
    rotation_direction character varying(60)
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
    name character varying(60) NOT NULL,
    star_id integer,
    has_moon boolean,
    inhabits_flamingos boolean NOT NULL
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
    name character varying(60) NOT NULL,
    galaxy_id integer,
    brightness_in_lumen integer,
    contains_flamingos boolean NOT NULL
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
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.element_element_id_seq'::regclass);


--
-- Name: element_on_planet element_on_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element_on_planet ALTER COLUMN element_on_planet_id SET DEFAULT nextval('public.element_on_planet_element_on_planet_id_seq'::regclass);


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
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element VALUES (1, 'Hydrogen', 1, false);
INSERT INTO public.element VALUES (2, 'Helium', 2, false);
INSERT INTO public.element VALUES (3, 'Iron', 55, true);


--
-- Data for Name: element_on_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element_on_planet VALUES (1, 1, 99.0, NULL, 1);
INSERT INTO public.element_on_planet VALUES (3, 1, 1.0, NULL, 2);
INSERT INTO public.element_on_planet VALUES (1, 6, 80.0, NULL, 3);
INSERT INTO public.element_on_planet VALUES (2, 6, 20.0, NULL, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'First galaxy', 4123511, 'E', false);
INSERT INTO public.galaxy VALUES (2, 'Second galaxy', 2, 'N', false);
INSERT INTO public.galaxy VALUES (3, 'Third galaxy', 12323144, 'SW', true);
INSERT INTO public.galaxy VALUES (4, 'Fourth galaxy', 12432, 'S', false);
INSERT INTO public.galaxy VALUES (5, 'Fifth galaxy', 4, 'SE', true);
INSERT INTO public.galaxy VALUES (6, 'Andy', 42, 'W', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 1, 0, 'left');
INSERT INTO public.moon VALUES (2, 'Moon2', 1, 0, 'left');
INSERT INTO public.moon VALUES (3, 'Moon3', 1, 0, 'left');
INSERT INTO public.moon VALUES (4, 'Moon4', 2, 0, 'left');
INSERT INTO public.moon VALUES (5, 'Moon5', 2, 0, 'left');
INSERT INTO public.moon VALUES (6, 'Moon6', 3, 513251235, 'left');
INSERT INTO public.moon VALUES (7, 'Moon7', 3, 0, 'left');
INSERT INTO public.moon VALUES (8, 'Moon8', 3, 0, 'left');
INSERT INTO public.moon VALUES (9, 'Moon9', 4, 0, 'left');
INSERT INTO public.moon VALUES (10, 'Moon10', 4, 0, 'left');
INSERT INTO public.moon VALUES (11, 'Moon11', 4, 0, 'left');
INSERT INTO public.moon VALUES (12, 'Moon12', 5, 2, 'right');
INSERT INTO public.moon VALUES (13, 'Moon13', 5, 0, 'right');
INSERT INTO public.moon VALUES (14, 'Moon14', 5, 0, 'right');
INSERT INTO public.moon VALUES (15, 'Moon15', 6, 0, 'right');
INSERT INTO public.moon VALUES (16, 'Moon16', 6, 0, 'right');
INSERT INTO public.moon VALUES (17, 'Moon17', 6, 0, 'right');
INSERT INTO public.moon VALUES (18, 'Moon18', 7, 0, 'right');
INSERT INTO public.moon VALUES (19, 'Moon19', 7, 0, 'right');
INSERT INTO public.moon VALUES (20, 'Moon20', 8, 42, 'right');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Star1', 1, true, false);
INSERT INTO public.planet VALUES (2, 'Star2', 1, true, false);
INSERT INTO public.planet VALUES (3, 'Star3', 2, false, false);
INSERT INTO public.planet VALUES (4, 'Star4', 2, true, true);
INSERT INTO public.planet VALUES (5, 'Star5', 3, false, false);
INSERT INTO public.planet VALUES (6, 'Star6', 3, false, true);
INSERT INTO public.planet VALUES (7, 'Star7', 4, false, true);
INSERT INTO public.planet VALUES (8, 'Star8', 4, true, false);
INSERT INTO public.planet VALUES (9, 'Star9', 5, true, true);
INSERT INTO public.planet VALUES (10, 'Star10', 5, false, false);
INSERT INTO public.planet VALUES (11, 'Star11', 6, true, false);
INSERT INTO public.planet VALUES (12, 'Goyle', 6, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Planet1', 1, 1234, false);
INSERT INTO public.star VALUES (2, 'Planet2', 2, 4444444, true);
INSERT INTO public.star VALUES (3, 'Planet3', 3, 1212, false);
INSERT INTO public.star VALUES (4, 'Planet4', 4, 89124019, false);
INSERT INTO public.star VALUES (5, 'Planet5', 5, 9999, true);
INSERT INTO public.star VALUES (6, 'George', 6, 2, false);


--
-- Name: element_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.element_element_id_seq', 1, false);


--
-- Name: element_on_planet_element_on_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.element_on_planet_element_on_planet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: element element_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_name_key UNIQUE (name);


--
-- Name: element_on_planet element_on_planet_element_on_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element_on_planet
    ADD CONSTRAINT element_on_planet_element_on_planet_id_key UNIQUE (element_on_planet_id);


--
-- Name: element_on_planet element_on_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element_on_planet
    ADD CONSTRAINT element_on_planet_name_key UNIQUE (name);


--
-- Name: element_on_planet element_on_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element_on_planet
    ADD CONSTRAINT element_on_planet_pkey PRIMARY KEY (element_on_planet_id);


--
-- Name: element element_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_pkey PRIMARY KEY (element_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: element_on_planet element_on_planet_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element_on_planet
    ADD CONSTRAINT element_on_planet_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.element(element_id);


--
-- Name: element_on_planet element_on_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element_on_planet
    ADD CONSTRAINT element_on_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

