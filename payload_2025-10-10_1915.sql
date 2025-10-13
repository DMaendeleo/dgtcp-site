--
-- PostgreSQL database dump
--

\restrict vbPqtwchlR1jX8gUT8Sgcb0qImJiN1ac6ma4xgqgtVKF1Fo5bbcEkpnC1O7UZC4

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 16.10 (Debian 16.10-1.pgdg13+1)

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
-- Name: annonces; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.annonces (
    id integer NOT NULL,
    headline character varying NOT NULL,
    subheadline character varying,
    image_id integer,
    description character varying NOT NULL,
    slug character varying,
    localisation character varying NOT NULL,
    year numeric NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.annonces OWNER TO "payload_root-user";

--
-- Name: annonces_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.annonces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.annonces_id_seq OWNER TO "payload_root-user";

--
-- Name: annonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.annonces_id_seq OWNED BY public.annonces.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.media (
    id integer NOT NULL,
    nom character varying NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    thumbnail_u_r_l character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric
);


ALTER TABLE public.media OWNER TO "payload_root-user";

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_id_seq OWNER TO "payload_root-user";

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: partenaire; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.partenaire (
    id integer NOT NULL,
    image_id integer NOT NULL,
    sigle character varying,
    name character varying NOT NULL,
    site character varying NOT NULL,
    description character varying NOT NULL,
    conlusion character varying NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.partenaire OWNER TO "payload_root-user";

--
-- Name: partenaire_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.partenaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partenaire_id_seq OWNER TO "payload_root-user";

--
-- Name: partenaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.partenaire_id_seq OWNED BY public.partenaire.id;


--
-- Name: payload_locked_documents; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.payload_locked_documents (
    id integer NOT NULL,
    global_slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_locked_documents OWNER TO "payload_root-user";

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.payload_locked_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_locked_documents_id_seq OWNER TO "payload_root-user";

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.payload_locked_documents_id_seq OWNED BY public.payload_locked_documents.id;


--
-- Name: payload_locked_documents_rels; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.payload_locked_documents_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer,
    media_id integer,
    rapports_id integer,
    annonces_id integer,
    partenaire_id integer
);


ALTER TABLE public.payload_locked_documents_rels OWNER TO "payload_root-user";

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.payload_locked_documents_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNER TO "payload_root-user";

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNED BY public.payload_locked_documents_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_migrations OWNER TO "payload_root-user";

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_migrations_id_seq OWNER TO "payload_root-user";

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_preferences OWNER TO "payload_root-user";

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_id_seq OWNER TO "payload_root-user";

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE public.payload_preferences_rels OWNER TO "payload_root-user";

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNER TO "payload_root-user";

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: rapports; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.rapports (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    year numeric NOT NULL,
    date_uploaded timestamp(3) with time zone,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    thumbnail_u_r_l character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric
);


ALTER TABLE public.rapports OWNER TO "payload_root-user";

--
-- Name: rapports_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.rapports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rapports_id_seq OWNER TO "payload_root-user";

--
-- Name: rapports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.rapports_id_seq OWNED BY public.rapports.id;


--
-- Name: site_header; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.site_header (
    id integer NOT NULL,
    logo_id integer NOT NULL,
    cta_label character varying,
    cta_href character varying,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.site_header OWNER TO "payload_root-user";

--
-- Name: site_header_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.site_header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_header_id_seq OWNER TO "payload_root-user";

--
-- Name: site_header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.site_header_id_seq OWNED BY public.site_header.id;


--
-- Name: site_header_links; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.site_header_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    label character varying NOT NULL,
    href character varying NOT NULL,
    external boolean DEFAULT false
);


ALTER TABLE public.site_header_links OWNER TO "payload_root-user";

--
-- Name: site_header_links_children; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.site_header_links_children (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    label character varying NOT NULL,
    href character varying NOT NULL,
    external boolean DEFAULT false
);


ALTER TABLE public.site_header_links_children OWNER TO "payload_root-user";

--
-- Name: users; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric DEFAULT 0,
    lock_until timestamp(3) with time zone
);


ALTER TABLE public.users OWNER TO "payload_root-user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: payload_root-user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO "payload_root-user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload_root-user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_sessions; Type: TABLE; Schema: public; Owner: payload_root-user
--

CREATE TABLE public.users_sessions (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    created_at timestamp(3) with time zone,
    expires_at timestamp(3) with time zone NOT NULL
);


ALTER TABLE public.users_sessions OWNER TO "payload_root-user";

--
-- Name: annonces id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.annonces ALTER COLUMN id SET DEFAULT nextval('public.annonces_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: partenaire id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.partenaire ALTER COLUMN id SET DEFAULT nextval('public.partenaire_id_seq'::regclass);


--
-- Name: payload_locked_documents id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_id_seq'::regclass);


--
-- Name: payload_locked_documents_rels id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: rapports id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.rapports ALTER COLUMN id SET DEFAULT nextval('public.rapports_id_seq'::regclass);


--
-- Name: site_header id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.site_header ALTER COLUMN id SET DEFAULT nextval('public.site_header_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: annonces; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.annonces (id, headline, subheadline, image_id, description, slug, localisation, year, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.media (id, nom, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y) FROM stdin;
\.


--
-- Data for Name: partenaire; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.partenaire (id, image_id, sigle, name, site, description, conlusion, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: payload_locked_documents; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.payload_locked_documents (id, global_slug, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: payload_locked_documents_rels; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.payload_locked_documents_rels (id, "order", parent_id, path, users_id, media_id, rapports_id, annonces_id, partenaire_id) FROM stdin;
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	20251008_133918	1	2025-10-10 17:36:24.675+00	2025-10-10 17:36:24.674+00
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
1	collection-annonces	{}	2025-10-10 17:38:45.458+00	2025-10-10 17:38:45.458+00
2	collection-rapports	{}	2025-10-10 17:39:02.396+00	2025-10-10 17:39:02.396+00
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
1	\N	1	user	1
2	\N	2	user	1
\.


--
-- Data for Name: rapports; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.rapports (id, title, description, year, date_uploaded, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y) FROM stdin;
1	Betpawa - influencers Selection & Budget - Re	Betpawa - influencers Selection & Budget - Re	2025	2025-10-10 17:39:15.374+00	2025-10-10 17:39:15.379+00	2025-10-10 17:39:15.379+00	\N	\N	Betpawa - influencers Selection & Budget - Rev.pdf	application/pdf	843450	\N	\N	\N	\N
\.


--
-- Data for Name: site_header; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.site_header (id, logo_id, cta_label, cta_href, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: site_header_links; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.site_header_links (_order, _parent_id, id, label, href, external) FROM stdin;
\.


--
-- Data for Name: site_header_links_children; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.site_header_links_children (_order, _parent_id, id, label, href, external) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.users (id, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until) FROM stdin;
1	2025-10-10 17:38:44.257+00	2025-10-10 17:38:44.162+00	dan@mtech-studios.com	\N	\N	931668da49ddbbb20e27acd7e9f9529e106c103a70ee42e5fb744289d21e0eb6	9a8d312b93546416e8ffdebca1ed24202d9ae799c40100fd37ad2c43a9cbb9fa92250737e5bf3cc3446472ce7be7b964eb7e73f94f22ce6156f2507aa44ba3c7999fc4e6b6b5d8197d5f087951a777b3eb7a8875352c7525158078c3eb88309ba6f5ced4e1c03a9805777e6f8330508dd5e594fbb84c3b7f8393e1422f3b3ef21cb3691494337c4bc304be790d8ff5e179f610d68c3b29629fbe67cb11a0788380b4f70a5902bad672a2058f077f035bb7f38a38268d499575b3c066757a6d22449186a907b9565b89a692e063cd776c1976689f2f958a03c6235eac6af4ce3d0bd7a57da21f2647816e3398c68fb9af78f40a976463b07c6678283b20a4b8ea949f574be239cd17f59756bd62755263117516688b71f517181cec90f418e8eecfef6c9b3f43e10dff6a253cd9dd5fbdc2eace232ddf96ba515c89b4ab9ca6181d1bc963907815615b889c3f42280ea6137b42b135da8a18ef16417cb7ed7ec59c752c2adbae286b8daf16239779ddd5def2e277b15b37cdb4a9cac4b3aa587070c6dd8847ab86216258af4aea86fbe0e411691b1b720792ab96ea32f6604f5668c812c5b4e38286979174385d46b21391f32c9824bce04a57aa50c523fd7f76bb70461d4f3795170c5c7eb172b0f2a9088a3853b8c3f7f324bebbebf5af3a2043518243f80bce37cdf5eec61c90ffb9d81ae5b338ba558a5a104a729f6d5ff3	0	\N
\.


--
-- Data for Name: users_sessions; Type: TABLE DATA; Schema: public; Owner: payload_root-user
--

COPY public.users_sessions (_order, _parent_id, id, created_at, expires_at) FROM stdin;
1	1	801d4038-25b1-471c-b75e-ddb3460a4e55	2025-10-10 17:38:44.257+00	2025-10-10 19:38:44.257+00
\.


--
-- Name: annonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.annonces_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.media_id_seq', 1, false);


--
-- Name: partenaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.partenaire_id_seq', 1, false);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.payload_locked_documents_id_seq', 1, false);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.payload_locked_documents_rels_id_seq', 1, false);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 2, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 2, true);


--
-- Name: rapports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.rapports_id_seq', 1, true);


--
-- Name: site_header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.site_header_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload_root-user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: annonces annonces_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.annonces
    ADD CONSTRAINT annonces_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: partenaire partenaire_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.partenaire
    ADD CONSTRAINT partenaire_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents payload_locked_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents
    ADD CONSTRAINT payload_locked_documents_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: rapports rapports_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.rapports
    ADD CONSTRAINT rapports_pkey PRIMARY KEY (id);


--
-- Name: site_header_links_children site_header_links_children_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.site_header_links_children
    ADD CONSTRAINT site_header_links_children_pkey PRIMARY KEY (id);


--
-- Name: site_header_links site_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.site_header_links
    ADD CONSTRAINT site_header_links_pkey PRIMARY KEY (id);


--
-- Name: site_header site_header_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.site_header
    ADD CONSTRAINT site_header_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_sessions users_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_pkey PRIMARY KEY (id);


--
-- Name: annonces_created_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX annonces_created_at_idx ON public.annonces USING btree (created_at);


--
-- Name: annonces_image_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX annonces_image_idx ON public.annonces USING btree (image_id);


--
-- Name: annonces_slug_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX annonces_slug_idx ON public.annonces USING btree (slug);


--
-- Name: annonces_updated_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX annonces_updated_at_idx ON public.annonces USING btree (updated_at);


--
-- Name: annonces_year_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX annonces_year_idx ON public.annonces USING btree (year);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);


--
-- Name: media_updated_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX media_updated_at_idx ON public.media USING btree (updated_at);


--
-- Name: partenaire_created_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX partenaire_created_at_idx ON public.partenaire USING btree (created_at);


--
-- Name: partenaire_image_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX partenaire_image_idx ON public.partenaire USING btree (image_id);


--
-- Name: partenaire_updated_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX partenaire_updated_at_idx ON public.partenaire USING btree (updated_at);


--
-- Name: payload_locked_documents_created_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_created_at_idx ON public.payload_locked_documents USING btree (created_at);


--
-- Name: payload_locked_documents_global_slug_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_global_slug_idx ON public.payload_locked_documents USING btree (global_slug);


--
-- Name: payload_locked_documents_rels_annonces_id_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_rels_annonces_id_idx ON public.payload_locked_documents_rels USING btree (annonces_id);


--
-- Name: payload_locked_documents_rels_media_id_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_rels_media_id_idx ON public.payload_locked_documents_rels USING btree (media_id);


--
-- Name: payload_locked_documents_rels_order_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_rels_order_idx ON public.payload_locked_documents_rels USING btree ("order");


--
-- Name: payload_locked_documents_rels_parent_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_rels_parent_idx ON public.payload_locked_documents_rels USING btree (parent_id);


--
-- Name: payload_locked_documents_rels_partenaire_id_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_rels_partenaire_id_idx ON public.payload_locked_documents_rels USING btree (partenaire_id);


--
-- Name: payload_locked_documents_rels_path_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_rels_path_idx ON public.payload_locked_documents_rels USING btree (path);


--
-- Name: payload_locked_documents_rels_rapports_id_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_rels_rapports_id_idx ON public.payload_locked_documents_rels USING btree (rapports_id);


--
-- Name: payload_locked_documents_rels_users_id_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_rels_users_id_idx ON public.payload_locked_documents_rels USING btree (users_id);


--
-- Name: payload_locked_documents_updated_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_locked_documents_updated_at_idx ON public.payload_locked_documents USING btree (updated_at);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);


--
-- Name: payload_migrations_updated_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_migrations_updated_at_idx ON public.payload_migrations USING btree (updated_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);


--
-- Name: payload_preferences_updated_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX payload_preferences_updated_at_idx ON public.payload_preferences USING btree (updated_at);


--
-- Name: rapports_created_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX rapports_created_at_idx ON public.rapports USING btree (created_at);


--
-- Name: rapports_filename_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE UNIQUE INDEX rapports_filename_idx ON public.rapports USING btree (filename);


--
-- Name: rapports_updated_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX rapports_updated_at_idx ON public.rapports USING btree (updated_at);


--
-- Name: rapports_year_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX rapports_year_idx ON public.rapports USING btree (year);


--
-- Name: site_header_links_children_order_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX site_header_links_children_order_idx ON public.site_header_links_children USING btree (_order);


--
-- Name: site_header_links_children_parent_id_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX site_header_links_children_parent_id_idx ON public.site_header_links_children USING btree (_parent_id);


--
-- Name: site_header_links_order_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX site_header_links_order_idx ON public.site_header_links USING btree (_order);


--
-- Name: site_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX site_header_links_parent_id_idx ON public.site_header_links USING btree (_parent_id);


--
-- Name: site_header_logo_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX site_header_logo_idx ON public.site_header USING btree (logo_id);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_sessions_order_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX users_sessions_order_idx ON public.users_sessions USING btree (_order);


--
-- Name: users_sessions_parent_id_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX users_sessions_parent_id_idx ON public.users_sessions USING btree (_parent_id);


--
-- Name: users_updated_at_idx; Type: INDEX; Schema: public; Owner: payload_root-user
--

CREATE INDEX users_updated_at_idx ON public.users USING btree (updated_at);


--
-- Name: annonces annonces_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.annonces
    ADD CONSTRAINT annonces_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: partenaire partenaire_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.partenaire
    ADD CONSTRAINT partenaire_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_annonces_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_annonces_fk FOREIGN KEY (annonces_id) REFERENCES public.annonces(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_locked_documents(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_partenaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_partenaire_fk FOREIGN KEY (partenaire_id) REFERENCES public.partenaire(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_rapports_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_rapports_fk FOREIGN KEY (rapports_id) REFERENCES public.rapports(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: site_header_links_children site_header_links_children_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.site_header_links_children
    ADD CONSTRAINT site_header_links_children_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.site_header_links(id) ON DELETE CASCADE;


--
-- Name: site_header_links site_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.site_header_links
    ADD CONSTRAINT site_header_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.site_header(id) ON DELETE CASCADE;


--
-- Name: site_header site_header_logo_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.site_header
    ADD CONSTRAINT site_header_logo_id_media_id_fk FOREIGN KEY (logo_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: users_sessions users_sessions_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload_root-user
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict vbPqtwchlR1jX8gUT8Sgcb0qImJiN1ac6ma4xgqgtVKF1Fo5bbcEkpnC1O7UZC4

