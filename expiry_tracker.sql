--
-- PostgreSQL database dump
--

\restrict GpJuTFFSZAg0DiIIAYeE4LtKgqKcFdNAgkw5NnHMcTQBOLCIeaL4XCf5jnKNl4m

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-07-19 19:52:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16386)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    category character varying(50),
    expiry_date date NOT NULL,
    is_consumed boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16385)
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 219
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;


--
-- TOC entry 4856 (class 2604 OID 16389)
-- Name: inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN id SET DEFAULT nextval('public.inventory_id_seq'::regclass);


--
-- TOC entry 5009 (class 0 OID 16386)
-- Dependencies: 220
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (id, name, category, expiry_date, is_consumed, created_at) FROM stdin;
1	Milk	Dairy	2026-07-30	t	2026-06-24 22:10:43.069188
2	rr	Vegetables	2026-06-10	t	2026-06-25 00:06:17.048532
3	rr	Vegetables	2026-06-10	t	2026-06-25 00:16:00.52808
4	rr	Vegetables	2026-06-10	t	2026-06-25 00:16:02.958623
5	rr	Vegetables	2026-06-10	t	2026-06-25 00:16:03.937679
6	rr	Vegetables	2026-06-10	t	2026-06-25 00:16:04.849613
7	rr	Vegetables	2026-06-10	t	2026-06-25 00:16:05.458065
8	rr	Vegetables	2026-06-10	t	2026-06-25 00:16:05.862277
11	gg	Fruits	2026-06-09	f	2026-06-25 00:32:52.043663
9	rr	Vegetables	2026-06-10	t	2026-06-25 00:16:06.193386
\.


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 219
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_id_seq', 11, true);


--
-- TOC entry 4860 (class 2606 OID 16396)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


-- Completed on 2026-07-19 19:52:56

--
-- PostgreSQL database dump complete
--

\unrestrict GpJuTFFSZAg0DiIIAYeE4LtKgqKcFdNAgkw5NnHMcTQBOLCIeaL4XCf5jnKNl4m

