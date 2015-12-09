--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: analyst; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE analyst (
    id integer NOT NULL
);


ALTER TABLE analyst OWNER TO irsyadnabil;

--
-- Name: app; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE app (
    version character varying(6) NOT NULL,
    date date NOT NULL
);


ALTER TABLE app OWNER TO irsyadnabil;

--
-- Name: app_designer; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE app_designer (
    id integer NOT NULL,
    email character varying(30),
    education text
);


ALTER TABLE app_designer OWNER TO irsyadnabil;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE customer (
    c_id integer NOT NULL,
    name character varying(30),
    email text,
    password text,
    username text,
    phone character varying(20),
    comment text,
    version text,
    rate integer
);


ALTER TABLE customer OWNER TO irsyadnabil;

--
-- Name: delivery; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE delivery (
    tr_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL,
    goods text NOT NULL
);


ALTER TABLE delivery OWNER TO irsyadnabil;

--
-- Name: driver; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE driver (
    id integer NOT NULL
);


ALTER TABLE driver OWNER TO irsyadnabil;

--
-- Name: driver_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadnabil
--

CREATE SEQUENCE driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE driver_id_seq OWNER TO irsyadnabil;

--
-- Name: driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadnabil
--

ALTER SEQUENCE driver_id_seq OWNED BY driver.id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE employee (
    id integer NOT NULL,
    s_id integer NOT NULL,
    name character varying(30) NOT NULL,
    dob date NOT NULL,
    phone character varying(20),
    address text,
    gender character varying(6) NOT NULL
);


ALTER TABLE employee OWNER TO irsyadnabil;

--
-- Name: food; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE food (
    tr_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL,
    menu_item text NOT NULL,
    restaurant text
);


ALTER TABLE food OWNER TO irsyadnabil;

--
-- Name: menu_item; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE menu_item (
    name text NOT NULL,
    restaurant text NOT NULL,
    price integer NOT NULL
);


ALTER TABLE menu_item OWNER TO irsyadnabil;

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: gujekadmin; Tablespace: 
--

CREATE TABLE ratings (
    c_id integer NOT NULL,
    version text NOT NULL,
    rate integer NOT NULL,
    comment text
);


ALTER TABLE ratings OWNER TO gujekadmin;

--
-- Name: restaurant; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE restaurant (
    name text NOT NULL,
    address text NOT NULL,
    phone character varying(20) NOT NULL
);


ALTER TABLE restaurant OWNER TO irsyadnabil;

--
-- Name: software_engineer; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE software_engineer (
    id integer NOT NULL
);


ALTER TABLE software_engineer OWNER TO irsyadnabil;

--
-- Name: supervisor; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE supervisor (
    id integer NOT NULL,
    email character varying(30) NOT NULL
);


ALTER TABLE supervisor OWNER TO irsyadnabil;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE transaction (
    tr_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL,
    d_id integer NOT NULL,
    c_id integer NOT NULL
);


ALTER TABLE transaction OWNER TO irsyadnabil;

--
-- Name: transport; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE transport (
    tr_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL,
    destination text NOT NULL
);


ALTER TABLE transport OWNER TO irsyadnabil;

--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE vehicle (
    d_id integer NOT NULL,
    license character varying(10) NOT NULL,
    type text NOT NULL,
    year integer NOT NULL
);


ALTER TABLE vehicle OWNER TO irsyadnabil;

--
-- Name: works_on; Type: TABLE; Schema: public; Owner: irsyadnabil; Tablespace: 
--

CREATE TABLE works_on (
    ad_id integer NOT NULL,
    version character varying(6) NOT NULL,
    date date NOT NULL
);


ALTER TABLE works_on OWNER TO irsyadnabil;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: irsyadnabil
--

ALTER TABLE ONLY driver ALTER COLUMN id SET DEFAULT nextval('driver_id_seq'::regclass);


--
-- Data for Name: analyst; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY analyst (id) FROM stdin;
1406546203
1406546191
\.


--
-- Data for Name: app; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY app (version, date) FROM stdin;
2.7.1	2015-07-30
2.8.0	2015-08-03
2.8.5	2015-08-17
3.0.0	2015-08-25
3.0.2	2015-10-12
3.2.0	2015-10-21
\.


--
-- Data for Name: app_designer; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY app_designer (id, email, education) FROM stdin;
1406546134	chadmadna@gmail.com	S.Kom, Institut Teknologi Bandung
1406546203	etaetong@gmail.com	Bachelor of I.T., University of Queensland
1406641703	rickstery24@gmail.com	M.T.I, Universitas Indonesia
1406641685	adhanherry@gmail.com	M.T.I, Universitas Indonesia
1406546191	rraihan.saputra@gmail.com	Bachelor of I.T., University of Queensland
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY customer (c_id, name, email, password, username, phone, comment, version, rate) FROM stdin;
61982997	Tono	tono.hartono96@gmail.com	22be2af5ddbde1b55cec8495414903317457c1d8a86a1f0139a79fb543900c6b	tonohartono	085233871043	Cacad app nya	2.7.1	1
61982553	Ani	ani_yudhoyono@live.com	325e3d237d60af4e7f64a865d3d55698ee27ffe9e36f2c1bfca2e772c2f571f1	ani_yudhoyono	081275150731	Alhamdulillah, now I have more time for my lovely family, photography, and Gujek.	2.4.5	5
61982920	Budi	ladiesman666@gmail.com	301eab054202f0ec11053a00dd9f1e6be7b9f48d75f3f39e38df2e0959688241	ladiesmann66	081644015676	Mantap gujek lanjutkan	2.7.0	4
61983108	Tini	xx_bullet2myh3art_xx@rocketmail.com	b0681dd399f0149277c33a0b44eb065d4430b097e1ab704e7fb85cf135fbc47f	xX_scen3gr0upie_Xx	081364647510	How do I even?????????	2.7.1	2
\.


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY delivery (tr_id, "time", goods) FROM stdin;
991635	2015-01-02 13:09:46	Berkas medical record
991656	2015-11-09 01:46:35	Tas isi baju ganti
991742	2015-12-10 23:08:39	Bunga dan kue ulang tahun
991548	2015-05-03 22:52:14	Handphone Samsung Galaxy S5
\.


--
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY driver (id) FROM stdin;
1406546140
1406546153
1406546166
1406546172
1406641621
1406641653
1406641666
1406641691
1406641722
\.


--
-- Name: driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadnabil
--

SELECT pg_catalog.setval('driver_id_seq', 1, false);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY employee (id, s_id, name, dob, phone, address, gender) FROM stdin;
1406546140	1406641602	Faris Agianda	1996-09-27	081310718950	Pondok Indah	Male
1406546153	1406641602	Meta Andrini	1996-02-17	081585014575	Lebak Bulus	Female
1406546166	1406641602	Bimo Prabowo	1996-05-15	081280642040	Pasar Minggu	Male
1406546172	1406641602	Amelia Rahastiyani	1997-03-19	081294963805	Depok	Female
1406641602	1406641602	Agazsi Bahasoean	1995-07-07	081319901093	Brawijaya	Male
1406641621	1406641602	Favian Cyrilvarick	1997-10-09	082216182816	Bekasi	Male
1406641653	1406641602	Isaac Raynald	1996-06-24	02133180011	Kukusan	Male
1406641666	1406641602	Kristofer Anandita	1996-06-13	081905970100	Serpong	Male
1406641691	1406641602	Revinaldy Emirza	1996-07-30	089651173764	Tebet	Male
1406641722	1406641602	Wahyu Rachmadityo	1996-06-14	08128849520	Cawang	Male
1406546134	1406546185	Irsyad Nabil	1996-02-29	081364017584	Margonda	Male
1406546185	1406546185	Farras Apsari	1996-09-20	081389100426	Depok	Female
1406546191	1406546185	Raihan Saputra	1996-08-07	087880716034	Kuningan	Male
1406546203	1406546185	Velta Azizah	1996-12-01	082211575363	Jagakarsa	Female
1406641685	1406546185	Rahmat Ramadhan	1997-08-28	085656308892	Margonda	Male
1406641703	1406546185	Ricky Arkan	1996-01-11	082124012394	Ragunan	Male
\.


--
-- Data for Name: food; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY food (tr_id, "time", menu_item, restaurant) FROM stdin;
991582	2015-08-12 08:27:57	Pappardelle with Mushrooms	1/15 Coffee Gandaria
991582	2015-08-12 08:27:57	Supercrunch Tofu Tacos	1/15 Coffee Gandaria
991582	2015-08-12 08:27:57	Penne with Herbs and Tomatoes	1/15 Coffee Gandaria
991579	2015-07-10 11:11:24	Chargrilled Aubergine Rolls	Fish & Co. Tebet
991579	2015-07-10 11:11:24	Fish and Chips	Fish & Co. Tebet
991579	2015-07-10 11:11:24	Fish Pie	Fish & Co. Tebet
991690	2015-01-11 20:53:12	Mushroom Dabu-dabu Rice with Sirloin	Toodz House
991690	2015-01-11 20:53:12	Carbonara Rice with Mushroom and Basil	Toodz House
991690	2015-01-11 20:53:12	Iced Lemon Tea	Toodz House
991796	2015-11-21 16:00:44	Ayam Goreng Istimewa	Ikan Bakar Cianjur Pecenongan
991796	2015-11-21 16:00:44	Udang Goreng Tepung	Ikan Bakar Cianjur Pecenongan
991796	2015-11-21 16:00:44	Sayur Bayam	Ikan Bakar Cianjur Pecenongan
\.


--
-- Data for Name: menu_item; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY menu_item (name, restaurant, price) FROM stdin;
Ayam Goreng Istimewa	Ikan Bakar Cianjur Pecenongan	24000
Udang Goreng Tepung	Ikan Bakar Cianjur Pecenongan	30000
Sayur Bayam	Ikan Bakar Cianjur Pecenongan	22000
Pappardelle with Mushrooms	1/15 Coffee Gandaria	36000
Supercrunch Tofu Tacos	1/15 Coffee Gandaria	28000
Penne with Herbs and Tomatoes	1/15 Coffee Gandaria	34000
Chargrilled Aubergine Rolls	Fish & Co. Tebet	42000
Fish and Chips	Fish & Co. Tebet	48000
Fish Pie	Fish & Co. Tebet	35000
Mushroom Dabu-dabu Rice with Sirloin	Toodz House	48000
Carbonara Rice with Mushroom and Basil	Toodz House	32000
Iced Lemon Tea	Toodz House	19000
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: gujekadmin
--

COPY ratings (c_id, version, rate, comment) FROM stdin;
61982997	2.7.1	1	Cacad app nya
61982553	2.4.5	5	Alhamdulillah, now I have more time for my lovely family, photography, and Gujek.
61982920	2.7.0	4	Mantap gujek lanjutkan
61983108	2.7.1	2	How do I even?????????
\.


--
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY restaurant (name, address, phone) FROM stdin;
Toodz House	Jl. Cipete Raya No. 79, Fatmawati, Jakarta	02129704981,104
Tokyo Belly Thamrin	Grand Indonesia Mall, Lantai 3A, West Mall, Jl. MH Thamrin, Thamrin, Jakarta	02123581090
1/15 Coffee Gandaria	Jl. Gandaria I No. 63, Gandaria, Jakarta	0217225678
Fish & Co. Tebet	Kota Kasablanka, Lantai Ground, Food Society, Jl. Casablanca Raya, Tebet, Jakarta	02129488707
Ikan Bakar Cianjur Pecenongan	Jl. Batu Tulis Raya No. 39, Pecenongan, Jakarta	0213507788
Tjap Toean Sudirman	fX Sudirman, Lantai F1, Jl. Jenderal Sudirman, Sudirman, Jakarta	02125554158
\.


--
-- Data for Name: software_engineer; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY software_engineer (id) FROM stdin;
1406641703
1406546134
1406641685
\.


--
-- Data for Name: supervisor; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY supervisor (id, email) FROM stdin;
1406546185	farrasap01@gmail.com
1406641602	agazsi.bahasoean@hotmail.com
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY transaction (tr_id, "time", d_id, c_id) FROM stdin;
991635	2015-01-02 13:09:46	1406546140	61982553
991656	2015-11-09 01:46:35	1406546153	61982997
991742	2015-12-10 23:08:39	1406641621	61982553
991548	2015-05-03 22:52:14	1406641666	61983108
991845	2015-07-08 23:41:01	1406641691	61982920
991639	2016-01-09 15:10:45	1406641653	61983108
991732	2015-10-09 03:08:18	1406546153	61982920
991757	2015-09-27 05:30:28	1406546140	61983108
991796	2015-11-21 16:00:44	1406641722	61982553
991582	2015-08-12 08:27:57	1406546166	61982997
991579	2015-07-10 11:11:24	1406546172	61982997
991690	2015-01-11 20:53:12	1406641621	61982920
\.


--
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY transport (tr_id, "time", destination) FROM stdin;
991845	2015-07-08 23:41:01	Plaza Senayan
991639	2016-01-09 15:10:45	Jl. Madrasah Buntu No. 12
991732	2015-10-09 03:08:18	1/15 Coffee Gandaria
991757	2015-09-27 05:30:28	Fasilkom Universitas Indonesia
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY vehicle (d_id, license, type, year) FROM stdin;
1406546166	B 9001 YTF	Yamaha Vixion	2013
1406641666	B 1762 GWP	Suzuki Satria	2012
1406641621	B 109 TTY	Kawasaki Ninja	2011
1406641691	B 4013 SOK	Yamaha Jupiter Z1	2015
1406641653	B 7179 LEL	Honda Blade FI	2009
1406546140	B 3009 ECX	Honda Supra X	2008
1406641722	B 5242 RFT	Honda Vario	2014
1406546153	B 1093 STE	Yamaha RX King	2009
1406546172	B 2129 EDF	Honda Verza	2011
\.


--
-- Data for Name: works_on; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY works_on (ad_id, version, date) FROM stdin;
1406546134	2.7.1	2015-07-30
1406546134	2.8.0	2015-08-03
1406546134	3.0.0	2015-08-25
1406546203	2.8.5	2015-08-17
1406546203	3.0.0	2015-08-25
1406546203	3.0.2	2015-10-12
1406641685	2.8.0	2015-08-03
1406641685	3.2.0	2015-10-21
1406641703	2.7.1	2015-07-30
1406641703	3.0.0	2015-08-25
1406641703	3.0.2	2015-10-12
1406641703	3.2.0	2015-10-21
\.


--
-- Name: analyst_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY analyst
    ADD CONSTRAINT analyst_pkey PRIMARY KEY (id);


--
-- Name: app_designer_id_key; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY app_designer
    ADD CONSTRAINT app_designer_id_key UNIQUE (id);


--
-- Name: app_designer_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY app_designer
    ADD CONSTRAINT app_designer_pkey PRIMARY KEY (id);


--
-- Name: app_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY app
    ADD CONSTRAINT app_pkey PRIMARY KEY (version, date);


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (c_id);


--
-- Name: delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY ("time", tr_id);


--
-- Name: driver_id_key; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY driver
    ADD CONSTRAINT driver_id_key UNIQUE (id);


--
-- Name: driver_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id);


--
-- Name: employee_id_key; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_id_key UNIQUE (id);


--
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: food_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY food
    ADD CONSTRAINT food_pkey PRIMARY KEY (tr_id, "time", menu_item);


--
-- Name: menu_item_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY menu_item
    ADD CONSTRAINT menu_item_pkey PRIMARY KEY (name, restaurant);


--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: gujekadmin; Tablespace: 
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (c_id);


--
-- Name: restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (name);


--
-- Name: software_engineer_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY software_engineer
    ADD CONSTRAINT software_engineer_pkey PRIMARY KEY (id);


--
-- Name: supervisor_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY supervisor
    ADD CONSTRAINT supervisor_pkey PRIMARY KEY (id, email);


--
-- Name: transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (tr_id, "time");


--
-- Name: transaction_time_key; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_time_key UNIQUE ("time");


--
-- Name: transport_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (tr_id, "time");


--
-- Name: vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (d_id, license);


--
-- Name: works_on_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadnabil; Tablespace: 
--

ALTER TABLE ONLY works_on
    ADD CONSTRAINT works_on_pkey PRIMARY KEY (ad_id, version, date);


--
-- Name: analyst_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: irsyadnabil
--

ALTER TABLE ONLY analyst
    ADD CONSTRAINT analyst_id_fkey FOREIGN KEY (id) REFERENCES app_designer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: app_designer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: irsyadnabil
--

ALTER TABLE ONLY app_designer
    ADD CONSTRAINT app_designer_id_fkey FOREIGN KEY (id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: irsyadnabil
--

ALTER TABLE ONLY driver
    ADD CONSTRAINT driver_id_fkey FOREIGN KEY (id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: irsyadnabil
--

ALTER TABLE ONLY food
    ADD CONSTRAINT menu_fkey FOREIGN KEY (menu_item, restaurant) REFERENCES menu_item(name, restaurant);


--
-- Name: menu_restaurant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: irsyadnabil
--

ALTER TABLE ONLY menu_item
    ADD CONSTRAINT menu_restaurant_fkey FOREIGN KEY (restaurant) REFERENCES restaurant(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ratings_c_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gujekadmin
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_c_id_fkey FOREIGN KEY (c_id) REFERENCES customer(c_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: software_engineer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: irsyadnabil
--

ALTER TABLE ONLY software_engineer
    ADD CONSTRAINT software_engineer_id_fkey FOREIGN KEY (id) REFERENCES app_designer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transaction_cust_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: irsyadnabil
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_cust_no_fkey FOREIGN KEY (c_id) REFERENCES customer(c_id);


--
-- Name: transaction_d_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: irsyadnabil
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_d_id_fkey FOREIGN KEY (d_id) REFERENCES driver(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: irsyadnabil
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM irsyadnabil;
GRANT ALL ON SCHEMA public TO irsyadnabil;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

