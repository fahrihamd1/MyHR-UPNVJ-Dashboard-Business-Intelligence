--
-- PostgreSQL database dump
--

\restrict QhdZcaabsSoF81GokHXphx61B8cyE59dQ5Ce6Aa29xMhG1G0ZQh3qg8bjIkVY3g

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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
-- Name: anak; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.anak (
    id_anak integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    nama_anak character varying(100) NOT NULL,
    tempat_lahir character varying(50) NOT NULL,
    tanggal_lahir date NOT NULL,
    jenis_kelamin character varying(10) NOT NULL,
    no_akta_lahir character varying(50) NOT NULL,
    status_anak character varying(30) NOT NULL,
    pendidikan character varying(50) NOT NULL
);


ALTER TABLE public.anak OWNER TO postgres;

--
-- Name: anak_id_anak_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.anak_id_anak_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.anak_id_anak_seq OWNER TO postgres;

--
-- Name: anak_id_anak_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.anak_id_anak_seq OWNED BY public.anak.id_anak;


--
-- Name: data_pegawai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_pegawai (
    id_pegawai character varying(20) NOT NULL,
    nip character varying(30) NOT NULL,
    nama_lengkap character varying(100) NOT NULL,
    tempat_lahir character varying(50) NOT NULL,
    tanggal_lahir date NOT NULL,
    jenis_kelamin character varying(10) NOT NULL,
    agama character varying(20) NOT NULL,
    status_nikah character varying(20) NOT NULL,
    alamat text NOT NULL,
    no_telepon character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    npwp character varying(25) NOT NULL,
    no_ktp character varying(20) NOT NULL,
    unit_kerja character varying(100) NOT NULL,
    status_pegawai character varying(30) NOT NULL,
    tanggal_masuk date NOT NULL
);


ALTER TABLE public.data_pegawai OWNER TO postgres;

--
-- Name: hubungan_kerja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hubungan_kerja (
    id_hubker integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    jenis_hubungan character varying(50) NOT NULL,
    no_kontrak character varying(60) NOT NULL,
    tanggal_mulai date NOT NULL,
    tanggal_selesai date NOT NULL,
    jabatan character varying(150) NOT NULL,
    unit_kerja character varying(100) NOT NULL,
    gaji_pokok bigint NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.hubungan_kerja OWNER TO postgres;

--
-- Name: hubungan_kerja_id_hubker_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hubungan_kerja_id_hubker_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hubungan_kerja_id_hubker_seq OWNER TO postgres;

--
-- Name: hubungan_kerja_id_hubker_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hubungan_kerja_id_hubker_seq OWNED BY public.hubungan_kerja.id_hubker;


--
-- Name: jabatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jabatan (
    id_jabatan integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    nama_jabatan character varying(150) NOT NULL,
    jenis_jabatan character varying(50) NOT NULL,
    unit_kerja character varying(100) NOT NULL,
    tmt_jabatan date NOT NULL,
    no_sk_jabatan character varying(60) NOT NULL,
    tanggal_sk date NOT NULL,
    status_jabatan character varying(20) NOT NULL
);


ALTER TABLE public.jabatan OWNER TO postgres;

--
-- Name: jabatan_bendahara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jabatan_bendahara (
    id_bendahara integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    jenis_bendahara character varying(100) NOT NULL,
    unit_kerja character varying(100) NOT NULL,
    tmt_bendahara date NOT NULL,
    tmt_selesai date NOT NULL,
    no_sk_bendahara character varying(60) NOT NULL,
    tanggal_sk date NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.jabatan_bendahara OWNER TO postgres;

--
-- Name: jabatan_bendahara_id_bendahara_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jabatan_bendahara_id_bendahara_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jabatan_bendahara_id_bendahara_seq OWNER TO postgres;

--
-- Name: jabatan_bendahara_id_bendahara_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jabatan_bendahara_id_bendahara_seq OWNED BY public.jabatan_bendahara.id_bendahara;


--
-- Name: jabatan_id_jabatan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jabatan_id_jabatan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jabatan_id_jabatan_seq OWNER TO postgres;

--
-- Name: jabatan_id_jabatan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jabatan_id_jabatan_seq OWNED BY public.jabatan.id_jabatan;


--
-- Name: lembur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lembur (
    id_lembur integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    tanggal_lembur date NOT NULL,
    jam_mulai time without time zone NOT NULL,
    jam_selesai time without time zone NOT NULL,
    durasi_jam numeric(4,2) NOT NULL,
    jenis_hari character varying(20) NOT NULL,
    alasan_lembur character varying(200) NOT NULL,
    no_surat_perintah character varying(60) NOT NULL,
    tarif_perjam bigint NOT NULL,
    total_bayar bigint NOT NULL,
    status_bayar character varying(20) NOT NULL
);


ALTER TABLE public.lembur OWNER TO postgres;

--
-- Name: lembur_id_lembur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lembur_id_lembur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lembur_id_lembur_seq OWNER TO postgres;

--
-- Name: lembur_id_lembur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lembur_id_lembur_seq OWNED BY public.lembur.id_lembur;


--
-- Name: mutasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mutasi (
    id_mutasi integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    jenis_mutasi character varying(50) NOT NULL,
    unit_asal character varying(100) NOT NULL,
    unit_tujuan character varying(100) NOT NULL,
    jabatan_asal character varying(150) NOT NULL,
    jabatan_tujuan character varying(150) NOT NULL,
    tanggal_mutasi date NOT NULL,
    no_sk_mutasi character varying(60) NOT NULL,
    alasan_mutasi character varying(200) NOT NULL
);


ALTER TABLE public.mutasi OWNER TO postgres;

--
-- Name: mutasi_id_mutasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mutasi_id_mutasi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mutasi_id_mutasi_seq OWNER TO postgres;

--
-- Name: mutasi_id_mutasi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mutasi_id_mutasi_seq OWNED BY public.mutasi.id_mutasi;


--
-- Name: orang_tua; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orang_tua (
    id_ortu integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    nama_ayah character varying(100) NOT NULL,
    tempat_lahir_ayah character varying(50) NOT NULL,
    tanggal_lahir_ayah date NOT NULL,
    pekerjaan_ayah character varying(100) NOT NULL,
    status_ayah character varying(20) NOT NULL,
    nama_ibu character varying(100) NOT NULL,
    tempat_lahir_ibu character varying(50) NOT NULL,
    tanggal_lahir_ibu date NOT NULL,
    pekerjaan_ibu character varying(100) NOT NULL,
    status_ibu character varying(20) NOT NULL
);


ALTER TABLE public.orang_tua OWNER TO postgres;

--
-- Name: orang_tua_id_ortu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orang_tua_id_ortu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orang_tua_id_ortu_seq OWNER TO postgres;

--
-- Name: orang_tua_id_ortu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orang_tua_id_ortu_seq OWNED BY public.orang_tua.id_ortu;


--
-- Name: pangkat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pangkat (
    id_pangkat integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    kode_pangkat character varying(10) NOT NULL,
    nama_pangkat character varying(100) NOT NULL,
    golongan character varying(5) NOT NULL,
    tmt_pangkat date NOT NULL,
    no_sk_pangkat character varying(60) NOT NULL,
    tanggal_sk date NOT NULL,
    keterangan character varying(100) NOT NULL
);


ALTER TABLE public.pangkat OWNER TO postgres;

--
-- Name: pangkat_id_pangkat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pangkat_id_pangkat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pangkat_id_pangkat_seq OWNER TO postgres;

--
-- Name: pangkat_id_pangkat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pangkat_id_pangkat_seq OWNED BY public.pangkat.id_pangkat;


--
-- Name: pemberhentian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pemberhentian (
    id_pemberhentian integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    jenis_pemberhentian character varying(80) NOT NULL,
    tanggal_pemberhentian date NOT NULL,
    alasan text NOT NULL,
    no_sk_pemberhentian character varying(60) NOT NULL,
    tanggal_sk date NOT NULL,
    hak_pensiun character varying(20) NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.pemberhentian OWNER TO postgres;

--
-- Name: pemberhentian_id_pemberhentian_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pemberhentian_id_pemberhentian_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pemberhentian_id_pemberhentian_seq OWNER TO postgres;

--
-- Name: pemberhentian_id_pemberhentian_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pemberhentian_id_pemberhentian_seq OWNED BY public.pemberhentian.id_pemberhentian;


--
-- Name: perubahan_jam_kerja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perubahan_jam_kerja (
    id_jam_kerja integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    jenis_perubahan character varying(80) NOT NULL,
    jam_kerja_asal character varying(20) NOT NULL,
    jam_kerja_baru character varying(20) NOT NULL,
    tanggal_berlaku date NOT NULL,
    tanggal_berakhir date NOT NULL,
    alasan character varying(200) NOT NULL,
    no_surat character varying(60) NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.perubahan_jam_kerja OWNER TO postgres;

--
-- Name: perubahan_jam_kerja_id_jam_kerja_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perubahan_jam_kerja_id_jam_kerja_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perubahan_jam_kerja_id_jam_kerja_seq OWNER TO postgres;

--
-- Name: perubahan_jam_kerja_id_jam_kerja_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perubahan_jam_kerja_id_jam_kerja_seq OWNED BY public.perubahan_jam_kerja.id_jam_kerja;


--
-- Name: presensi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presensi (
    id_presensi integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    tanggal date NOT NULL,
    jam_masuk time without time zone NOT NULL,
    jam_keluar time without time zone NOT NULL,
    status_kehadiran character varying(30) NOT NULL,
    keterangan character varying(100) NOT NULL,
    lokasi character varying(100) NOT NULL,
    metode_absen character varying(30) NOT NULL
);


ALTER TABLE public.presensi OWNER TO postgres;

--
-- Name: presensi_id_presensi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presensi_id_presensi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presensi_id_presensi_seq OWNER TO postgres;

--
-- Name: presensi_id_presensi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presensi_id_presensi_seq OWNED BY public.presensi.id_presensi;


--
-- Name: riwayat_pendidikan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.riwayat_pendidikan (
    id_pendidikan integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    jenjang character varying(10) NOT NULL,
    nama_institusi character varying(150) NOT NULL,
    jurusan character varying(100) NOT NULL,
    tahun_masuk integer NOT NULL,
    tahun_lulus integer NOT NULL,
    gelar character varying(20) NOT NULL,
    no_ijazah character varying(50) NOT NULL,
    ipk numeric(3,2) NOT NULL
);


ALTER TABLE public.riwayat_pendidikan OWNER TO postgres;

--
-- Name: riwayat_pendidikan_id_pendidikan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riwayat_pendidikan_id_pendidikan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwayat_pendidikan_id_pendidikan_seq OWNER TO postgres;

--
-- Name: riwayat_pendidikan_id_pendidikan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riwayat_pendidikan_id_pendidikan_seq OWNED BY public.riwayat_pendidikan.id_pendidikan;


--
-- Name: suami_istri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suami_istri (
    id_suami_istri integer NOT NULL,
    id_pegawai character varying(20) NOT NULL,
    nama_pasangan character varying(100) NOT NULL,
    tempat_lahir character varying(50) NOT NULL,
    tanggal_lahir date NOT NULL,
    pekerjaan character varying(100) NOT NULL,
    no_ktp_pasangan character varying(20) NOT NULL,
    tanggal_menikah date NOT NULL,
    no_akta_nikah character varying(50) NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.suami_istri OWNER TO postgres;

--
-- Name: suami_istri_id_suami_istri_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suami_istri_id_suami_istri_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suami_istri_id_suami_istri_seq OWNER TO postgres;

--
-- Name: suami_istri_id_suami_istri_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suami_istri_id_suami_istri_seq OWNED BY public.suami_istri.id_suami_istri;


--
-- Name: anak id_anak; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anak ALTER COLUMN id_anak SET DEFAULT nextval('public.anak_id_anak_seq'::regclass);


--
-- Name: hubungan_kerja id_hubker; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hubungan_kerja ALTER COLUMN id_hubker SET DEFAULT nextval('public.hubungan_kerja_id_hubker_seq'::regclass);


--
-- Name: jabatan id_jabatan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jabatan ALTER COLUMN id_jabatan SET DEFAULT nextval('public.jabatan_id_jabatan_seq'::regclass);


--
-- Name: jabatan_bendahara id_bendahara; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jabatan_bendahara ALTER COLUMN id_bendahara SET DEFAULT nextval('public.jabatan_bendahara_id_bendahara_seq'::regclass);


--
-- Name: lembur id_lembur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lembur ALTER COLUMN id_lembur SET DEFAULT nextval('public.lembur_id_lembur_seq'::regclass);


--
-- Name: mutasi id_mutasi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mutasi ALTER COLUMN id_mutasi SET DEFAULT nextval('public.mutasi_id_mutasi_seq'::regclass);


--
-- Name: orang_tua id_ortu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orang_tua ALTER COLUMN id_ortu SET DEFAULT nextval('public.orang_tua_id_ortu_seq'::regclass);


--
-- Name: pangkat id_pangkat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pangkat ALTER COLUMN id_pangkat SET DEFAULT nextval('public.pangkat_id_pangkat_seq'::regclass);


--
-- Name: pemberhentian id_pemberhentian; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pemberhentian ALTER COLUMN id_pemberhentian SET DEFAULT nextval('public.pemberhentian_id_pemberhentian_seq'::regclass);


--
-- Name: perubahan_jam_kerja id_jam_kerja; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perubahan_jam_kerja ALTER COLUMN id_jam_kerja SET DEFAULT nextval('public.perubahan_jam_kerja_id_jam_kerja_seq'::regclass);


--
-- Name: presensi id_presensi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presensi ALTER COLUMN id_presensi SET DEFAULT nextval('public.presensi_id_presensi_seq'::regclass);


--
-- Name: riwayat_pendidikan id_pendidikan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwayat_pendidikan ALTER COLUMN id_pendidikan SET DEFAULT nextval('public.riwayat_pendidikan_id_pendidikan_seq'::regclass);


--
-- Name: suami_istri id_suami_istri; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suami_istri ALTER COLUMN id_suami_istri SET DEFAULT nextval('public.suami_istri_id_suami_istri_seq'::regclass);


--
-- Data for Name: anak; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.anak (id_anak, id_pegawai, nama_anak, tempat_lahir, tanggal_lahir, jenis_kelamin, no_akta_lahir, status_anak, pendidikan) FROM stdin;
1	PEG001	Ahmad Fauzi Jr.	Jakarta	2013-03-10	Laki-laki	AL-001/JKT/2013	Kandung	SD
2	PEG001	Aisyah Fauzi	Jakarta	2015-07-22	Perempuan	AL-002/JKT/2015	Kandung	TK
3	PEG002	Bintang Pratama	Depok	2014-11-05	Laki-laki	AL-003/DPK/2014	Kandung	SD
4	PEG003	Citra Santoso	Surabaya	2015-09-18	Perempuan	AL-004/SBY/2015	Kandung	SD
5	PEG003	Daffa Santoso	Jakarta	2017-12-01	Laki-laki	AL-005/JKT/2017	Kandung	TK
6	PEG004	Elisa Heriyanto	Jakarta	2016-04-25	Perempuan	AL-006/JKT/2016	Kandung	SD
7	PEG006	Farhan Alamsyah	Semarang	2018-08-14	Laki-laki	AL-007/SMG/2018	Kandung	TK
8	PEG007	Ghea Wijaya	Jakarta	2020-02-29	Perempuan	AL-008/JKT/2020	Kandung	PAUD
9	PEG009	Hafidz Prasetyo	Jakarta	2022-05-17	Laki-laki	AL-009/JKT/2022	Kandung	Belum Sekolah
10	PEG014	Indira Putri	Jakarta	2023-03-09	Perempuan	AL-010/JKT/2023	Kandung	Belum Sekolah
\.


--
-- Data for Name: data_pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_pegawai (id_pegawai, nip, nama_lengkap, tempat_lahir, tanggal_lahir, jenis_kelamin, agama, status_nikah, alamat, no_telepon, email, npwp, no_ktp, unit_kerja, status_pegawai, tanggal_masuk) FROM stdin;
PEG001	198501012010011001	Dr. Ahmad Fauzi, M.Kom	Jakarta	1985-01-01	Laki-laki	Islam	Menikah	Jl. Raya Pasar Minggu No. 12, Jakarta Selatan	081234567890	ahmad.fauzi@upnvj.ac.id	12.345.678.9-012.000	3174012345670001	Fakultas Ilmu Komputer	PNS	2010-01-01
PEG002	198703152011012002	Dr. Sari Indah, M.Pd	Bandung	1987-03-15	Perempuan	Islam	Menikah	Jl. Margonda Raya No. 45, Depok	081298765432	sari.indah@upnvj.ac.id	12.345.678.9-013.000	3276031587020002	Fakultas Ekonomi	PNS	2011-02-01
PEG003	199002202013011003	Ir. Budi Santoso, M.T	Surabaya	1990-02-20	Laki-laki	Islam	Menikah	Jl. Veteran No. 8, Jakarta Selatan	082111223344	budi.santoso@upnvj.ac.id	12.345.678.9-014.000	3174022002900003	Fakultas Teknik	PNS	2013-03-01
PEG004	199205102014012004	Dra. Rina Kusuma, M.Si	Yogyakarta	1992-05-10	Perempuan	Kristen	Menikah	Jl. Cilandak KKO No. 3, Jakarta Selatan	083122334455	rina.kusuma@upnvj.ac.id	12.345.678.9-015.000	3174051092000004	Fakultas Hukum	PNS	2014-04-01
PEG005	199308252015011005	Muhammad Rizki, S.E., M.M	Medan	1993-08-25	Laki-laki	Islam	Belum Menikah	Jl. Antasari No. 21, Jakarta Selatan	084133445566	m.rizki@upnvj.ac.id	12.345.678.9-016.000	3174082593000005	Biro Kepegawaian	PNS	2015-05-01
PEG006	199412302016012006	Dewi Rahayu, S.Psi., M.Psi	Semarang	1994-12-30	Perempuan	Islam	Menikah	Jl. TB Simatupang No. 6, Jakarta Selatan	085144556677	dewi.rahayu@upnvj.ac.id	12.345.678.9-017.000	3174123094000006	Biro Kepegawaian	PNS	2016-06-01
PEG007	199501152017011007	Hendra Wijaya, S.T., M.Eng	Palembang	1995-01-15	Laki-laki	Katolik	Menikah	Jl. Mampang Prapatan No. 9, Jakarta Selatan	086155667788	hendra.wijaya@upnvj.ac.id	12.345.678.9-018.000	3174011595000007	Fakultas Teknik	PNS	2017-07-01
PEG008	199609202018012008	Fitriani, S.KM., M.Kes	Makassar	1996-09-20	Perempuan	Islam	Belum Menikah	Jl. Fatmawati No. 33, Jakarta Selatan	087166778899	fitriani@upnvj.ac.id	12.345.678.9-019.000	3174202096000008	Fakultas Kedokteran	PNS	2018-08-01
PEG009	199711052019011009	Agus Prasetyo, S.H., M.H	Balikpapan	1997-11-05	Laki-laki	Islam	Menikah	Jl. Wolter Monginsidi No. 14, Jakarta Selatan	088177889900	agus.prasetyo@upnvj.ac.id	12.345.678.9-020.000	3174051197000009	Fakultas Hukum	PNS	2019-09-01
PEG010	199803122020012010	Nurul Hidayah, S.Pd., M.Pd	Banjarmasin	1998-03-12	Perempuan	Islam	Belum Menikah	Jl. Brawijaya No. 7, Jakarta Selatan	089188990011	nurul.hidayah@upnvj.ac.id	12.345.678.9-021.000	3174121298000010	Fakultas FISIP	PNS	2020-10-01
PEG011	199407172021011011	Denny Kurniawan, S.Kom	Jakarta	1994-07-17	Laki-laki	Islam	Menikah	Jl. Cipete Raya No. 25, Jakarta Selatan	081299001122	denny.k@upnvj.ac.id	12.345.678.9-022.000	3174171794000011	Fakultas Ilmu Komputer	CPNS	2021-11-01
PEG012	199510282022012012	Laila Sari, S.E	Bogor	1995-10-28	Perempuan	Islam	Belum Menikah	Jl. Radio Dalam No. 5, Jakarta Selatan	082200112233	laila.sari@upnvj.ac.id	12.345.678.9-023.000	3174282095000012	Fakultas Ekonomi	CPNS	2022-12-01
PEG013	200001032023011013	Rizky Ananda, S.T	Pekanbaru	2000-01-03	Laki-laki	Islam	Belum Menikah	Jl. Kemang Raya No. 11, Jakarta Selatan	083211223344	rizky.ananda@upnvj.ac.id	12.345.678.9-024.000	3174030100000013	Biro Umum	Pegawai Tetap	2023-01-02
PEG014	199806192023012014	Yuliana Putri, S.Sos	Padang	1998-06-19	Perempuan	Islam	Menikah	Jl. Tendean No. 18, Jakarta Selatan	084222334455	yuliana.p@upnvj.ac.id	12.345.678.9-025.000	3174190698000014	Biro Administrasi	Pegawai Tetap	2023-02-01
PEG015	199904112023011015	Fajar Nugroho, S.IP	Cirebon	1999-04-11	Laki-laki	Islam	Belum Menikah	Jl. Panglima Polim No. 3, Jakarta Selatan	085233445566	fajar.nugroho@upnvj.ac.id	12.345.678.9-026.000	3174110499000015	Biro Kepegawaian	Pegawai Kontrak	2023-03-01
\.


--
-- Data for Name: hubungan_kerja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hubungan_kerja (id_hubker, id_pegawai, jenis_hubungan, no_kontrak, tanggal_mulai, tanggal_selesai, jabatan, unit_kerja, gaji_pokok, status) FROM stdin;
1	PEG001	PNS Tetap	PNST/001/UPNVJ/2010	2010-01-01	2045-01-01	Dosen Tetap	Fakultas Ilmu Komputer	6500000	Aktif
2	PEG002	PNS Tetap	PNST/002/UPNVJ/2011	2011-02-01	2047-03-15	Dosen Tetap	Fakultas Ekonomi	6000000	Aktif
3	PEG003	PNS Tetap	PNST/003/UPNVJ/2013	2013-03-01	2050-02-20	Dosen Tetap	Fakultas Teknik	5500000	Aktif
4	PEG004	PNS Tetap	PNST/004/UPNVJ/2014	2014-04-01	2052-05-10	Dosen Tetap	Fakultas Hukum	5500000	Aktif
5	PEG005	PNS Tetap	PNST/005/UPNVJ/2015	2015-05-01	2053-08-25	Kepala Sub Bagian Kepegawaian	Biro Kepegawaian	5000000	Aktif
6	PEG006	PNS Tetap	PNST/006/UPNVJ/2016	2016-06-01	2054-12-30	Staf Kepegawaian	Biro Kepegawaian	4500000	Aktif
7	PEG007	PNS Tetap	PNST/007/UPNVJ/2017	2017-07-01	2055-01-15	Dosen Tetap	Fakultas Teknik	5000000	Aktif
8	PEG008	PNS Tetap	PNST/008/UPNVJ/2018	2018-08-01	2056-09-20	Dosen Tetap	Fakultas Kedokteran	5000000	Aktif
9	PEG009	PNS Tetap	PNST/009/UPNVJ/2019	2019-09-01	2057-11-05	Dosen Tetap	Fakultas Hukum	4500000	Aktif
10	PEG010	PNS Tetap	PNST/010/UPNVJ/2020	2020-10-01	2058-03-12	Dosen Tetap	Fakultas FISIP	4500000	Aktif
11	PEG011	CPNS	CPNS/011/UPNVJ/2021	2021-11-01	2023-10-31	Programmer	Fakultas Ilmu Komputer	3500000	Selesai
12	PEG012	CPNS	CPNS/012/UPNVJ/2022	2022-12-01	2024-11-30	Staf Keuangan	Fakultas Ekonomi	3500000	Aktif
13	PEG013	Pegawai Tetap	PT/013/UPNVJ/2023	2023-01-02	2025-01-01	Staf Teknik	Biro Umum	4000000	Aktif
14	PEG014	Pegawai Tetap	PT/014/UPNVJ/2023	2023-02-01	2025-01-31	Staf Administrasi	Biro Administrasi	4000000	Aktif
15	PEG015	Pegawai Kontrak	PK/015/UPNVJ/2023	2023-03-01	2024-02-28	Staf Kepegawaian	Biro Kepegawaian	3500000	Aktif
\.


--
-- Data for Name: jabatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jabatan (id_jabatan, id_pegawai, nama_jabatan, jenis_jabatan, unit_kerja, tmt_jabatan, no_sk_jabatan, tanggal_sk, status_jabatan) FROM stdin;
1	PEG001	Ketua Program Studi Teknik Informatika	Jabatan Fungsional Akademik	Fakultas Ilmu Komputer	2022-01-01	SK/001/JAB/UPNVJ/2022	2021-12-15	Aktif
2	PEG002	Sekretaris Program Studi Pendidikan Bahasa Inggris	Jabatan Fungsional Akademik	Fakultas Ekonomi	2021-01-01	SK/002/JAB/UPNVJ/2021	2020-12-20	Aktif
3	PEG003	Dosen Tetap Teknik Sipil	Jabatan Fungsional Akademik	Fakultas Teknik	2013-03-01	SK/003/JAB/UPNVJ/2013	2013-02-15	Aktif
4	PEG004	Dosen Tetap Ilmu Hukum	Jabatan Fungsional Akademik	Fakultas Hukum	2014-04-01	SK/004/JAB/UPNVJ/2014	2014-03-20	Aktif
5	PEG005	Kepala Sub Bagian Kepegawaian	Jabatan Struktural	Biro Kepegawaian	2021-01-01	SK/005/JAB/UPNVJ/2021	2020-12-28	Aktif
6	PEG006	Staf Kepegawaian	Jabatan Fungsional Umum	Biro Kepegawaian	2016-06-01	SK/006/JAB/UPNVJ/2016	2016-05-20	Aktif
7	PEG007	Dosen Tetap Teknik Elektro	Jabatan Fungsional Akademik	Fakultas Teknik	2017-07-01	SK/007/JAB/UPNVJ/2017	2017-06-15	Aktif
8	PEG008	Dosen Tetap Kesehatan Masyarakat	Jabatan Fungsional Akademik	Fakultas Kedokteran	2018-08-01	SK/008/JAB/UPNVJ/2018	2018-07-25	Aktif
9	PEG009	Dosen Tetap Ilmu Hukum	Jabatan Fungsional Akademik	Fakultas Hukum	2019-09-01	SK/009/JAB/UPNVJ/2019	2019-08-20	Aktif
10	PEG010	Dosen Tetap Ilmu Sosial	Jabatan Fungsional Akademik	Fakultas FISIP	2020-10-01	SK/010/JAB/UPNVJ/2020	2020-09-15	Aktif
11	PEG011	Programmer	Jabatan Fungsional Umum	Fakultas Ilmu Komputer	2021-11-01	SK/011/JAB/UPNVJ/2021	2021-10-20	Aktif
12	PEG012	Staf Keuangan	Jabatan Fungsional Umum	Fakultas Ekonomi	2022-12-01	SK/012/JAB/UPNVJ/2022	2022-11-15	Aktif
13	PEG013	Staf Teknik	Jabatan Fungsional Umum	Biro Umum	2023-01-02	SK/013/JAB/UPNVJ/2023	2022-12-27	Aktif
14	PEG014	Staf Administrasi	Jabatan Fungsional Umum	Biro Administrasi	2023-02-01	SK/014/JAB/UPNVJ/2023	2023-01-25	Aktif
15	PEG015	Staf Kepegawaian	Jabatan Fungsional Umum	Biro Kepegawaian	2023-03-01	SK/015/JAB/UPNVJ/2023	2023-02-22	Aktif
\.


--
-- Data for Name: jabatan_bendahara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jabatan_bendahara (id_bendahara, id_pegawai, jenis_bendahara, unit_kerja, tmt_bendahara, tmt_selesai, no_sk_bendahara, tanggal_sk, status) FROM stdin;
1	PEG005	Bendahara Pengeluaran	Biro Kepegawaian	2021-01-01	2023-12-31	SK/001/BND/UPNVJ/2021	2020-12-28	Selesai
2	PEG006	Bendahara Penerimaan	Biro Kepegawaian	2020-01-01	2022-12-31	SK/002/BND/UPNVJ/2020	2019-12-20	Selesai
3	PEG012	Bendahara Pengeluaran Pembantu	Fakultas Ekonomi	2022-12-01	2024-11-30	SK/003/BND/UPNVJ/2022	2022-11-15	Aktif
4	PEG014	Bendahara Penerimaan Pembantu	Biro Administrasi	2023-02-01	2025-01-31	SK/004/BND/UPNVJ/2023	2023-01-25	Aktif
5	PEG005	Bendahara Pengeluaran	Biro Kepegawaian	2024-01-01	2025-12-31	SK/005/BND/UPNVJ/2024	2023-12-15	Aktif
6	PEG006	Bendahara Penerimaan	Biro Kepegawaian	2023-01-01	2024-12-31	SK/006/BND/UPNVJ/2023	2022-12-10	Aktif
\.


--
-- Data for Name: lembur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lembur (id_lembur, id_pegawai, tanggal_lembur, jam_mulai, jam_selesai, durasi_jam, jenis_hari, alasan_lembur, no_surat_perintah, tarif_perjam, total_bayar, status_bayar) FROM stdin;
1	PEG001	2025-01-04	09:00:00	14:00:00	5.00	Hari Libur	Persiapan Wisuda Semester Ganjil 2024	SP/001/LMB/UPNVJ/2025	75000	375000	Dibayar
2	PEG002	2025-01-04	09:00:00	13:00:00	4.00	Hari Libur	Persiapan Wisuda Semester Ganjil 2024	SP/002/LMB/UPNVJ/2025	70000	280000	Dibayar
3	PEG005	2025-01-10	16:00:00	19:00:00	3.00	Hari Kerja	Penyelesaian berkas mutasi pegawai	SP/003/LMB/UPNVJ/2025	55000	165000	Dibayar
4	PEG006	2025-01-10	16:00:00	18:00:00	2.00	Hari Kerja	Penyelesaian berkas mutasi pegawai	SP/004/LMB/UPNVJ/2025	50000	100000	Dibayar
5	PEG003	2025-01-11	08:00:00	15:00:00	7.00	Hari Libur	Pengawasan Ujian Susulan	SP/005/LMB/UPNVJ/2025	60000	420000	Dibayar
6	PEG007	2025-01-11	08:00:00	15:00:00	7.00	Hari Libur	Pengawasan Ujian Susulan	SP/006/LMB/UPNVJ/2025	60000	420000	Dibayar
7	PEG004	2025-01-15	16:00:00	20:00:00	4.00	Hari Kerja	Penyusunan Laporan Akreditasi	SP/007/LMB/UPNVJ/2025	65000	260000	Proses
8	PEG008	2025-01-15	16:00:00	19:00:00	3.00	Hari Kerja	Penyusunan Laporan Akreditasi	SP/008/LMB/UPNVJ/2025	60000	180000	Proses
9	PEG010	2025-01-18	08:00:00	14:00:00	6.00	Hari Libur	Seminar Nasional FISIP	SP/009/LMB/UPNVJ/2025	55000	330000	Dibayar
10	PEG014	2025-01-18	08:00:00	13:00:00	5.00	Hari Libur	Seminar Nasional FISIP	SP/010/LMB/UPNVJ/2025	45000	225000	Dibayar
11	PEG005	2025-01-20	16:00:00	19:30:00	3.50	Hari Kerja	Rekapitulasi data absensi bulanan	SP/011/LMB/UPNVJ/2025	55000	192500	Proses
12	PEG015	2025-01-20	16:00:00	18:00:00	2.00	Hari Kerja	Rekapitulasi data absensi bulanan	SP/012/LMB/UPNVJ/2025	40000	80000	Proses
13	PEG012	2025-01-22	16:00:00	20:00:00	4.00	Hari Kerja	Closing laporan keuangan bulan Januari	SP/013/LMB/UPNVJ/2025	45000	180000	Proses
14	PEG009	2025-01-25	09:00:00	15:00:00	6.00	Hari Libur	Sidang Skripsi Mahasiswa	SP/014/LMB/UPNVJ/2025	60000	360000	Dibayar
15	PEG011	2025-01-25	09:00:00	14:00:00	5.00	Hari Libur	Maintenance sistem informasi akademik	SP/015/LMB/UPNVJ/2025	50000	250000	Dibayar
\.


--
-- Data for Name: mutasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mutasi (id_mutasi, id_pegawai, jenis_mutasi, unit_asal, unit_tujuan, jabatan_asal, jabatan_tujuan, tanggal_mutasi, no_sk_mutasi, alasan_mutasi) FROM stdin;
1	PEG001	Mutasi Internal	Biro Kepegawaian	Fakultas Ilmu Komputer	Staf Kepegawaian	Dosen Tetap	2012-01-01	SK/001/MUT/UPNVJ/2012	Sesuai kualifikasi pendidikan
2	PEG002	Mutasi Internal	Biro Administrasi	Fakultas Ekonomi	Staf Administrasi	Dosen Tetap	2013-02-01	SK/002/MUT/UPNVJ/2013	Sesuai kualifikasi pendidikan
3	PEG005	Mutasi Internal	Biro Umum	Biro Kepegawaian	Staf Umum	Staf Kepegawaian	2018-01-01	SK/003/MUT/UPNVJ/2018	Kebutuhan organisasi
4	PEG005	Promosi	Biro Kepegawaian	Biro Kepegawaian	Staf Kepegawaian	Kepala Sub Bagian Kepegawaian	2021-01-01	SK/004/MUT/UPNVJ/2021	Prestasi kerja baik
5	PEG007	Mutasi Internal	Fakultas Teknik	Biro Sarana Prasarana	Dosen Tetap	Kepala Laboratorium	2020-01-01	SK/005/MUT/UPNVJ/2020	Kebutuhan organisasi
6	PEG007	Mutasi Internal	Biro Sarana Prasarana	Fakultas Teknik	Kepala Laboratorium	Dosen Tetap	2022-01-01	SK/006/MUT/UPNVJ/2022	Permintaan sendiri
7	PEG010	Mutasi Masuk	Universitas Lain	Fakultas FISIP	Dosen Tetap	Dosen Tetap	2020-10-01	SK/007/MUT/UPNVJ/2020	Pindah instansi
8	PEG013	Mutasi Internal	Biro Umum	Biro Umum	Staf Teknik	Teknisi Senior	2024-01-01	SK/008/MUT/UPNVJ/2024	Peningkatan jabatan
\.


--
-- Data for Name: orang_tua; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orang_tua (id_ortu, id_pegawai, nama_ayah, tempat_lahir_ayah, tanggal_lahir_ayah, pekerjaan_ayah, status_ayah, nama_ibu, tempat_lahir_ibu, tanggal_lahir_ibu, pekerjaan_ibu, status_ibu) FROM stdin;
1	PEG001	H. Fauzi Rahmat	Padang	1955-04-10	Pensiunan PNS	Hidup	Hj. Nurlaila	Padang	1958-09-20	Ibu Rumah Tangga	Hidup
2	PEG002	Drs. Sujana	Bandung	1957-07-15	Pensiunan Guru	Hidup	Siti Rohmah	Bandung	1960-01-05	Pedagang	Hidup
3	PEG003	Santoso Hadi	Surabaya	1960-11-22	Wiraswasta	Hidup	Mujiati	Surabaya	1963-06-14	Ibu Rumah Tangga	Hidup
4	PEG004	Prof. Kusuma Wijaya	Yogyakarta	1958-03-30	Pensiunan Dosen	Hidup	Dr. Hartati	Yogyakarta	1962-08-25	Pensiunan Dokter	Hidup
5	PEG005	Rizal Harahap	Medan	1963-12-01	Pedagang	Hidup	Masitah	Medan	1966-05-18	Ibu Rumah Tangga	Hidup
6	PEG006	Sunardi	Semarang	1964-09-17	Petani	Meninggal	Sriningsih	Semarang	1967-02-28	Ibu Rumah Tangga	Hidup
7	PEG007	Hendra Sr.	Palembang	1965-06-03	Pensiunan TNI	Hidup	Yuliani	Palembang	1968-11-12	Guru	Hidup
8	PEG008	Dg. Massaleh	Makassar	1966-01-19	Nelayan	Hidup	Hj. Aminah	Makassar	1969-04-07	Pedagang	Hidup
9	PEG009	Prasetyo Utomo	Balikpapan	1967-08-24	Wiraswasta	Hidup	Dewi Ratnasari	Balikpapan	1970-07-16	Bidan	Hidup
10	PEG010	H. Hidayat	Banjarmasin	1968-03-11	Pensiunan PNS	Hidup	Hj. Fatimah	Banjarmasin	1971-10-23	Ibu Rumah Tangga	Hidup
11	PEG011	Kurniawan Jaya	Jakarta	1965-05-29	Wiraswasta	Hidup	Sri Wahyuni	Jakarta	1968-09-04	Pegawai Swasta	Hidup
12	PEG012	Sutrisno	Bogor	1966-12-08	Petani	Hidup	Eni Supriati	Bogor	1969-03-17	Ibu Rumah Tangga	Hidup
13	PEG013	Ananda Putra	Pekanbaru	1970-07-13	Wiraswasta	Hidup	Yanti Lestari	Pekanbaru	1973-12-28	Guru	Hidup
14	PEG014	Putra Jaya	Padang	1968-04-02	PNS	Hidup	Nurhasanah	Padang	1971-08-19	Ibu Rumah Tangga	Hidup
15	PEG015	Nugroho Wibowo	Cirebon	1969-09-05	Pegawai Swasta	Hidup	Umi Kulsum	Cirebon	1972-01-11	Pedagang	Hidup
\.


--
-- Data for Name: pangkat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pangkat (id_pangkat, id_pegawai, kode_pangkat, nama_pangkat, golongan, tmt_pangkat, no_sk_pangkat, tanggal_sk, keterangan) FROM stdin;
1	PEG001	PK-IVB	Pembina Tingkat I	IV/b	2023-04-01	SK/001/PANKT/BKN/2023	2023-03-15	Kenaikan Reguler
2	PEG002	PK-IVA	Pembina	IV/a	2022-10-01	SK/002/PANKT/BKN/2022	2022-09-20	Kenaikan Reguler
3	PEG003	PK-IIID	Penata Tingkat I	III/d	2021-04-01	SK/003/PANKT/BKN/2021	2021-03-18	Kenaikan Reguler
4	PEG004	PK-IIIC	Penata	III/c	2022-10-01	SK/004/PANKT/BKN/2022	2022-09-25	Kenaikan Reguler
5	PEG005	PK-IIIB	Penata Muda Tingkat I	III/b	2021-04-01	SK/005/PANKT/BKN/2021	2021-03-22	Kenaikan Reguler
6	PEG006	PK-IIIA	Penata Muda	III/a	2020-10-01	SK/006/PANKT/BKN/2020	2020-09-28	Pengangkatan Pertama
7	PEG007	PK-IIIB	Penata Muda Tingkat I	III/b	2022-04-01	SK/007/PANKT/BKN/2022	2022-03-20	Kenaikan Reguler
8	PEG008	PK-IIIA	Penata Muda	III/a	2021-10-01	SK/008/PANKT/BKN/2021	2021-09-30	Pengangkatan Pertama
9	PEG009	PK-IIIA	Penata Muda	III/a	2022-10-01	SK/009/PANKT/BKN/2022	2022-09-15	Pengangkatan Pertama
10	PEG010	PK-IIIA	Penata Muda	III/a	2023-04-01	SK/010/PANKT/BKN/2023	2023-03-10	Pengangkatan Pertama
11	PEG011	PK-IIA	Pengatur Muda	II/a	2023-01-01	SK/011/PANKT/BKN/2023	2022-12-20	Pengangkatan CPNS
12	PEG012	PK-IIA	Pengatur Muda	II/a	2024-01-01	SK/012/PANKT/BKN/2024	2023-12-15	Pengangkatan CPNS
13	PEG013	PK-IIA	Pengatur Muda	II/a	2023-01-01	SK/013/PANKT/BKN/2023	2022-12-28	Pengangkatan Awal
14	PEG014	PK-IIIA	Penata Muda	III/a	2023-02-01	SK/014/PANKT/BKN/2023	2023-01-20	Pengangkatan Awal
15	PEG015	PK-IIA	Pengatur Muda	II/a	2023-03-01	SK/015/PANKT/BKN/2023	2023-02-14	Pengangkatan Kontrak
\.


--
-- Data for Name: pemberhentian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pemberhentian (id_pemberhentian, id_pegawai, jenis_pemberhentian, tanggal_pemberhentian, alasan, no_sk_pemberhentian, tanggal_sk, hak_pensiun, status) FROM stdin;
1	PEG011	Selesai Masa Kontrak	2023-10-31	Kontrak CPNS berakhir sesuai peraturan	SK/001/PHK/UPNVJ/2023	2023-10-01	Tidak Ada	Selesai
2	PEG015	Akhir Kontrak	2024-02-28	Kontrak kerja habis masa berlakunya	SK/002/PHK/UPNVJ/2024	2024-02-01	Tidak Ada	Proses
3	PEG001	Pensiun Normal	2045-01-01	Batas Usia Pensiun 60 tahun	SK/003/PHK/UPNVJ/2044	2044-12-01	Ada	Dijadwalkan
4	PEG002	Pensiun Normal	2047-03-15	Batas Usia Pensiun 60 tahun	SK/004/PHK/UPNVJ/2047	2047-02-15	Ada	Dijadwalkan
5	PEG003	Pensiun Normal	2050-02-20	Batas Usia Pensiun 60 tahun	SK/005/PHK/UPNVJ/2050	2050-01-20	Ada	Dijadwalkan
\.


--
-- Data for Name: perubahan_jam_kerja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perubahan_jam_kerja (id_jam_kerja, id_pegawai, jenis_perubahan, jam_kerja_asal, jam_kerja_baru, tanggal_berlaku, tanggal_berakhir, alasan, no_surat, status) FROM stdin;
1	PEG001	Penyesuaian Jam	08:00-16:00	07:00-15:00	2024-01-01	2024-06-30	Mengajar kelas pagi reguler	ST/001/JK/UPNVJ/2024	Selesai
2	PEG002	Penyesuaian Jam	08:00-16:00	09:00-17:00	2024-02-01	2024-07-31	Mengajar kelas sore reguler	ST/002/JK/UPNVJ/2024	Selesai
3	PEG003	WFH	08:00-16:00	08:00-16:00	2024-03-01	2024-05-31	Kebijakan hybrid working	ST/003/JK/UPNVJ/2024	Selesai
4	PEG005	Penyesuaian Jam	07:30-15:30	08:00-16:00	2024-04-01	2024-09-30	Penyesuaian jam operasional biro	ST/004/JK/UPNVJ/2024	Selesai
5	PEG006	Shift Pagi	08:00-16:00	06:30-14:30	2024-05-01	2024-08-31	Kebutuhan pelayanan pagi	ST/005/JK/UPNVJ/2024	Selesai
6	PEG007	WFH	08:00-16:00	08:00-16:00	2025-01-06	2025-03-31	Program hybrid working semester genap	ST/006/JK/UPNVJ/2025	Aktif
7	PEG008	Penyesuaian Jam	08:00-16:00	07:30-15:30	2025-01-06	2025-06-30	Jadwal klinik pagi	ST/007/JK/UPNVJ/2025	Aktif
8	PEG010	WFH	08:00-16:00	08:00-16:00	2025-01-06	2025-06-30	Program hybrid working semester genap	ST/008/JK/UPNVJ/2025	Aktif
9	PEG012	Penyesuaian Jam	08:00-16:00	09:00-17:00	2025-01-06	2025-03-31	Piket layanan sore	ST/009/JK/UPNVJ/2025	Aktif
10	PEG015	Shift Pagi	08:00-16:00	07:00-15:00	2025-01-06	2025-06-30	Piket pagi biro kepegawaian	ST/010/JK/UPNVJ/2025	Aktif
\.


--
-- Data for Name: presensi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presensi (id_presensi, id_pegawai, tanggal, jam_masuk, jam_keluar, status_kehadiran, keterangan, lokasi, metode_absen) FROM stdin;
1	PEG001	2025-01-06	07:55:00	16:05:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
2	PEG001	2025-01-07	08:10:00	16:02:00	Hadir Terlambat	Terlambat 10 menit	Kampus UPNVJ	Fingerprint
3	PEG001	2025-01-08	07:50:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
4	PEG002	2025-01-06	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
5	PEG002	2025-01-07	08:05:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
6	PEG002	2025-01-08	00:00:00	00:00:00	Izin	Sakit	Kampus UPNVJ	Manual
7	PEG003	2025-01-06	07:45:00	16:10:00	Hadir	Lebih awal	Kampus UPNVJ	Fingerprint
8	PEG003	2025-01-07	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
9	PEG003	2025-01-08	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
10	PEG004	2025-01-06	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
11	PEG004	2025-01-07	00:00:00	00:00:00	Dinas Luar	Rapat Koordinasi Kemenristekdikti	Luar Kantor	Manual
12	PEG004	2025-01-08	08:15:00	16:00:00	Hadir Terlambat	Terlambat 15 menit	Kampus UPNVJ	Fingerprint
13	PEG005	2025-01-06	07:58:00	16:05:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
14	PEG005	2025-01-07	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
15	PEG005	2025-01-08	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
16	PEG006	2025-01-06	08:05:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
17	PEG006	2025-01-07	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
18	PEG006	2025-01-08	00:00:00	00:00:00	Cuti	Cuti Tahunan	Kampus UPNVJ	Manual
19	PEG007	2025-01-06	07:55:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
20	PEG007	2025-01-07	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
21	PEG008	2025-01-06	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
22	PEG008	2025-01-07	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
23	PEG009	2025-01-06	08:20:00	16:00:00	Hadir Terlambat	Terlambat 20 menit	Kampus UPNVJ	Fingerprint
24	PEG009	2025-01-07	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
25	PEG010	2025-01-06	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
26	PEG010	2025-01-07	08:00:00	16:30:00	Hadir	Lembur	Kampus UPNVJ	Fingerprint
27	PEG011	2025-01-06	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
28	PEG012	2025-01-06	07:50:00	16:00:00	Hadir	Lebih awal	Kampus UPNVJ	Fingerprint
29	PEG013	2025-01-06	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
30	PEG014	2025-01-06	08:10:00	16:00:00	Hadir Terlambat	Terlambat 10 menit	Kampus UPNVJ	Fingerprint
31	PEG015	2025-01-06	08:00:00	16:00:00	Hadir	Tepat waktu	Kampus UPNVJ	Fingerprint
\.


--
-- Data for Name: riwayat_pendidikan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riwayat_pendidikan (id_pendidikan, id_pegawai, jenjang, nama_institusi, jurusan, tahun_masuk, tahun_lulus, gelar, no_ijazah, ipk) FROM stdin;
1	PEG001	S1	Universitas Indonesia	Ilmu Komputer	2003	2007	S.Kom	IJ-001/UI/2007	3.55
2	PEG001	S2	Institut Teknologi Bandung	Teknik Informatika	2008	2010	M.Kom	IJ-002/ITB/2010	3.72
3	PEG001	S3	Universitas Indonesia	Ilmu Komputer	2015	2019	Dr.	IJ-003/UI/2019	3.88
4	PEG002	S1	Universitas Pendidikan Indonesia	Pendidikan Bahasa Inggris	2005	2009	S.Pd	IJ-004/UPI/2009	3.60
5	PEG002	S2	Universitas Negeri Jakarta	Pendidikan Bahasa	2010	2012	M.Pd	IJ-005/UNJ/2012	3.75
6	PEG002	S3	Universitas Negeri Jakarta	Ilmu Pendidikan	2018	2021	Dr.	IJ-006/UNJ/2021	3.80
7	PEG003	S1	Institut Teknologi Surabaya	Teknik Sipil	2008	2012	S.T	IJ-007/ITS/2012	3.45
8	PEG003	S2	Universitas Gadjah Mada	Teknik Sipil	2013	2015	M.T	IJ-008/UGM/2015	3.65
9	PEG004	S1	Universitas Gadjah Mada	Ilmu Hukum	2010	2014	S.H	IJ-009/UGM/2014	3.70
10	PEG004	S2	Universitas Indonesia	Hukum Bisnis	2015	2017	M.Si	IJ-010/UI/2017	3.85
11	PEG005	S1	Universitas Sumatera Utara	Manajemen	2011	2015	S.E	IJ-011/USU/2015	3.40
12	PEG005	S2	Universitas Indonesia	Manajemen	2016	2018	M.M	IJ-012/UI/2018	3.60
13	PEG006	S1	Universitas Diponegoro	Psikologi	2012	2016	S.Psi	IJ-013/UNDIP/2016	3.55
14	PEG006	S2	Universitas Indonesia	Psikologi Klinis	2017	2019	M.Psi	IJ-014/UI/2019	3.78
15	PEG007	S1	Universitas Sriwijaya	Teknik Elektro	2013	2017	S.T	IJ-015/UNSRI/2017	3.48
16	PEG007	S2	Institut Teknologi Bandung	Teknik Elektro	2018	2020	M.Eng	IJ-016/ITB/2020	3.62
17	PEG008	S1	Universitas Hasanuddin	Kesehatan Masyarakat	2014	2018	S.KM	IJ-017/UNHAS/2018	3.52
18	PEG008	S2	Universitas Indonesia	Kesehatan Masyarakat	2019	2021	M.Kes	IJ-018/UI/2021	3.70
19	PEG009	S1	Universitas Mulawarman	Ilmu Hukum	2015	2019	S.H	IJ-019/UNMUL/2019	3.45
20	PEG009	S2	Universitas Indonesia	Hukum Pidana	2020	2022	M.H	IJ-020/UI/2022	3.68
21	PEG010	S1	Universitas Lambung Mangkurat	Pendidikan	2016	2020	S.Pd	IJ-021/ULM/2020	3.50
22	PEG010	S2	Universitas Negeri Jakarta	Pendidikan	2021	2023	M.Pd	IJ-022/UNJ/2023	3.72
23	PEG011	S1	UPN Veteran Jakarta	Teknik Informatika	2012	2016	S.Kom	IJ-023/UPNVJ/2016	3.42
24	PEG012	S1	IPB University	Ekonomi	2013	2017	S.E	IJ-024/IPB/2017	3.38
25	PEG013	S1	UPN Veteran Jakarta	Teknik Industri	2018	2022	S.T	IJ-025/UPNVJ/2022	3.55
26	PEG014	S1	Universitas Andalas	Ilmu Sosial	2016	2020	S.Sos	IJ-026/UNAND/2020	3.48
27	PEG015	S1	Universitas Swadaya Gunung Jati	Ilmu Pemerintahan	2017	2021	S.IP	IJ-027/UNSWAGATI/2021	3.35
\.


--
-- Data for Name: suami_istri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suami_istri (id_suami_istri, id_pegawai, nama_pasangan, tempat_lahir, tanggal_lahir, pekerjaan, no_ktp_pasangan, tanggal_menikah, no_akta_nikah, status) FROM stdin;
1	PEG001	Siti Aminah	Jakarta	1987-05-20	Guru SD	3174052087000021	2012-06-10	0012/KCAN/2012	Aktif
2	PEG002	Andi Pratama	Bandung	1985-09-10	Wiraswasta	3276101085000022	2013-07-15	0034/KCAN/2013	Aktif
3	PEG003	Ratna Dewi	Surabaya	1991-03-05	PNS	3174030591000023	2014-08-20	0056/KCAN/2014	Aktif
4	PEG004	Dimas Heriyanto	Yogyakarta	1988-12-25	Dokter	3271251288000024	2015-09-25	0078/KCAN/2015	Aktif
5	PEG006	Rafi Alamsyah	Semarang	1992-07-08	Pengacara	3374080792000025	2017-10-30	0090/KCAN/2017	Aktif
6	PEG007	Yeni Susanti	Jakarta	1996-04-12	Bidan	3174120496000026	2019-11-05	0102/KCAN/2019	Aktif
7	PEG009	Dwi Lestari	Surabaya	1998-06-30	Apoteker	3578300698000027	2021-12-10	0114/KCAN/2021	Aktif
8	PEG014	Bagas Saputra	Padang	1996-02-14	Wirausaha	1371140296000028	2022-01-20	0126/KCAN/2022	Aktif
\.


--
-- Name: anak_id_anak_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.anak_id_anak_seq', 10, true);


--
-- Name: hubungan_kerja_id_hubker_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hubungan_kerja_id_hubker_seq', 15, true);


--
-- Name: jabatan_bendahara_id_bendahara_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jabatan_bendahara_id_bendahara_seq', 6, true);


--
-- Name: jabatan_id_jabatan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jabatan_id_jabatan_seq', 15, true);


--
-- Name: lembur_id_lembur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lembur_id_lembur_seq', 15, true);


--
-- Name: mutasi_id_mutasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mutasi_id_mutasi_seq', 8, true);


--
-- Name: orang_tua_id_ortu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orang_tua_id_ortu_seq', 15, true);


--
-- Name: pangkat_id_pangkat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pangkat_id_pangkat_seq', 15, true);


--
-- Name: pemberhentian_id_pemberhentian_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pemberhentian_id_pemberhentian_seq', 5, true);


--
-- Name: perubahan_jam_kerja_id_jam_kerja_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perubahan_jam_kerja_id_jam_kerja_seq', 10, true);


--
-- Name: presensi_id_presensi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presensi_id_presensi_seq', 31, true);


--
-- Name: riwayat_pendidikan_id_pendidikan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riwayat_pendidikan_id_pendidikan_seq', 27, true);


--
-- Name: suami_istri_id_suami_istri_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suami_istri_id_suami_istri_seq', 8, true);


--
-- Name: anak anak_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anak
    ADD CONSTRAINT anak_pkey PRIMARY KEY (id_anak);


--
-- Name: data_pegawai data_pegawai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_pegawai
    ADD CONSTRAINT data_pegawai_pkey PRIMARY KEY (id_pegawai);


--
-- Name: hubungan_kerja hubungan_kerja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hubungan_kerja
    ADD CONSTRAINT hubungan_kerja_pkey PRIMARY KEY (id_hubker);


--
-- Name: jabatan_bendahara jabatan_bendahara_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jabatan_bendahara
    ADD CONSTRAINT jabatan_bendahara_pkey PRIMARY KEY (id_bendahara);


--
-- Name: jabatan jabatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jabatan
    ADD CONSTRAINT jabatan_pkey PRIMARY KEY (id_jabatan);


--
-- Name: lembur lembur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lembur
    ADD CONSTRAINT lembur_pkey PRIMARY KEY (id_lembur);


--
-- Name: mutasi mutasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mutasi
    ADD CONSTRAINT mutasi_pkey PRIMARY KEY (id_mutasi);


--
-- Name: orang_tua orang_tua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orang_tua
    ADD CONSTRAINT orang_tua_pkey PRIMARY KEY (id_ortu);


--
-- Name: pangkat pangkat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pangkat
    ADD CONSTRAINT pangkat_pkey PRIMARY KEY (id_pangkat);


--
-- Name: pemberhentian pemberhentian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pemberhentian
    ADD CONSTRAINT pemberhentian_pkey PRIMARY KEY (id_pemberhentian);


--
-- Name: perubahan_jam_kerja perubahan_jam_kerja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perubahan_jam_kerja
    ADD CONSTRAINT perubahan_jam_kerja_pkey PRIMARY KEY (id_jam_kerja);


--
-- Name: presensi presensi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presensi
    ADD CONSTRAINT presensi_pkey PRIMARY KEY (id_presensi);


--
-- Name: riwayat_pendidikan riwayat_pendidikan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwayat_pendidikan
    ADD CONSTRAINT riwayat_pendidikan_pkey PRIMARY KEY (id_pendidikan);


--
-- Name: suami_istri suami_istri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suami_istri
    ADD CONSTRAINT suami_istri_pkey PRIMARY KEY (id_suami_istri);


--
-- Name: anak anak_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anak
    ADD CONSTRAINT anak_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: hubungan_kerja hubungan_kerja_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hubungan_kerja
    ADD CONSTRAINT hubungan_kerja_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: jabatan_bendahara jabatan_bendahara_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jabatan_bendahara
    ADD CONSTRAINT jabatan_bendahara_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: jabatan jabatan_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jabatan
    ADD CONSTRAINT jabatan_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: lembur lembur_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lembur
    ADD CONSTRAINT lembur_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: mutasi mutasi_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mutasi
    ADD CONSTRAINT mutasi_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: orang_tua orang_tua_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orang_tua
    ADD CONSTRAINT orang_tua_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: pangkat pangkat_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pangkat
    ADD CONSTRAINT pangkat_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: pemberhentian pemberhentian_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pemberhentian
    ADD CONSTRAINT pemberhentian_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: perubahan_jam_kerja perubahan_jam_kerja_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perubahan_jam_kerja
    ADD CONSTRAINT perubahan_jam_kerja_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: presensi presensi_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presensi
    ADD CONSTRAINT presensi_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: riwayat_pendidikan riwayat_pendidikan_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwayat_pendidikan
    ADD CONSTRAINT riwayat_pendidikan_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- Name: suami_istri suami_istri_id_pegawai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suami_istri
    ADD CONSTRAINT suami_istri_id_pegawai_fkey FOREIGN KEY (id_pegawai) REFERENCES public.data_pegawai(id_pegawai);


--
-- PostgreSQL database dump complete
--

\unrestrict QhdZcaabsSoF81GokHXphx61B8cyE59dQ5Ce6Aa29xMhG1G0ZQh3qg8bjIkVY3g

