--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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
-- Name: computer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.computer (
    comp_id integer NOT NULL,
    ip_address character varying(50),
    mac_address character varying(50),
    user_id integer
);


--
-- Name: computer_comp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.computer_comp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: computer_comp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.computer_comp_id_seq OWNED BY public.computer.comp_id;


--
-- Name: db_inda_ciobanu_matei_raw; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.db_inda_ciobanu_matei_raw (
    first_name character varying(20),
    last_name character varying(10),
    personal_number bigint,
    birthdate character varying(10),
    address character varying(100),
    phone_number character varying(20),
    mac_address character varying(20),
    ip_address character varying(20),
    iban character varying(30),
    currency character varying(10),
    user_id integer NOT NULL
);


--
-- Name: db_inda_ciobanu_matei_raw_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.db_inda_ciobanu_matei_raw_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: db_inda_ciobanu_matei_raw_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.db_inda_ciobanu_matei_raw_user_id_seq OWNED BY public.db_inda_ciobanu_matei_raw.user_id;


--
-- Name: economic; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.economic (
    bank_id integer NOT NULL,
    iban character varying(50),
    currency character varying(50),
    user_id integer
);


--
-- Name: economic_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.economic_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: economic_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.economic_bank_id_seq OWNED BY public.economic.bank_id;


--
-- Name: personal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personal (
    personal_id integer NOT NULL,
    personal_number character varying(13),
    birthdate character varying(20),
    address character varying(200),
    phone_number character varying(20),
    user_id integer
);


--
-- Name: personal_personal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personal_personal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personal_personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personal_personal_id_seq OWNED BY public.personal.personal_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    last_name character varying(10),
    first_name character varying(20)
);


--
-- Name: computer comp_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.computer ALTER COLUMN comp_id SET DEFAULT nextval('public.computer_comp_id_seq'::regclass);


--
-- Name: db_inda_ciobanu_matei_raw user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.db_inda_ciobanu_matei_raw ALTER COLUMN user_id SET DEFAULT nextval('public.db_inda_ciobanu_matei_raw_user_id_seq'::regclass);


--
-- Name: economic bank_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.economic ALTER COLUMN bank_id SET DEFAULT nextval('public.economic_bank_id_seq'::regclass);


--
-- Name: personal personal_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal ALTER COLUMN personal_id SET DEFAULT nextval('public.personal_personal_id_seq'::regclass);


--
-- Name: computer computer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.computer
    ADD CONSTRAINT computer_pkey PRIMARY KEY (comp_id);


--
-- Name: db_inda_ciobanu_matei_raw db_inda_ciobanu_matei_raw_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.db_inda_ciobanu_matei_raw
    ADD CONSTRAINT db_inda_ciobanu_matei_raw_pkey PRIMARY KEY (user_id);


--
-- Name: users db_inda_ciobanu_matei_raw_user_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT db_inda_ciobanu_matei_raw_user_id_pk PRIMARY KEY (user_id);


--
-- Name: economic economic_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.economic
    ADD CONSTRAINT economic_pkey PRIMARY KEY (bank_id);


--
-- Name: personal personal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (personal_id);


--
-- Name: computer computer_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.computer
    ADD CONSTRAINT computer_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: economic economic_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.economic
    ADD CONSTRAINT economic_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: personal personal_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

