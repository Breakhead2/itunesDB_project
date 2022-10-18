--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: albums; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    author character varying(100) NOT NULL,
    cover_filename character varying(50) DEFAULT 'no_cover.png'::character varying,
    url character varying(100) NOT NULL,
    realese_data timestamp without time zone,
    upload_data timestamp without time zone
);


ALTER TABLE public.albums OWNER TO denis;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: denis
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO denis;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denis
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: albums_songs; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.albums_songs (
    album_id integer NOT NULL,
    song_id integer NOT NULL
);


ALTER TABLE public.albums_songs OWNER TO denis;

--
-- Name: albums_users; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.albums_users (
    album_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.albums_users OWNER TO denis;

--
-- Name: genres; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.genres OWNER TO denis;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: denis
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO denis;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denis
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: listening_history; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.listening_history (
    user_id integer NOT NULL,
    song_id integer NOT NULL,
    date timestamp without time zone
);


ALTER TABLE public.listening_history OWNER TO denis;

--
-- Name: playlists; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.playlists OWNER TO denis;

--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: denis
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlists_id_seq OWNER TO denis;

--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denis
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- Name: playlists_songs; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.playlists_songs (
    playlist_id integer NOT NULL,
    song_id integer NOT NULL
);


ALTER TABLE public.playlists_songs OWNER TO denis;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.profiles (
    user_id integer NOT NULL,
    photo_filename character varying(50) DEFAULT 'default.png'::character varying,
    user_role_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.profiles OWNER TO denis;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);


ALTER TABLE public.roles OWNER TO denis;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: denis
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO denis;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denis
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    singer character varying(100) NOT NULL,
    genre_id integer NOT NULL,
    url character varying(100) NOT NULL,
    listening_counter integer DEFAULT 0
);


ALTER TABLE public.songs OWNER TO denis;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: denis
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO denis;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denis
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: songs_users; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.songs_users (
    song_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.songs_users OWNER TO denis;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    by_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    signed_at timestamp without time zone
);


ALTER TABLE public.subscriptions OWNER TO denis;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: denis
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO denis;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denis
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: denis
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(30)
);


ALTER TABLE public.users OWNER TO denis;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: denis
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO denis;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denis
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.albums (id, name, author, cover_filename, url, realese_data, upload_data) FROM stdin;
1       sed, hendrerit a,       Jessica Foley   picture.png     http://myspace.com/albums/854   2022-07-03 08:05:15     2022-11-12 18:42:22
2       lobortis quam a Rachel Velasquez        album.png       http://icloud.com/albums/1      2023-05-18 13:03:16     2023-01-06 22:05:22
3       elit. Aliquam auctor,   Lydia Deleon    image.png       https://itunes.com/albums/556   2023-05-26 03:15:22     2023-08-18 17:10:55
4       et netus et     Chastity Valencia       album.png       http://myspace.com/albums/7     2022-08-06 13:40:20     2022-07-05 02:09:09
5       accumsan interdum libero        Stuart Irwin    album.png       http://myspace.com/albums/2     2023-07-25 06:05:00     2023-01-02 22:45:23
6       non dui nec     Asher Hartman   picture.png     https://google.drive.com/albums/16      2022-11-03 02:33:09     2023-01-08 02:11:32
7       arcu imperdiet ullamcorper.     Belle Moody     picture.png     https://myspace.com/albums/6    2021-12-28 14:16:22     2022-12-19 07:30:08
8       interdum. Nunc sollicitudin     Xandra Cote     album.png       http://yandex.drive.com/albums/16       2022-09-19 13:53:59     2023-01-25 10:28:59
9       montes, nascetur ridiculus      Leilani Galloway        album.png      http://myspace.com/albums/663    2023-03-18 12:34:43     2023-03-21 06:56:19
10      massa. Quisque porttitor        Keith Ramirez   cover.png       https://itunes.com/albums/854   2022-11-23 09:58:59     2022-10-31 14:12:28
11      turpis. In condimentum. Cara Moore      picture.png     http://myspace.com/albums/188   2023-04-24 13:32:47     2023-08-19 13:07:46
12      adipiscing, enim mi     Amelia Meyers   album.png       https://google.drive.com/albums/3       2022-05-09 05:17:33     2021-12-21 12:59:44
13      fringilla purus mauris  Amir Higgins    album.png       http://google.drive.com/albums/663      2022-04-12 18:01:09     2022-02-23 23:29:08
14      fringilla. Donec feugiat        Yeo Mclean      picture.png     http://icloud.com/albums/110    2022-06-24 08:55:41     2022-05-08 15:06:24
15      velit dui, semper       Garrett Roth    cover.png       http://myspace.com/albums/5     2022-04-07 01:13:01     2022-09-29 05:28:55
16      Nullam vitae diam.      Uta Williamson  picture.png     http://yandex.drive.com/albums/188      2022-04-05 06:02:42     2022-06-03 00:11:36
17      dictum. Phasellus in    Quintessa Townsend      picture.png     http://google.drive.com/albums/16       2022-10-29 18:27:03     2021-12-01 09:28:42
18      dui. Suspendisse ac     Virginia Taylor picture.png     http://itunes.com/albums/55     2022-01-01 04:14:04     2021-11-09 18:35:08
19      Aliquam nisl. Nulla     Wayne Cooley    album.png       http://yandex.drive.com/albums/3        2023-07-18 11:43:19     2022-04-27 13:46:43
20      Etiam vestibulum massa  Joelle Rowe     cover.png       https://myspace.com/albums/16   2023-07-12 23:34:43     2022-07-16 20:48:45
21      dignissim tempor arcu.  Melissa Kent    cover.png       http://myspace.com/albums/17    2021-10-17 16:39:31     2022-04-17 19:35:50
22      nunc risus varius       Sydnee Higgins  picture.png     https://icloud.com/albums/556   2022-08-23 16:33:29     2023-04-24 00:56:55
23      Nunc pulvinar arcu      Lane Hull       cover.png       https://itunes.com/albums/663   2022-02-28 00:17:35     2022-12-16 09:59:46
24      nunc risus varius       Chandler Lowe   cover.png       https://icloud.com/albums/1     2022-09-01 22:48:43     2022-11-05 02:45:18
25      blandit congue. In      Kimberly Hartman        picture.png     https://icloud.com/albums/959   2022-01-24 00:39:06     2023-09-20 19:34:13
26      aliquet libero. Integer Colin Kaufman   cover.png       https://myspace.com/albums/854  2023-04-11 07:03:02     2023-04-14 15:15:34
27      aliquam arcu. Aliquam   Reece Bowers    picture.png     http://yandex.drive.com/albums/2        2022-07-22 13:20:05     2022-10-20 18:04:18
28      Curabitur massa. Vestibulum     Rhoda Hamilton  image.png       http://myspace.com/albums/6     2021-11-12 00:13:24     2023-09-19 06:44:43
29      non enim. Mauris        Joan Lowe       album.png       https://google.drive.com/albums/23      2022-07-10 07:36:55     2022-11-13 21:04:24
30      ultricies adipiscing, enim      Ferdinand Gillespie     picture.png    http://yandex.drive.com/albums/112       2023-02-20 10:41:52     2021-10-14 01:14:13
31      pharetra nibh. Aliquam  Shoshana Fox    cover.png       https://icloud.com/albums/11    2023-08-17 02:19:25     2023-07-16 07:54:04
32      auctor vitae, aliquet   Urielle Rojas   album.png       https://icloud.com/albums/7     2023-03-09 15:21:50     2021-12-11 20:47:01
33      aliquet, metus urna     Tara Hammond    picture.png     https://itunes.com/albums/1     2022-03-04 14:26:55     2022-02-14 16:07:38
34      augue malesuada malesuada.      Bevis Pruitt    cover.png       https://icloud.com/albums/6     2022-01-26 22:08:34     2022-10-22 13:39:31
35      urna suscipit nonummy.  Tyrone Estes    album.png       http://icloud.com/albums/223    2023-08-05 15:18:06     2023-10-02 01:23:10
36      adipiscing fringilla, porttitor Blake Hughes    picture.png     https://icloud.com/albums/223   2022-09-05 23:51:20     2022-12-12 20:39:12
37      malesuada ut, sem.      Driscoll Black  album.png       http://itunes.com/albums/1      2023-08-02 01:53:16     2022-12-23 08:24:15
38      Quisque porttitor eros  Shea Beck       picture.png     http://itunes.com/albums/15     2022-12-08 11:49:51     2023-04-08 10:16:32
39      purus ac tellus.        Yvonne Saunders picture.png     https://itunes.com/albums/959   2023-04-05 13:43:07     2022-10-20 13:22:16
40      libero est, congue      Murphy Vaughn   image.png       https://myspace.com/albums/14   2023-03-22 03:49:33     2023-03-24 05:26:07
41      ridiculus mus. Donec    Wanda Hopper    picture.png     https://yandex.drive.com/albums/223     2023-07-12 09:04:35     2022-04-30 04:13:38
42      enim commodo hendrerit. Haley Nash      image.png       http://myspace.com/albums/22    2022-11-25 00:21:33     2022-01-22 02:41:21
43      dictum. Proin eget      Juliet Hamilton album.png       http://itunes.com/albums/11     2022-02-24 16:46:47     2022-03-31 12:39:49
44      lacus. Nulla tincidunt, Inga Stewart    image.png       https://google.drive.com/albums/188     2021-11-30 08:18:50     2023-07-15 18:58:51
45      ac ipsum. Phasellus     Walker Acosta   album.png       http://itunes.com/albums/110    2023-04-14 17:29:52     2023-05-28 01:26:50
46      Morbi neque tellus,     Robin Rosales   album.png       http://google.drive.com/albums/5        2022-02-01 11:57:06     2022-12-03 01:15:52
47      magna. Suspendisse tristique    Cairo Mcintosh  picture.png     https://google.drive.com/albums/959     2023-07-12 13:58:31     2021-10-14 10:37:24
48      libero mauris, aliquam  Wanda Massey    image.png       http://yandex.drive.com/albums/32       2023-01-01 19:59:46     2022-07-18 10:04:12
49      mattis semper, dui      Ezra Stevens    album.png       https://icloud.com/albums/33    2022-09-02 10:10:01     2022-05-11 09:11:11
50      enim. Etiam gravida     Christopher Neal        picture.png     https://myspace.com/albums/36   2023-04-03 17:10:04     2023-03-06 10:57:27
51      quam. Curabitur vel     Scott Barron    image.png       https://google.drive.com/albums/101     2022-10-30 19:19:07     2022-07-27 12:23:34
52      lobortis mauris. Suspendisse    Jackson Richardson      cover.png      http://google.drive.com/albums/854       2023-07-21 22:58:48     2023-03-09 18:26:21
53      arcu. Vestibulum ut     Emma Hamilton   image.png       https://itunes.com/albums/4     2023-09-03 07:22:12     2021-10-20 11:46:00
54      Fusce aliquam, enim     Carolyn Hebert  picture.png     https://yandex.drive.com/albums/854     2021-11-03 18:41:04     2023-04-10 23:52:45
55      eleifend. Cras sed      Kylan Davenport album.png       https://google.drive.com/albums/5       2023-09-03 14:06:02     2022-08-27 18:51:27
56      nunc. Quisque ornare    Wang Stafford   picture.png     http://itunes.com/albums/4      2022-08-17 21:14:12     2023-05-03 01:49:23
57      magna. Praesent interdum        Magee Monroe    cover.png       https://icloud.com/albums/854   2021-12-11 01:34:57     2022-10-10 14:28:31
58      odio. Phasellus at      Jenette Roberts cover.png       https://myspace.com/albums/5    2022-09-01 02:52:01     2022-06-10 19:58:23
59      mattis ornare, lectus   Gannon Mcneil   image.png       http://google.drive.com/albums/556      2023-09-27 07:24:30     2022-01-28 17:26:58
60      Proin ultrices. Duis    Ella Howard     album.png       https://myspace.com/albums/46   2022-12-14 06:32:10     2022-10-06 04:31:55
61      congue. In scelerisque  Callie Vincent  cover.png       http://myspace.com/albums/16    2023-08-31 10:07:23     2023-06-24 23:49:40
62      orci, adipiscing non,   Elvis Camacho   image.png       http://myspace.com/albums/959   2022-05-07 08:34:13     2022-11-14 23:32:21
63      Etiam bibendum fermentum        Kyle Dejesus    image.png       http://yandex.drive.com/albums/5        2023-09-10 00:10:14     2022-10-31 19:39:26
64      Vivamus euismod urna.   Uta Combs       cover.png       http://itunes.com/albums/107    2023-08-24 22:08:28     2023-01-15 02:45:04
65      Sed id risus    Katelyn Terry   album.png       http://itunes.com/albums/188    2022-10-23 16:01:25     2022-09-13 07:07:48
66      libero et tristique     Kuame Grimes    picture.png     http://icloud.com/albums/101    2023-04-07 07:36:21     2022-10-10 08:56:26
67      Sed eu nibh     Macaulay Shepard        album.png       https://yandex.drive.com/albums/188     2022-05-23 19:48:04     2022-05-30 23:51:26
68      orci. Ut sagittis       Hyacinth Gilmore        cover.png       https://icloud.com/albums/109   2022-02-27 23:20:01     2021-12-24 09:05:09
69      pretium neque. Morbi    Kelly Shelton   album.png       http://icloud.com/albums/188    2022-02-16 13:30:44     2021-10-28 14:19:53
70      urna suscipit nonummy.  Benedict Kidd   album.png       https://google.drive.com/albums/105     2023-05-11 16:45:31     2021-12-31 16:12:10
71      tellus sem mollis       Blaze Dodson    album.png       https://icloud.com/albums/56    2022-01-20 11:20:58     2021-11-30 03:54:49
72      orci luctus et  Brenden Mason   album.png       http://icloud.com/albums/854    2022-08-19 14:26:11     2022-05-19 19:04:24
73      Vestibulum ut eros      Akeem Lucas     cover.png       http://yandex.drive.com/albums/993      2022-08-20 14:19:52     2022-06-14 23:10:16
74      vel est tempor  Graiden Short   album.png       https://myspace.com/albums/993  2023-04-27 21:00:50     2022-06-23 15:59:27
75      Duis a mi       Addison Johns   picture.png     http://icloud.com/albums/55     2023-03-22 03:45:15     2023-03-23 20:22:51
76      ornare placerat, orci   Cedric Schwartz image.png       http://google.drive.com/albums/110      2022-01-01 12:24:36     2022-02-20 23:00:21
77      nibh. Phasellus nulla.  Scott Matthews  picture.png     http://myspace.com/albums/112   2022-06-29 20:43:56     2022-09-06 22:27:10
78      nisl arcu iaculis       Riley Warner    album.png       http://icloud.com/albums/993    2021-12-24 19:55:44     2022-05-18 06:53:51
79      leo. Morbi neque        Jacqueline Stone        cover.png       http://icloud.com/albums/6      2022-08-24 07:32:59     2022-09-21 12:59:57
80      nec, diam. Duis Kelly Hoffman   picture.png     http://itunes.com/albums/16     2022-03-23 11:09:57     2022-07-06 04:37:16
81      iaculis aliquet diam.   Maggie Townsend album.png       http://google.drive.com/albums/2        2023-07-09 14:16:57     2023-01-04 15:40:45
82      vitae sodales nisi      Nolan Griffith  picture.png     https://yandex.drive.com/albums/4       2021-11-19 21:01:36     2022-10-10 14:10:45
83      vel, venenatis vel,     Jana Morse      album.png       https://icloud.com//albums/albums/1     2023-03-27 16:07:39     2022-05-05 12:44:40
84      Nullam feugiat placerat Owen Thomas     picture.png     http://yandex.drive.com/albums/55       2023-04-05 19:19:03     2022-10-14 10:59:06
85      lectus sit amet Gabriel Mckee   picture.png     http://myspace.com/albums/15    2022-07-09 13:26:39     2023-01-22 11:42:54
86      lectus convallis est,   Herrod Patterson        picture.png     https://myspace.com/albums/2    2022-06-12 21:29:21     2021-10-20 01:57:30
87      Phasellus dolor elit,   Cassandra Branch        album.png       http://google.drive.com/albums/6        2023-05-17 18:10:46     2022-11-01 18:10:06
88      amet ante. Vivamus      Jacqueline Hester       image.png       https://yandex.drive.com/albums/6       2022-09-06 18:52:24     2023-04-26 09:39:12
89      ut, molestie in,        Amal Melendez   album.png       https://google.drive.com/albums/993     2023-08-24 20:46:51     2023-06-24 04:50:31
90      mollis dui, in  Whilemina Carver        image.png       https://itunes.com/albums/112   2023-03-11 23:11:17     2023-04-17 10:29:32
91      Quisque varius. Nam     Ulla Lynn       album.png       https://yandex.drive.com/albums/556     2023-04-15 18:41:27     2022-11-08 07:27:56
92      mus. Proin vel  Mannix Barr     image.png       https://myspace.com/albums/112  2021-12-04 07:20:06     2022-11-22 12:58:09
93      eu, ligula. Aenean      Leah Deleon     picture.png     https://icloud.com/albums/21    2023-08-05 14:14:28     2022-05-03 01:56:12
94      rhoncus. Nullam velit   Denton Mercado  picture.png     https://google.drive.com/albums/556     2022-04-14 15:58:58     2023-05-27 00:26:57
95      rutrum, justo. Praesent Denise Valdez   image.png       http://yandex.drive.com/albums/75       2023-08-06 03:59:16     2022-05-09 08:40:56
96      a, arcu. Sed    Shelby Huffman  picture.png     http://icloud.com/albums/141    2023-05-23 04:29:45     2023-02-28 00:26:41
97      elementum, lorem ut     Sylvia Orr      album.png       https://myspace.com/albums/223  2023-04-11 14:07:10     2023-05-05 03:04:02
98      nisi a odio     Stuart Gould    album.png       https://yandex.drive.com/albums/101     2023-04-06 16:07:43     2023-07-11 20:57:08
99      vitae, aliquet nec,     Jasmine Miles   picture.png     http://google.drive.com/albums/1        2022-03-09 08:51:18     2022-02-09 08:28:09
100     sapien. Cras dolor      Jeremy Koch     picture.png     http://myspace.com/albums/9     2022-09-01 08:44:49     2023-07-17 11:02:13
\.


--
-- Data for Name: albums_songs; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.albums_songs (album_id, song_id) FROM stdin;
7       45
93      50
68      4
68      24
41      82
77      70
58      75
4       80
51      54
11      97
92      80
16      64
92      47
81      58
43      44
67      76
7       56
62      2
45      29
88      93
95      89
8       30
12      12
91      36
76      86
51      68
23      91
63      25
55      30
21      65
9       40
19      22
84      2
77      44
70      42
53      18
68      42
84      54
97      23
70      93
40      90
11      86
52      6
63      49
19      75
20      18
69      65
92      97
34      99
28      54
50      83
22      89
31      55
93      10
41      40
60      5
48      27
92      71
54      22
9       57
55      38
84      31
70      89
27      33
87      2
8       24
79      30
31      91
75      10
91      41
58      48
5       57
63      16
24      16
11      81
16      36
66      99
70      60
8       25
4       76
99      83
50      30
45      70
42      65
86      68
63      29
18      44
40      21
96      3
24      6
62      3
53      66
95      31
78      17
76      95
69      58
100     54
69      3
87      40
52      34
\.


--
-- Data for Name: albums_users; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.albums_users (album_id, user_id) FROM stdin;
37      98
67      32
94      37
59      27
27      33
50      2
83      6
90      44
82      89
63      52
62      53
24      94
60      5
78      25
100     96
66      5
90      92
55      20
43      62
25      31
15      30
11      55
12      33
16      45
7       74
6       78
43      42
96      56
64      43
66      96
14      92
84      98
54      48
45      31
93      30
19      54
74      66
98      23
63      52
17      80
80      79
18      43
15      71
49      78
74      57
21      23
53      47
98      38
22      55
79      24
78      8
15      84
28      56
83      46
94      90
18      33
48      20
10      40
68      56
52      85
9       89
48      54
87      41
51      60
28      88
76      93
55      78
9       79
1       14
90      82
43      39
46      71
96      22
80      88
90      29
67      86
1       53
68      13
55      15
81      71
3       97
21      35
64      94
79      93
87      79
80      46
93      46
50      98
82      79
74      16
85      76
97      34
13      99
60      66
68      23
38      58
13      44
60      22
5       91
23      12
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.genres (id, name) FROM stdin;
1       pop-music
2       classic music
3       rock
4       blues
5       RnB
6       jazz
7       electro
8       hip-hop
9       metal
10      rap
\.


--
-- Data for Name: listening_history; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.listening_history (user_id, song_id, date) FROM stdin;
36      73      2022-07-09 16:21:44
7       50      2023-04-24 09:17:17
79      55      2022-06-09 10:46:59
39      73      2023-02-20 10:19:55
91      83      2023-01-28 10:19:37
61      31      2022-01-01 04:39:04
36      28      2023-07-21 18:37:04
60      86      2022-09-14 22:34:53
62      78      2023-01-19 00:20:00
5       74      2023-06-06 08:27:30
1       14      2023-06-23 07:59:52
28      34      2022-07-09 09:21:17
73      42      2022-12-16 21:01:00
6       87      2023-08-17 14:33:51
31      14      2022-02-12 05:51:22
24      9       2022-06-07 20:26:35
63      87      2022-09-01 09:55:19
46      17      2022-05-22 14:55:51
56      4       2022-11-27 04:21:32
49      91      2023-04-30 14:43:56
82      25      2023-04-08 03:44:27
34      95      2023-10-13 04:15:15
31      22      2023-09-18 20:31:36
45      33      2022-10-09 06:34:43
34      15      2021-11-13 07:12:45
25      99      2023-08-15 06:54:12
7       50      2022-04-01 14:49:04
45      59      2022-11-18 19:45:57
45      21      2023-06-15 08:16:44
3       48      2022-09-05 08:12:50
91      92      2023-06-08 18:11:04
46      62      2023-10-13 05:09:44
69      39      2023-06-02 20:42:34
97      17      2022-05-29 23:37:04
6       92      2022-01-17 03:38:52
7       18      2021-11-08 05:54:04
96      12      2022-07-08 08:51:38
46      10      2022-07-24 02:56:44
20      60      2023-04-06 17:00:49
54      80      2022-08-28 15:05:40
79      61      2022-10-29 10:21:24
8       12      2023-04-26 20:58:23
55      3       2023-02-16 07:17:02
76      41      2023-02-26 08:17:44
4       39      2023-01-02 03:41:57
42      9       2022-08-09 04:34:30
90      47      2022-03-26 09:01:30
81      55      2021-12-03 07:00:57
6       76      2022-08-29 08:48:17
19      8       2022-01-06 10:22:49
31      72      2022-07-20 03:44:50
5       95      2023-09-28 01:59:59
34      62      2023-10-03 17:32:09
53      20      2021-11-23 18:25:11
76      88      2022-11-24 21:08:37
77      46      2023-04-14 14:33:41
58      92      2021-12-08 23:21:15
41      54      2022-08-14 07:12:48
4       74      2022-11-28 20:50:08
95      78      2022-12-16 12:49:49
93      94      2022-07-17 02:46:04
15      88      2022-01-01 16:01:00
20      36      2022-11-16 16:52:09
19      34      2022-09-06 07:32:47
9       29      2022-05-12 23:12:35
22      72      2023-02-20 00:51:14
55      2       2022-06-29 14:21:09
61      97      2023-04-30 06:31:44
74      13      2022-12-22 01:12:13
22      54      2022-09-09 14:05:05
29      83      2023-06-06 20:50:45
27      44      2022-05-30 16:00:35
42      63      2023-04-19 01:53:38
23      21      2021-12-21 08:21:08
80      55      2023-09-18 18:10:03
77      57      2023-03-18 10:27:16
76      83      2023-01-19 07:04:29
3       83      2023-01-12 04:35:47
69      12      2023-03-02 15:41:49
17      30      2022-07-08 12:35:42
39      48      2021-10-19 00:04:59
63      48      2022-08-27 01:36:15
55      41      2023-08-27 18:07:23
23      3       2022-12-28 17:56:56
82      42      2022-07-24 14:27:49
75      29      2022-05-06 11:35:07
64      22      2022-01-10 06:04:01
40      60      2023-05-27 23:29:22
86      4       2023-02-04 10:12:17
6       92      2023-01-26 11:35:03
18      23      2022-04-28 17:23:48
10      78      2023-08-02 19:51:28
32      4       2022-07-05 23:43:39
97      32      2022-05-05 14:06:19
97      83      2022-06-14 11:26:59
75      36      2023-03-07 21:01:21
53      6       2022-07-26 03:47:35
4       20      2023-08-29 00:22:15
25      5       2022-04-27 10:11:57
51      13      2023-05-10 23:24:36
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.playlists (id, name, creator_id, created_at) FROM stdin;
1       nulla   55      2022-05-01 15:48:55
2       Ut      97      2023-03-16 04:07:32
3       interdum        63      2023-06-24 02:34:20
4       nascetur        63      2022-03-02 13:44:30
5       eleifend        10      2022-01-14 04:36:00
6       ultrices.       9       2022-11-23 12:35:38
7       imperdiet       90      2022-12-05 10:57:21
8       Proin   22      2023-09-24 11:43:22
9       vulputate,      36      2022-01-29 09:00:23
10      pede,   12      2023-06-18 21:01:16
11      turpis. 63      2023-03-27 20:50:55
12      scelerisque     15      2023-02-16 14:15:03
13      elit.   2       2023-03-01 05:38:37
14      Sed     21      2023-08-05 10:02:46
15      ante,   32      2022-03-05 18:25:07
16      arcu.   4       2022-04-07 00:40:09
17      dui     22      2023-07-19 16:28:15
18      dolor   12      2022-02-03 00:04:14
19      ac      65      2023-06-18 02:59:19
20      dui     32      2022-07-12 07:18:34
21      Phasellus       18      2022-01-10 14:45:29
22      Donec   82      2022-04-13 22:19:32
23      rhoncus.        19      2023-02-22 05:51:58
24      Donec   41      2023-06-03 10:59:52
25      mauris  30      2023-05-31 21:05:47
26      sem.    2       2022-08-31 07:07:51
27      tellus  1       2023-03-06 21:27:38
28      eget,   21      2023-05-27 22:28:54
29      mollis  15      2023-08-03 22:49:50
30      luctus, 93      2022-11-20 17:51:01
31      varius  43      2022-06-25 03:59:54
32      Aenean  16      2022-03-28 07:53:39
33      ultrices,       82      2023-03-02 00:28:12
34      turpis  49      2022-07-16 21:28:20
35      fringilla       75      2022-05-31 02:59:03
36      Morbi   53      2022-10-17 06:25:51
37      nulla   25      2023-02-02 23:34:28
38      in      78      2022-10-26 04:35:17
39      laoreet 48      2023-02-11 10:00:10
40      magna,  30      2022-11-25 07:15:16
41      Pellentesque    46      2022-09-26 03:54:34
42      fringilla       28      2022-02-21 03:39:57
43      et      3       2023-08-12 07:31:09
44      Donec   72      2023-01-26 20:12:33
45      sem     81      2021-11-14 00:54:59
46      erat    58      2022-02-10 07:42:06
47      dui     57      2023-10-05 21:32:30
48      hendrerit       64      2023-03-19 20:14:35
49      Sed     38      2022-05-23 20:16:57
50      purus,  9       2022-07-09 01:30:39
51      enim    31      2022-08-05 00:27:24
52      porta   55      2022-04-23 21:38:00
53      justo.  57      2023-03-17 14:56:00
54      molestie        24      2023-02-13 07:10:25
55      quis    15      2023-01-23 13:05:14
56      Fusce   88      2023-02-27 06:34:26
57      auctor  48      2021-12-30 12:30:48
58      urna.   16      2023-08-11 06:07:18
59      Quisque 72      2023-10-04 10:20:53
60      tortor. 58      2022-02-18 06:26:31
61      neque   20      2021-10-18 15:21:10
62      non     52      2023-09-13 08:49:53
63      faucibus        35      2023-02-21 13:27:44
64      eget    7       2021-10-16 10:04:53
65      nec     55      2023-09-26 22:55:44
66      Nunc    55      2022-12-09 11:41:50
67      ut      22      2022-04-11 05:07:07
68      vel     26      2023-01-26 14:59:21
69      non     90      2022-08-21 07:02:50
70      quis,   29      2022-06-10 23:58:39
71      tellus. 77      2023-09-01 12:02:29
72      rhoncus.        55      2022-06-04 08:18:32
73      lorem.  10      2023-06-13 07:03:53
74      ante.   36      2023-05-27 01:18:08
75      est.    91      2021-12-12 07:25:20
76      eu      78      2023-05-12 11:08:10
77      enim.   82      2021-11-18 10:38:46
78      vel     37      2023-06-02 05:57:15
79      eleifend.       41      2023-05-13 02:44:38
80      libero  52      2023-07-27 04:42:08
81      luctus  13      2022-06-06 20:48:24
82      vitae   78      2021-11-16 04:35:02
83      magna   3       2023-01-19 06:18:22
84      imperdiet,      55      2023-10-04 20:06:07
85      vel,    31      2023-09-30 15:23:05
86      facilisis,      84      2023-01-15 22:24:52
87      odio    51      2023-09-08 10:48:41
88      tellus. 21      2021-10-25 19:03:57
89      elit.   54      2023-06-24 02:09:54
90      Quisque 29      2023-09-14 19:36:53
91      mauris  41      2022-12-03 21:58:00
92      augue,  5       2023-04-27 12:33:09
93      ipsum.  71      2022-07-30 12:30:51
94      congue  71      2022-09-12 14:00:49
95      nunc.   78      2022-08-28 22:29:30
96      id      54      2022-02-01 14:05:10
97      molestie        90      2023-04-11 13:28:12
98      dignissim       96      2021-11-06 03:08:51
99      nibh.   97      2022-03-15 17:52:30
100     Cras    43      2022-04-01 21:31:43
\.


--
-- Data for Name: playlists_songs; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.playlists_songs (playlist_id, song_id) FROM stdin;
32      48
62      22
44      44
45      72
17      16
87      46
82      56
27      73
32      77
16      58
90      92
20      18
94      24
90      90
84      23
43      6
33      32
99      55
42      93
51      64
51      24
41      42
81      49
29      30
54      27
76      29
30      61
9       48
95      54
35      70
33      61
3       27
64      77
90      51
39      46
20      58
69      7
73      72
50      51
40      73
53      68
12      62
30      96
56      89
27      11
29      4
55      68
28      67
78      76
86      9
90      49
82      10
24      72
3       43
51      85
52      37
39      35
22      48
69      76
90      5
83      3
70      36
9       98
35      26
19      20
35      55
65      16
14      10
81      11
39      45
30      43
87      16
91      42
99      38
9       8
31      82
82      85
74      4
71      71
34      50
26      39
36      88
22      17
49      29
39      28
14      21
40      53
74      61
32      20
73      96
86      48
47      69
36      71
80      61
13      49
23      37
5       35
78      77
49      26
100     98
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.profiles (user_id, photo_filename, user_role_id, created_at) FROM stdin;
1       ava.png 1       2023-04-18 22:49:51
2       photo.png       1       2022-09-20 09:52:45
3       iam.png 1       2021-11-16 22:19:49
4       my_photo.png    1       2023-08-27 08:05:31
5       photo.png       1       2023-08-13 22:12:29
6       photo.png       2       2023-05-25 03:43:15
7       profile.png     2       2022-05-18 04:53:58
8       ava.png 1       2022-01-30 10:46:40
9       photo.png       2       2023-07-23 14:12:45
10      iam.png 2       2022-11-23 03:45:31
11      photo.png       1       2022-03-09 06:06:24
12      ava.png 2       2022-12-31 03:32:11
13      iam.png 1       2022-09-26 11:40:25
14      photo.png       1       2023-02-04 07:56:18
15      ava.png 1       2023-06-06 20:59:30
16      my_photo.png    2       2023-03-24 01:41:43
17      iam.png 1       2022-02-09 01:32:33
18      my_photo.png    1       2022-10-26 21:01:41
19      my_photo.png    2       2023-06-12 00:35:26
20      photo.png       2       2023-02-20 06:42:13
21      ava.png 1       2022-08-14 14:26:48
22      photo.png       2       2023-07-15 04:32:29
23      profile.png     2       2022-04-15 01:11:35
24      picture.png     2       2022-09-04 01:38:27
25      ava.png 1       2022-07-10 11:32:58
26      iam.png 1       2021-12-03 02:47:49
27      photo.png       1       2022-04-07 18:21:37
28      my_photo.png    2       2022-11-21 13:27:27
29      iam.png 2       2021-11-23 15:36:51
30      iam.png 2       2023-02-27 02:41:03
31      ava.png 2       2021-12-18 14:03:29
32      photo.png       1       2022-06-01 07:58:49
33      photo.png       1       2023-05-25 20:27:13
34      my_photo.png    1       2023-07-31 22:38:22
35      ava.png 1       2023-06-12 07:59:07
36      photo.png       1       2021-10-19 12:00:49
37      picture.png     2       2022-11-14 04:16:30
38      iam.png 2       2023-10-11 00:33:45
39      ava.png 1       2023-03-05 00:56:40
40      photo.png       1       2023-03-01 18:17:48
41      profile.png     2       2023-04-03 06:12:34
42      picture.png     2       2023-08-29 22:12:52
43      picture.png     1       2023-04-22 21:32:46
44      ava.png 1       2022-05-31 15:43:49
45      iam.png 2       2022-12-25 23:49:16
46      photo.png       2       2022-06-15 22:16:59
47      ava.png 1       2022-03-29 07:59:09
48      ava.png 1       2022-04-18 17:35:30
49      iam.png 1       2022-01-16 20:21:07
50      ava.png 1       2022-05-17 17:03:02
51      ava.png 2       2022-09-07 00:06:48
52      my_photo.png    1       2021-11-30 04:48:57
53      profile.png     1       2021-12-08 23:56:59
54      ava.png 2       2023-09-02 02:33:55
55      iam.png 2       2022-10-16 20:05:38
56      iam.png 1       2023-07-11 12:23:29
57      ava.png 1       2022-05-07 08:42:35
58      picture.png     2       2022-03-24 15:27:30
59      photo.png       1       2022-06-12 17:34:57
60      my_photo.png    1       2022-11-25 10:07:59
61      picture.png     2       2022-08-14 04:50:03
62      photo.png       2       2023-02-20 06:50:54
63      profile.png     2       2023-02-17 05:16:54
64      photo.png       2       2023-04-06 03:06:46
65      profile.png     1       2022-05-10 22:56:55
66      picture.png     2       2022-08-03 04:33:26
67      iam.png 1       2022-05-30 02:13:50
68      iam.png 1       2021-12-22 16:07:43
69      photo.png       1       2023-01-18 18:57:32
70      ava.png 1       2022-08-06 20:44:12
71      iam.png 2       2022-07-07 10:20:39
72      picture.png     2       2023-01-18 12:24:16
73      my_photo.png    1       2022-03-18 12:47:03
74      my_photo.png    1       2022-10-11 02:34:59
75      photo.png       2       2023-06-22 10:50:41
76      ava.png 2       2023-07-05 05:24:05
77      ava.png 1       2023-05-25 03:32:58
78      picture.png     2       2023-06-20 13:13:45
79      profile.png     1       2022-06-01 02:35:18
80      iam.png 1       2022-10-22 14:51:07
81      ava.png 1       2021-12-04 15:20:06
82      iam.png 1       2022-10-01 06:45:25
83      my_photo.png    1       2023-09-27 19:23:46
84      profile.png     1       2023-09-29 22:42:41
85      my_photo.png    1       2022-11-13 08:10:16
86      photo.png       2       2022-11-28 03:50:13
87      iam.png 2       2023-03-24 22:44:36
88      picture.png     2       2023-04-17 10:01:07
89      ava.png 1       2023-06-13 01:46:22
90      picture.png     2       2023-07-05 17:13:46
91      my_photo.png    2       2022-11-22 03:49:05
92      my_photo.png    1       2023-05-21 08:26:33
93      photo.png       2       2023-09-03 07:28:21
94      my_photo.png    1       2022-12-15 04:11:35
95      picture.png     1       2022-09-13 20:04:58
96      my_photo.png    2       2022-05-06 21:27:58
97      iam.png 2       2023-05-06 13:50:59
98      profile.png     1       2023-01-06 22:21:26
99      photo.png       2       2023-10-05 20:18:10
100     ava.png 1       2022-04-13 05:57:56
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.roles (id, name) FROM stdin;
1       listener
2       owner
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.songs (id, name, singer, genre_id, url, listening_counter) FROM stdin;
1       Nullam suscipit, est    Duncan Bauer    8       http://icloud.com/songs/959     704
2       molestie. Sed id        Malachi Schroeder       2       http://google.drive.com/songs/3 598
3       arcu. Aliquam ultrices  Olga Colon      8       https://youtube.com/songs/188   359
4       sed pede. Cum   Winifred Silva  8       http://myspace.com/songs/9     880
5       massa rutrum magna.     Hamilton Rodgers        10      https://google.drive.com/songs/663      591
6       sem ut dolor    Len Cunningham  9       https://icloud.com/songs/663   696
7       senectus et netus       Dorian May      2       http://yandex.drive.com/songs/556       468
8       Nulla dignissim. Maecenas       Hermione Payne  4       http://icloud.com/songs/223     131
9       urna. Ut tincidunt      Theodore Ellis  2       http://google.drive.com/songs/112       167
10      Quisque imperdiet, erat Lyle Mccarty    5       http://icloud.com/songs/663     774
11      nunc. In at     Alea Lindsey    4       https://yandex.drive.com/songs/1179
12      senectus et netus       Whoopi Garcia   9       http://icloud.com/songs/5       681
13      tellus, imperdiet non,  Dolan Hobbs     10      http://myspace.com/songs/1      283
14      gravida mauris ut       Colin Mosley    8       https://google.drive.com/songs/556      934
15      in magna. Phasellus     Jamalia George  2       https://youtube.com/songs/55    799
16      dolor. Donec fringilla. Adrienne Hensley        5       http://myspace.com/songs/16     997
17      non dui nec     Deanna Jackson  6       https://icloud.com/songs/854   996
18      Nunc laoreet lectus     Melissa Howe    8       http://google.drive.com/songs/110       302
19      libero nec ligula       Troy Suarez     7       http://icloud.com/songs/64      443
20      interdum. Curabitur dictum.     Luke Prince     6       https://myspace.com/songs/16    455
21      tortor nibh sit Isaac Mckay     9       http://myspace.com/songs/55    260
22      egestas, urna justo     Audrey Stein    7       https://yandex.drive.com/songs/959      2
23      sem egestas blandit.    Jesse Burns     5       http://icloud.com/songs/13      645
24      nisl elementum purus,   Joseph Palmer   2       https://icloud.com/songs/55     330
25      Aliquam tincidunt, nunc Jonah Hooper    5       http://icloud.com/songs/3       505
26      Aenean euismod mauris   Constance Justice       3       http://myspace.com/songs/5      980
27      imperdiet non, vestibulum       Amity Flores    5       http://yandex.drive.com/songs/64        923
28      Pellentesque ut ipsum   Adrian Rich     10      https://icloud.com/songs/12     978
29      Suspendisse sagittis. Nullam    Cullen Browning 4       http://icloud.com/songs/112     962
30      nec tempus scelerisque, Rina Juarez     3       http://icloud.com/songs/643     562
31      sem, consequat nec,     Iliana Moody    6       https://google.drive.com/songs/959      842
32      tempus eu, ligula.      Victor Morrow   8       http://yandex.drive.com/songs/2 547
33      mattis. Integer eu      Rebekah Battle  3       http://myspace.com/songs/45     743
34      justo. Proin non        Ivan Vincent    6       https://icloud.com/songs/101    506
35      at risus. Nunc  Amy Mayer       5       http://icloud.com/songs/556    181
36      adipiscing elit. Curabitur      Brady Cantu     1       https://yandex.drive.com/songs/993      85
37      Vestibulum ante ipsum   Leo Christian   4       https://yandex.drive.com/songs/3        340
38      tellus non magna.       Kevyn Stevens   2       http://yandex.drive.com/songs/101       985
39      sem magna nec   George Hester   3       https://icloud.com/songs/16    298
40      vel, faucibus id,       Gwendolyn Bailey        5       http://myspace.com/songs/854    427
41      sit amet ante.  Tanya Cherry    3       http://myspace.com/songs/188   171
42      in felis. Nulla Jacob Rodriguez 8       http://icloud.com/songs/163    108
43      urna justo faucibus     Jakeem Barrera  7       https://yandex.drive.com/songs/854      730
44      dignissim. Maecenas ornare      Harding Richards        3       https://myspace.com/songs/993   42
45      nibh. Donec est Kelly Schroeder 4       https://yandex.drive.com/songs/193      877
46      nisi. Cum sociis        Driscoll Harvey 8       http://google.drive.com/songs/10        672
47      ipsum non arcu. Hashim Preston  5       http://yandex.drive.com/songs/993       172
48      eget metus eu   Arsenio Yates   2       http://myspace.com/songs/101   874
49      Donec at arcu.  Tatiana Hogan   4       https://yandex.drive.com/songs/188      590
50      scelerisque dui. Suspendisse    Ocean Carter    3       http://google.drive.com/songs/993       261
51      lacinia. Sed congue,    Holly Chase     4       https://myspace.com/songs/5     793
52      Aenean sed pede Raja Washington 3       http://youtube.com/songs/16    531
53      ligula. Aliquam erat    Chaim Simmons   4       https://google.drive.com/songs/854      172
54      libero. Proin sed       Charde Kidd     7       http://google.drive.com/songs/16        177
55      at fringilla purus      Gavin Eaton     1       https://google.drive.com/songs/59       355
56      nostra, per inceptos    Nash Mccullough 6       https://google.drive.com/songs/54       965
57      enim commodo hendrerit. Kuame Herrera   2       http://google.drive.com/songs/1 166
58      non enim commodo        Salvador Gay    9       http://google.drive.com/songs/556       893
59      nulla. In tincidunt     Nina Wiley      8       http://myspace.com/songs/663    505
60      fames ac turpis Maxwell Turner  4       https://icloud.com/songs/556   457
61      magnis dis parturient   Laurel Mccullough       3       http://myspace.com/songs/13     897
62      nascetur ridiculus mus. Kasimir Flowers 2       http://icloud.com/songs/32      720
63      Donec felis orci,       Keaton Lowery   5       https://icloud.com/songs/22     9
64      eleifend. Cras sed      Deacon Leach    4       https://youtube.com/songs/854   342
65      Phasellus fermentum convallis   Hilda Freeman   3       https://myspace.com/songs/2     141
66      arcu. Sed eu    Charlotte Osborne       7       http://yandex.drive.com/songs/5 648
67      Nulla eget metus        Abel Ware       4       http://myspace.com/songs/3      356
68      eu elit. Nulla  Cameran Bryant  3       https://google.drive.com/songs/3205
69      in molestie tortor      Kylee Stuart    3       http://icloud.com/songs/1       339
70      condimentum eget, volutpat      Michael Bullock 1       https://google.drive.com/songs/2        866
71      elit. Curabitur sed     Sheila Ferrell  9       http://yandex.drive.com/songs/959       947
72      arcu et pede.   Lucas Alford    7       http://myspace.com/songs/88    809
73      enim. Mauris quis       Michelle Garcia 3       http://youtube.com/songs/26     988
74      adipiscing elit. Curabitur      Darius Chambers 5       https://yandex.drive.com/songs/64       623
75      feugiat non, lobortis   Vaughan Santiago        9       http://google.drive.com/songs/959       838
76      odio tristique pharetra.        Guinevere Cobb  8       https://myspace.com/songs/55    741
77      turpis non enim.        Brenda Kelley   7       https://yandex.drive.com/songs/6        835
78      velit dui, semper       Ruby Juarez     4       https://youtube.com/songs/959   535
79      amet ornare lectus      Amela Grimes    5       http://myspace.com/songs/64     766
80      ornare, lectus ante     Evangeline Watson       2       http://icloud.com/songs/39      784
81      lobortis quis, pede.    Ursa Wilkins    2       http://google.drive.com/songs/73        472
82      molestie sodales. Mauris        Shea Vega       10      https://icloud.com/songs/223    142
83      id risus quis   Raphael Lyons   9       http://icloud.com/songs/15     656
84      tristique pharetra. Quisque     Paul Trevino    7       https://icloud.com/songs/4      252
85      cursus vestibulum. Mauris       Garrison Harvey 9       http://myspace.com/songs/43     894
86      egestas lacinia. Sed    Sade Glass      6       https://yandex.drive.com/songs/66       556
87      dolor dolor, tempus     Chastity Pate   6       http://youtube.com/songs/188    483
88      Donec egestas. Aliquam  Sage Gallegos   7       http://yandex.drive.com/songs/22        599
89      id nunc interdum        Mufutau Holder  5       http://myspace.com/songs/81     732
90      nunc id enim.   Philip Russell  9       http://youtube.com/songs/64    169
91      Cras eget nisi  Kiara Webb      8       http://youtube.com/songs/36    840
92      urna. Vivamus molestie  Ramona Colon    8       https://youtube.com/songs/45    998
93      at, egestas a,  Ryder Underwood 5       http://google.drive.com/songs/64981
94      Praesent eu nulla       Prescott Wilkerson      9       http://google.drive.com/songs/55        352
95      fringilla purus mauris  Jorden Alvarado 1       http://yandex.drive.com/songs/1 99
96      magnis dis parturient   Camille Chavez  7       http://icloud.com/songs/854     628
97      egestas rhoncus. Proin  Celeste Saunders        9       https://yandex.drive.com/songs/223      686
98      montes, nascetur ridiculus      Troy Thompson   4       http://yandex.drive.com/songs/112       684
99      consectetuer mauris id  Quinn Preston   8       https://myspace.com/songs/110   155
100     molestie in, tempus     Quamar King     2       https://youtube.com/songs/556   974
\.


--
-- Data for Name: songs_users; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.songs_users (song_id, user_id) FROM stdin;
44      42
16      95
48      1
86      44
68      64
15      84
50      3
40      70
4       92
74      71
56      47
89      19
96      50
31      53
42      81
14      58
13      43
48      8
15      54
6       53
58      72
9       14
76      98
82      78
73      9
27      17
36      5
25      97
81      45
26      97
51      58
27      87
62      35
66      98
75      43
80      76
46      64
17      39
39      90
77      37
67      65
79      40
41      64
86      25
81      30
89      18
74      24
3       59
97      9
66      73
66      99
10      7
64      38
4       25
3       27
46      86
92      65
25      95
72      29
17      83
22      86
39      69
84      31
92      87
15      17
28      84
93      24
26      18
4       47
85      73
50      97
42      85
15      9
93      44
41      79
3       62
38      8
52      77
50      83
38      39
57      16
22      74
37      72
32      42
27      41
78      3
63      43
32      90
68      44
88      7
61      77
49      56
60      41
6       17
25      99
42      62
8       39
8       96
45      13
62      39
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.subscriptions (id, by_user_id, to_user_id, signed_at) FROM stdin;
1       7       17      2022-06-27 11:52:09
2       33      59      2023-01-20 17:05:44
3       98      66      2023-03-26 22:15:47
4       40      93      2021-11-20 03:19:01
5       58      94      2022-06-26 13:56:04
6       74      16      2022-01-05 16:16:20
7       87      59      2023-08-16 16:57:04
8       75      86      2022-03-31 22:17:57
9       49      30      2023-07-10 16:42:49
10      13      86      2022-02-17 14:33:50
11      85      74      2023-05-30 02:06:09
12      58      89      2023-03-20 13:00:05
13      90      67      2021-11-08 20:40:47
14      40      6       2022-03-28 14:31:44
15      52      88      2023-04-27 23:58:09
16      5       6       2023-09-23 22:39:03
17      15      44      2023-02-15 14:34:37
18      90      50      2022-09-22 04:01:33
19      68      40      2023-09-28 14:57:46
20      55      58      2022-04-30 22:34:05
21      62      31      2022-09-01 14:28:36
22      19      28      2023-02-26 05:29:33
23      4       98      2023-04-13 12:09:14
24      95      36      2023-09-28 11:41:52
25      79      24      2023-07-30 13:57:15
26      95      25      2022-04-24 13:58:25
27      50      72      2022-04-04 14:14:51
28      14      86      2023-03-19 00:41:50
29      52      18      2023-09-11 03:59:18
30      68      90      2022-11-18 22:07:37
31      26      13      2022-11-21 12:20:19
32      28      33      2022-04-18 14:21:54
33      84      92      2023-03-01 17:32:00
34      77      58      2022-09-19 09:58:50
35      53      72      2023-02-09 18:12:19
36      59      18      2022-06-25 03:15:57
37      48      21      2023-04-23 15:44:35
38      47      35      2023-02-27 18:37:11
39      65      39      2023-10-12 20:54:39
40      64      58      2022-07-22 20:14:15
41      17      57      2023-09-15 22:41:51
42      33      84      2022-09-12 11:25:04
43      74      91      2022-08-29 10:58:33
44      18      13      2022-03-03 05:58:40
45      5       90      2023-03-31 00:13:03
46      68      88      2022-02-25 10:36:36
47      78      75      2022-02-10 06:03:01
48      25      93      2023-01-19 07:56:50
49      64      47      2021-12-24 05:54:03
50      82      84      2021-12-14 20:28:26
51      24      98      2022-01-24 10:43:47
52      61      93      2022-09-23 13:31:51
53      54      66      2022-10-17 06:50:03
54      13      90      2022-03-01 12:07:58
55      20      97      2022-06-08 23:06:07
56      43      33      2023-05-08 19:11:49
57      14      49      2023-05-22 22:19:27
58      93      91      2023-09-06 02:15:08
59      89      72      2023-08-23 15:35:32
60      98      41      2022-04-16 23:23:12
61      49      90      2021-11-25 08:04:09
62      86      67      2023-09-24 18:11:41
63      29      75      2022-08-18 16:36:34
64      56      59      2022-01-19 03:32:11
65      71      11      2023-08-13 23:06:22
66      52      89      2022-10-13 21:21:23
67      59      95      2023-05-11 19:18:52
68      60      74      2022-01-24 03:42:46
69      33      52      2022-03-18 20:00:01
70      75      81      2022-03-18 11:59:29
71      63      81      2022-11-07 14:31:39
72      57      79      2023-04-27 17:37:39
73      40      68      2023-08-21 19:45:04
74      96      79      2023-04-01 08:51:31
75      64      55      2023-08-30 13:29:29
76      24      73      2023-10-05 18:59:36
77      12      48      2022-09-28 12:53:37
78      57      62      2023-04-13 15:52:02
79      59      92      2022-01-10 19:59:26
80      89      29      2022-08-26 18:48:41
81      38      58      2022-07-17 22:11:49
82      86      77      2021-12-13 00:40:56
83      64      97      2021-12-13 15:47:51
84      93      11      2022-06-17 13:17:33
85      42      68      2023-03-20 05:56:37
86      38      79      2022-02-12 21:10:06
87      62      76      2021-11-11 11:19:56
88      92      54      2023-08-25 00:25:35
89      37      71      2022-03-25 05:41:40
90      53      76      2022-08-20 17:05:05
91      81      55      2022-07-22 08:15:50
92      16      9       2023-06-19 15:35:46
93      87      51      2023-03-13 06:36:41
94      40      5       2023-10-04 09:45:52
95      81      27      2022-10-29 17:58:36
96      50      50      2022-10-14 22:24:22
97      95      36      2022-08-15 04:54:15
98      23      44      2022-12-07 09:53:17
99      59      75      2021-12-14 00:01:16
100     52      85      2022-07-16 11:55:32
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: denis
--

COPY public.users (id, first_name, last_name, email, phone) FROM stdin;
1       Zorita  Castro  c.zorita@yandex.com     +7(887) 720-15-70
2       Perry   Hardin  perry_hardin@mail.com   +7(605) 596-18-98
3       Natalie Dillon  dillon_natalie@outlook.ru       +7(656) 432-28-02
4       Idona   Elliott idonaelliott@outlook.com        +7(944) 711-50-00
5       Hakeem  Conway  c.hakeem@google.ru      +7(986) 329-44-15
6       Silas   Cantrell        cantrell_silas@mail.ru  +7(773) 067-41-93
7       Joy     Whitehead       jwhitehead5548@outlook.ru       +7(119) 586-62-42
8       Brendan Cole    b_cole@yandex.com       +7(479) 108-39-93
9       Brandon Mcpherson       m-brandon@mail.ru       +7(856) 108-69-78
10      Jacqueline      Lucas   j-lucas@yandex.ru       +7(122) 768-52-85
11      Rana    Garrett garrett.rana@icloud.ru  +7(691) 139-47-97
12      Raphael Spencer spencerraphael2022@mail.com     +7(555) 085-37-69
13      Daria   Warren  d-warren2005@yandex.ru  +7(156) 338-53-74
14      Nehru   Carroll carrollnehru6904@mail.ru        +7(276) 945-23-14
15      Pamela  Rutledge        p_rutledge3267@yandex.ru        +7(922) 857-21-32
16      Akeem   Buck    a-buck@google.com       +7(682) 542-86-74
17      Cullen  Mckee   mckee_cullen@yandex.ru  +7(984) 338-54-55
18      Coby    Reese   reese-coby9212@yandex.ru        +7(493) 325-98-59
19      Dawn    Stephens        stephens.dawn6775@icloud.com    +7(016) 941-83-61
20      Maryam  Preston m_preston7381@google.ru +7(383) 475-69-19
21      Cruz    Livingston      livingston.cruz@outlook.ru      +7(007) 546-94-52
22      Drew    Vazquez dvazquez1813@google.com +7(354) 371-76-74
23      Noelani Mcmillan        m-noelani@yandex.ru     +7(279) 416-87-37
24      Drew    Dunn    ddunn@icloud.com        +7(767) 024-93-33
25      Yolanda Coleman coleman_yolanda@mail.com        +7(639) 781-74-78
26      Janna   Wilkins w_janna@google.com      +7(184) 381-50-73
27      Madeline        Mathews mmathews@icloud.ru      +7(244) 868-21-05
28      Hadley  Miranda mhadley@outlook.ru      +7(944) 975-72-69
29      Dolan   Keller  d_keller7578@icloud.com +7(285) 543-81-18
30      Merritt Burton  m_burton@icloud.com     +7(180) 693-92-65
31      Uriel   Rose    uriel.rose9122@mail.ru  +7(331) 427-12-82
32      Lucius  Pope    l.pope@icloud.com       +7(818) 224-88-79
33      Priscilla       Cervantes       p_cervantes3930@outlook.com     +7(233) 038-64-74
34      Jonas   Jarvis  jonas.jarvis@mail.ru    +7(772) 257-34-48
35      Kay     Mcleod  kay-mcleod@icloud.ru    +7(837) 654-21-94
36      Bert    Hopkins b.hopkins@icloud.com    +7(322) 766-45-98
37      Harding Burris  burrisharding1432@mail.com      +7(342) 216-40-73
38      Akeem   Mckee   m.akeem4505@icloud.ru   +7(194) 024-69-05
39      Ryder   Strong  strong_ryder@yandex.ru  +7(725) 740-82-00
40      Jade    Talley  j-talley@icloud.ru      +7(536) 495-48-43
41      Chava   Knight  chava.knight@outlook.ru +7(888) 872-87-12
42      Justina Ellison j-ellison@outlook.com   +7(153) 805-73-22
43      Riley   Farmer  farmer-riley@outlook.com        +7(226) 512-45-54
44      Zeus    Moss    moss_zeus@yandex.ru     +7(588) 682-76-28
45      Leo     Gilmore leo.gilmore4593@icloud.com      +7(065) 684-07-28
46      Salvador        Delgado salvador-delgado579@yandex.ru   +7(362) 743-77-48
47      Jacob   Bradshaw        bradshawjacob6457@icloud.ru     +7(522) 785-88-16
48      Roary   Mcmahon roary_mcmahon@icloud.ru +7(506) 856-89-42
49      Cassandra       Pearson c.pearson@yandex.com    +7(677) 194-64-78
50      Lev     Giles   giles-lev@icloud.com    +7(846) 350-51-83
51      Chase   Brown   chase.brown@outlook.com +7(365) 630-48-09
52      Kristen Stein   stein.kristen@yandex.com        +7(355) 745-67-73
53      Mechelle        Francis fmechelle@icloud.ru     +7(179) 789-75-74
54      Harrison        Sherman sherman.harrison7524@icloud.com +7(446) 386-26-65
55      Inez    Martinez        inez.martinez@icloud.com        +7(285) 718-42-08
56      Elizabeth       Cantu   c.elizabeth6843@mail.ru +7(571) 757-75-95
57      Faith   Weber   f.weber@icloud.ru       +7(867) 025-49-35
58      Amery   Rowe    a-rowe@yandex.ru        +7(465) 392-36-18
59      Brenden Andrews b-andrews@yandex.com    +7(779) 248-83-75
60      Prescott        Swanson p.swanson1422@outlook.ru        +7(564) 775-86-20
61      Willa   Solomon s-willa@google.ru       +7(419) 743-71-28
62      Fay     Ellis   ellis.fay@mail.ru       +7(176) 580-30-94
63      Axel    Hayes   a-hayes1698@outlook.ru  +7(745) 241-15-41
64      Jillian Perry   pjillian6460@outlook.com        +7(527) 124-24-25
65      Daphne  Graves  d.graves@icloud.com     +7(962) 276-44-74
66      Venus   Dickerson       d_venus@mail.ru +7(339) 944-74-81
67      Neville Burton  burton_neville7475@icloud.com   +7(518) 434-36-32
68      Randall Mercado mercado-randall@mail.ru +7(516) 792-36-67
69      Clarke  Juarez  cjuarez4364@outlook.com +7(234) 329-25-58
70      Lucian  Buckner bucknerlucian@outlook.ru        +7(394) 124-77-17
71      Stephanie       Snyder  stephanie.snyder@outlook.com    +7(517) 168-35-53
72      Ivan    Cardenas        cardenas-ivan5424@google.ru     +7(352) 286-77-73
73      Cleo    Bernard c_bernard@icloud.com    +7(712) 765-45-32
74      Demetria        Travis  tdemetria1440@yandex.com        +7(213) 866-76-10
75      Quinlan Cunningham      cunningham-quinlan@icloud.ru    +7(315) 500-20-98
76      Dominique       Allison d-allison4241@yandex.com        +7(519) 278-87-55
77      Thane   Huff    thane_huff@outlook.ru   +7(647) 121-91-52
78      Dominic Evans   evans_dominic1433@google.com    +7(174) 795-95-91
79      Cheyenne        Duncan  cduncan@google.com      +7(135) 023-54-62
80      Frances Flores  floresfrances@yandex.ru +7(855) 721-51-97
81      Oliver  Meyer   oliver_meyer2436@yandex.ru      +7(213) 430-04-46
82      Zenia   Manning manning_zenia6932@mail.com      +7(739) 306-62-58
83      Kasimir Justice justice.kasimir@yandex.ru       +7(523) 687-25-91
84      Rhona   Everett rhona_everett@mail.com  +7(462) 592-85-50
85      Rafael  Harmon  harmon_rafael2993@icloud.ru     +7(768) 138-56-66
86      Laith   White   lwhite@yandex.ru        +7(968) 030-98-62
87      Melanie Eaton   eaton_melanie@google.ru +7(647) 950-65-15
88      Hop     Pace    h_pace5361@mail.ru      +7(882) 386-71-29
89      Adena   Harvey  harveyadena@yandex.com  +7(775) 977-20-32
90      Hyacinth        Calderon        hyacinthcalderon6071@google.ru  +7(376) 421-59-38
91      Carter  Burton  burtoncarter9185@yandex.com     +7(857) 749-61-24
92      Cullen  Carpenter       carpenter-cullen756@mail.ru     +7(099) 689-59-82
93      TaShya  Gay     gaytashya@yandex.ru     +7(936) 362-28-53
94      Amelia  Lowery  loweryamelia7822@icloud.com     +7(894) 644-48-14
95      Maris   Reilly  m.reilly@yandex.ru      +7(863) 855-57-98
96      Barbara Avery   b.avery2619@icloud.ru   +7(335) 545-38-13
97      Rooney  Gentry  rgentry@outlook.ru      +7(841) 174-41-71
98      Kevyn   Patel   patel_kevyn4031@icloud.com      +7(385) 862-06-74
99      Kieran  Moore   moore-kieran@google.ru  +7(855) 625-85-38
100     Skyler  Welch   s_welch8259@icloud.ru   +7(961) 144-47-43
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denis
--

SELECT pg_catalog.setval('public.albums_id_seq', 100, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denis
--

SELECT pg_catalog.setval('public.genres_id_seq', 10, true);


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denis
--

SELECT pg_catalog.setval('public.playlists_id_seq', 100, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denis
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denis
--

SELECT pg_catalog.setval('public.songs_id_seq', 100, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denis
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: denis
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: albums albums_url_key; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_url_key UNIQUE (url);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (user_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: songs songs_url_key; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_url_key UNIQUE (url);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: denis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
