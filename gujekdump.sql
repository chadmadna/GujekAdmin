--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

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
-- Data for Name: food; Type: TABLE DATA; Schema: public; Owner: irsyadnabil
--

COPY food (tr_id, "time", menu_item) FROM stdin;
991796	2015-11-21 16:00:44	Ayam Goreng Istimewa
991796	2015-11-21 16:00:44	Udang Goreng Tepung
991796	2015-11-21 16:00:44	Sayur Bayam
991582	2015-08-12 08:27:57	Pappardelle with Mushrooms
991582	2015-08-12 08:27:57	Supercrunch Tofu Tacos
991582	2015-08-12 08:27:57	Penne with Herbs and Tomatoes
991579	2015-07-10 11:11:24	Chargrilled Aubergine Rolls
991579	2015-07-10 11:11:24	Fish and Chips
991579	2015-07-10 11:11:24	Fish Pie
991690	2015-01-11 20:53:12	Mushroom Dabu-dabu Rice with Sirloin
991690	2015-01-11 20:53:12	Carbonara Rice with Mushroom and Basil
991690	2015-01-11 20:53:12	Iced Lemon Tea
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
-- PostgreSQL database dump complete
--

