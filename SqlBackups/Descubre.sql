--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.4

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

DROP DATABASE IF EXISTS "Descubre";
--
-- Name: Descubre; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Descubre" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "Descubre" OWNER TO postgres;

\connect "Descubre"

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

--
-- Name: QuestionType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."QuestionType" AS ENUM (
    'Select',
    'RadioButton'
);


ALTER TYPE public."QuestionType" OWNER TO postgres;

--
-- Name: ResultState; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."ResultState" AS ENUM (
    'Finished',
    'OnProgress',
    'Cancelled'
);


ALTER TYPE public."ResultState" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Alternative; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Alternative" (
    "Id" integer NOT NULL,
    "ModalityId" integer NOT NULL,
    "Denomination" character varying(1024) NOT NULL,
    "Weight" integer,
    "Created_at" timestamp with time zone NOT NULL,
    "Updated_at" timestamp with time zone,
    "Status" boolean NOT NULL
);


ALTER TABLE public."Alternative" OWNER TO postgres;

--
-- Name: Alternative_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Alternative" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Alternative_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Career; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Career" (
    "Id" integer NOT NULL,
    "Denomination" character varying(512) NOT NULL,
    "Information" text NOT NULL,
    "Duration" integer NOT NULL,
    "Created_at" timestamp with time zone NOT NULL,
    "Updated_at" timestamp with time zone,
    "Status" boolean NOT NULL,
    "Link" text,
    laborfield character varying(128),
    salary character varying(128),
    photo text,
    categoriaid character varying(256)
);


ALTER TABLE public."Career" OWNER TO postgres;

--
-- Name: CareerModality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CareerModality" (
    "Id" integer NOT NULL,
    "CareerId" integer NOT NULL,
    "ModalityId" integer NOT NULL,
    "Weight" integer NOT NULL
);


ALTER TABLE public."CareerModality" OWNER TO postgres;

--
-- Name: CareerModality_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."CareerModality" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."CareerModality_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Career_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Career" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Career_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Institution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Institution" (
    "Id" integer NOT NULL,
    "Denomination" character varying(1024) NOT NULL,
    "Information" text NOT NULL,
    "Created_at" timestamp with time zone NOT NULL,
    "Updated_at" timestamp with time zone,
    "Status" boolean NOT NULL,
    departament character varying(128),
    province character varying(128),
    creationdate character varying(128),
    licensing character varying(256),
    photo text
);


ALTER TABLE public."Institution" OWNER TO postgres;

--
-- Name: InstitutionCareer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InstitutionCareer" (
    "Id" integer NOT NULL,
    "InstitutionId" integer NOT NULL,
    "CareerId" integer NOT NULL
);


ALTER TABLE public."InstitutionCareer" OWNER TO postgres;

--
-- Name: InstitutionCareer_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."InstitutionCareer" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."InstitutionCareer_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Institution_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Institution" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Institution_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Modality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Modality" (
    "Id" integer NOT NULL,
    "TestId" integer NOT NULL,
    "Denomination" character varying(512) NOT NULL,
    "Description" text,
    "Image" text,
    "Created_at" timestamp with time zone NOT NULL,
    "Updated_at" timestamp with time zone,
    "Status" boolean NOT NULL
);


ALTER TABLE public."Modality" OWNER TO postgres;

--
-- Name: Modality_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Modality" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Modality_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Recomendation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recomendation" (
    "Id" integer NOT NULL,
    "ResultId" integer NOT NULL,
    "CareerId" integer NOT NULL,
    "Comments" text
);


ALTER TABLE public."Recomendation" OWNER TO postgres;

--
-- Name: Recomendation_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Recomendation" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Recomendation_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Response; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Response" (
    "Id" integer NOT NULL,
    "TestResultId" integer NOT NULL,
    "AlternativeId" integer NOT NULL,
    "Score" integer NOT NULL
);


ALTER TABLE public."Response" OWNER TO postgres;

--
-- Name: Response_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Response" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Response_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Result" (
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "StatusId" integer NOT NULL,
    "StartDate" timestamp with time zone NOT NULL,
    "EndDate" timestamp with time zone
);


ALTER TABLE public."Result" OWNER TO postgres;

--
-- Name: Result_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Result" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Result_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    "Id" integer NOT NULL,
    "Denomination" character varying(512) NOT NULL,
    "Created_at" timestamp with time zone NOT NULL,
    "Updated_at" timestamp with time zone,
    "Status" boolean NOT NULL
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- Name: Role_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Role" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Role_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Status" (
    "Id" integer NOT NULL,
    "Denomination" character varying(32)
);


ALTER TABLE public."Status" OWNER TO postgres;

--
-- Name: Test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Test" (
    "Id" integer NOT NULL,
    "Denomination" character varying(512) NOT NULL,
    "AverageTime" integer NOT NULL,
    "Instructions" text,
    "Created_at" timestamp with time zone NOT NULL,
    "Updated_at" timestamp with time zone,
    "Status" boolean NOT NULL
);


ALTER TABLE public."Test" OWNER TO postgres;

--
-- Name: TestResult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TestResult" (
    "Id" integer NOT NULL,
    "ResultId" integer NOT NULL,
    "TestId" integer NOT NULL,
    "ModalityId" integer NOT NULL,
    "Total" integer NOT NULL,
    "AverageTime" integer
);


ALTER TABLE public."TestResult" OWNER TO postgres;

--
-- Name: TestResult_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."TestResult" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TestResult_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Test_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Test" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Test_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "Id" integer NOT NULL,
    "RolId" integer NOT NULL,
    "Username" character varying(512) NOT NULL,
    "Password" character varying(512) NOT NULL,
    "DNI" character varying(8),
    "LastName" character varying(256) NOT NULL,
    "FirstName" character varying(256) NOT NULL,
    "Email" character varying(512) NOT NULL,
    "Birthday" timestamp with time zone NOT NULL,
    "Gender" character varying(1) NOT NULL,
    "Phone" character varying(32),
    "Created_at" timestamp with time zone NOT NULL,
    "Updated_at" timestamp with time zone,
    "Status" boolean NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."User" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."User_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: Alternative; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (166, 21, 'Competir en carreras de velocidad', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (164, 21, 'Practicar ejercicios que requieran equilibrio', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (167, 20, 'Realizar construcciones en tres dimensiones', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (165, 20, 'Dibujar objetos en tres dimensiones', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (168, 17, 'Leer m??sica en una partitura o pentagrama', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (158, 19, 'Exponer un tema en p??blico', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (133, 16, 'Identificar las ideas principales de un texto', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (155, 22, 'Identificar r??pidamente tus necesidades psicol??gicas', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (135, 16, 'Escribir una redacci??n breve sin errores ortogr??ficos', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (129, 16, 'Escribir una redacci??n breve sin errores gramaticales', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (143, 23, 'Identificar las diferencias entre animales de un mismo tipo', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (16, 1, 'Estudiar el funcionamiento del comportamiento humano', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (32, 1, 'Investigar acontecimientos de la historia nacional', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (42, 1, 'Leer y analizar libros hist??ricos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (78, 1, 'Realizar trabajos de cr??tica y an??lisis literario', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (15, 3, 'Construir caminos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (189, 27, 'Cari??oso', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (188, 25, 'Anal??tico', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (191, 26, 'Detallista', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (190, 24, 'Audaz', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (177, 25, 'Convincente', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (176, 26, 'Directa', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (203, 24, 'Valiente', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (200, 27, 'Satisfecho', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (201, 24, 'Persuasivo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (182, 26, '??tica', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (183, 24, 'Inspiradora', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (252, 26, 'Objetiva', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (197, 27, 'Humana', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (194, 27, 'Pol??tica', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (206, 25, 'D??cil', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (199, 25, 'Disciplinado', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (236, 26, 'Escrupuloso', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (205, 24, 'Sociable', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (234, 25, 'Tenso', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (144, 23, 'Obtener notas altas en Biolog??a', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (139, 19, 'Coordinar un grupo', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (136, 22, 'Describir con precisi??n tus sentimientos', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (138, 22, 'Comprender las causas de tus estados de ??nimo', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (128, 22, 'Identificar r??pidamente tus sentimientos', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (145, 23, 'Realizar an??lisis de materia org??nica', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (150, 19, 'Defender los derechos de otras personas', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (157, 16, 'Reconocer diferentes g??neros de escritura', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (131, 18, 'Realizar mentalmente operaciones matem??ticas', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (123, 20, 'Armar maquetas o modelos', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (130, 21, 'Practicar ejercicios que requieran esfuerzo prolongado', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (154, 16, 'Escribir de manera coherente y organizada', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (153, 21, 'Practicar ejercicios que requieran resistencia', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (161, 19, 'Percibir r??pidamente los sentimientos de otras personas', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (132, 21, 'Practicar ejercicios que requieran precisi??n', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (147, 18, 'Resolver ecuaciones matem??ticas', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (142, 23, 'Hacer experimentos para analizar fen??menos naturales', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (100, 1, 'Investigar la mitolog??a griega', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (122, 17, 'Afinar un instrumento musical', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (146, 18, 'Resolver problemas que requieran c??lculos num??ricos', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (141, 23, 'Usar t??cnicas para medir la contaminaci??n ambiental', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (162, 17, 'Componer temas musicales sencillos', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (156, 20, 'Dibujar con precisi??n', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (160, 20, 'Dibujar planos de una vivienda', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (137, 17, 'Interpretar un instrumento musical', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (149, 21, 'Practicar ejercicios que requieran agilidad', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (124, 19, 'Emplear la perspectiva en el dibujo', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (163, 18, 'Resolver problemas de la F??sica', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (152, 19, 'Iniciar y mantener conversaciones con diferentes personas', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (134, 17, 'Realizar variaciones o arreglos de un tema musical', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (127, 16, 'Analizar textos literarios', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (148, 17, 'Interpretar un instrumento en una orquesta o grupo musical', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (114, 1, 'Estudiar la biograf??a de pensadores famosos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (121, 16, 'Hablar con personas de mayor autoridad', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (151, 23, 'Conocer una gran variedad de vegetales', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (140, 22, 'Conocer tus capacidades para enfrentar diferentes situaciones', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (126, 18, 'Obtener notas altas en Matem??tica', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (125, 18, 'Resolver problemas geom??tricos', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (159, 22, 'Conocer tus limitaciones para enfrentar diferentes situaciones', NULL, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (235, 24, 'Seductor', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (238, 25, 'Indeciso', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (237, 27, 'De trato facil', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (243, 24, 'Osado', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (242, 26, 'Cerebral', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (245, 27, 'Desenvuelto', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (244, 25, 'Tranquilo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (247, 24, 'Distinguido', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (246, 26, 'Cuidadoso', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (179, 27, 'Confiable', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (178, 25, 'Inteligente', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (181, 26, 'Exigente', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (211, 27, 'Popular', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (212, 25, 'Evasivo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (215, 25, 'Paciente', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (214, 27, 'De buen caracter', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (202, 25, 'Justo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (232, 25, 'Calmado', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (204, 27, 'Servicial', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (207, 25, 'Receptiva', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (184, 27, 'Considerado', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (185, 26, 'Exacta', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (192, 27, 'Leal', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (195, 24, 'Aventurero', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (225, 24, 'Agresivo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (224, 26, 'Desconfiado', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (227, 26, 'Fria', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (226, 24, 'Extrovertido', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (198, 24, 'Optimista', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (217, 25, 'Controlada', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (216, 26, 'Elegante', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (219, 26, 'Firme', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (218, 25, 'Obediente', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (221, 27, 'Tolerante', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (220, 25, 'Susceptible', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (223, 27, 'Atractivo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (222, 26, 'Preocupado', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (208, 26, 'Esc??ptica', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (254, 26, 'L??gica', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (241, 27, 'Bromista', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (169, 24, 'Agradable', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (180, 26, 'Defensiva', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (231, 24, 'Emprendor', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (171, 24, 'Arriesgado', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (170, 25, 'Reflexivo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (173, 27, 'Alegre', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (172, 25, 'Racional', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (175, 27, 'LLevadera', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (174, 27, 'Armoniosa', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (240, 26, 'Estable', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (253, 24, 'En??rgica', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (250, 26, 'Precavido', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (248, 26, 'Indagador', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (249, 24, 'Ingenioso', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (230, 26, 'Cauteloso', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (196, 24, 'Locuaz', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (228, 24, 'Dispuesta', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (229, 26, 'Recta', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (187, 27, 'Jovial', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (186, 24, 'Competitivo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (54, 10, 'Efectuar pron??sticos de fen??menos astron??micos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (112, 12, 'Analizar juicios', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (108, 9, 'Desgrabar entrevistas en otro idioma', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (107, 11, 'Leer una partitura', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (28, 3, 'Inspeccionar construcciones edilicias', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (7, 3, 'Conocer diferentes estilos arquitect??nicos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (99, 6, 'Realizar dibujos para publicidades', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (82, 9, 'Analizar los distintos dialectos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (73, 10, 'Determinar la edad de los f??siles', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (115, 3, 'Dise??ar puentes', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (61, 4, 'Adquirir conocimientos de ??lgebra', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (2, 8, 'Redactar anuncios publicitarios', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (120, 8, 'Implementar encuestas de opini??n p??blica', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (35, 9, 'Comunicarse con otras personas en idioma extranjero', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (104, 5, 'Analizar la situaci??n econ??mica-financiera de una empresa', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (14, 15, 'Realizar an??lisis de productos industriales', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (98, 12, 'Trabajar en servicios diplom??ticos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (41, 10, 'Investigar los misterios del espacio', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (75, 15, 'Dise??ar unidades ??pticas para autom??viles', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (34, 7, 'Asesorar sobre m??todos de cultivo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (193, 26, 'De fuertes principios', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (233, 24, 'Dominante', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (239, 24, 'Seguro de si mismo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (210, 24, 'Posesiva', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (213, 24, 'Determinado', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (209, 24, 'Decidido', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (251, 25, 'Sereno', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (6, 2, 'Investigar las causas de las enfermedades coronarias', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (85, 5, 'ELaborar planes de desarrollo econ??mico', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (116, 11, 'Realizar arreglos musicales', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (101, 2, 'Asesorar a las personas para mejorar su calidad de vida', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (95, 10, 'Investigar la atm??sfera extraterrestre', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (97, 2, 'Cuidar a pacientes en cuidados intensivos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (91, 4, 'Ense??ar matem??tica', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (40, 6, 'Estudiar los distintos estilos de pintura', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (26, 2, 'Ayudar a las personas a mejorar su alimentaci??n', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (81, 7, 'Investigar sobre nuevas variedades de plantas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (118, 11, 'Investigar sobre los instrumentos musicales de distintas naciones', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (9, 14, 'Realizar entrevistas de orientaci??n vocacional', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (71, 11, 'Componer e interpretar m??sica', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (46, 6, 'Realizar pinturas murales', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (56, 6, 'Realizar cr??ticas de cine y teatro', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (24, 5, 'Investigar sobre los problemas econ??micos a nivel nacional', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (12, 14, 'Asesorar a alumnos sobre t??cnicas de estudio', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (5, 5, 'Realizar an??lisis de encuestas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (86, 6, 'Fabricar materiales pl??sticos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (38, 6, 'Conocer diversas t??cnicas de dibujo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (106, 15, 'Armar motores', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (94, 7, 'Proteger especies animales en peligro de extinci??n', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (10, 3, 'Trabajar en empresas constructoras', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (3, 14, 'Diagnosticar problemas psicool??gicos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (59, 6, 'Decorar los interiores de un hogar', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (74, 8, 'Trabajar en una agencia de noticias', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (30, 5, 'Adminstrar una peque??a empresa', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (90, 12, 'Analizar la actividad pol??tica del pa??s y de la regi??n', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (43, 5, 'Investigar el impacto de la inflaci??n sobre los precios', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (11, 4, 'Realizar c??lculos matem??ticos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (52, 6, 'Dictar clases de dibujo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (113, 4, 'Resolver ecuaciones matem??ticas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (55, 13, 'Investigar el fen??meno de los ??tomos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (117, 7, 'Asesorar sobre el cuidado de animales', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (111, 14, 'Determinar las causas de la deserci??n escolar', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (49, 2, 'Colaborar con programas de prevenci??n de enfermedades', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (53, 15, 'Reparar tel??fonos celulares', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (47, 5, 'Mejorar las condiciones laborales de una empresa', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (110, 15, 'Construir prototipos de aeromodelismo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (109, 14, 'Ayudar a las personas con problemas emocionales', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (65, 15, 'Armar circuitos electr??nicos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (79, 12, 'Defender acusados en un juicio', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (60, 12, 'Capacitar a dirigentes pol??ticos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (33, 8, 'Tomar fotograf??as para ilustrar notas period??sticas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (36, 6, 'Musicalizar obras de teatro', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (69, 6, 'Dise??ar esculturas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (39, 14, 'Dise??ar la curr??cula de una materia', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (66, 2, 'Educar para una correcta higiene bucal', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (96, 3, 'Evaluar el estado de las redes el??ctricas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (8, 7, 'Conocer las especies ganaderas m??s importantes', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (80, 3, 'Planificar la construcci??n de obras mar??timas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (48, 14, 'Trabajar como docente en un instituto', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (63, 14, 'Organizar un establecimiento de educaci??n', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (58, 11, 'Ejecutar un instrumento musical', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (45, 12, 'Trabajar en los tribunales de justicia', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (31, 13, 'Trabajar en un laboratorio', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (20, 15, 'Trabajar con m??quinas calculadoras', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (72, 9, 'Pronuciar correctamente en una lengua extranjera', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (89, 2, 'Conocer el funcionamiento de la anatom??a humana', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (102, 3, 'Dise??ar obrar de arquitectura', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (77, 12, 'Asesorar a personas en juicios de divorcio', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (70, 9, 'Traducir textos comerciales a otros', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (1, 10, 'Conocer el origen del universo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (4, 12, 'Participar en actividades pol??ticas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (27, 10, 'Investigar la composici??n de los minerales', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (29, 10, 'Buscar restos arqueol??gicos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (105, 3, 'Analizar los posibles da??os de las construcciones', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (57, 8, 'Organizar las relaciones p??blicas de una empresa', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (50, 11, 'Ense??ar t??cnicas de direcci??n de orquesta', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (22, 10, 'Manipular un telescopio', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (93, 7, 'Investigar la flora y fauna nacionales', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (84, 9, 'Analizar textos literarios en otro idioma', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (87, 9, 'Dar clases en una academia de idiomas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (18, 10, 'Recolectar muestras de rocas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (19, 5, 'Analizar las relaciones internacionales de una empresa', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (83, 9, 'Realizar traducciones cient??ficas a otro idioma', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (51, 15, 'Trabajar con equipos electr??nicos', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (103, 14, 'Ense??ar literatura a j??venes', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (62, 13, 'Organizar el ??rea de qu??mica de una empresa', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (88, 3, 'Realixar proyectos de electrificaci??n rural', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (17, 4, 'Trabajar con elementos de geometr??a', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (67, 11, 'Desempe??arse como int??rprete en un evento', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (76, 8, 'Filmar documentales sobre diversos temas de inter??s', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (92, 3, 'Controlar los planos de una obra', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (37, 10, 'Investigar los factores que impactan sobre el uso del suelo', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (13, 13, 'Investigar el empleo de la energ??a nuclear', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (64, 11, 'Reconocer los diferentes elementos de una orquesta', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (44, 4, 'Elaborar modelos matem??ticos para resolver problemas', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (68, 8, 'Producir programas de televisi??n', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (119, 10, 'Investigar las propiedades de los metales', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (25, 7, 'Investigar t??cnicas de producci??n agricola-ganadera', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (23, 4, 'Leer revistas espec??ficas de matem??tica', 1, '0001-01-01 00:00:00+00', NULL, true);
INSERT INTO public."Alternative" ("Id", "ModalityId", "Denomination", "Weight", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (21, 9, 'Analizar el lenguaje latinoamericano', 1, '0001-01-01 00:00:00+00', NULL, true);


--
-- Data for Name: Career; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (4, 'INGENIER??A AGROFORESTAL', 'Competencias acad??micas o disciplinarias: El estudiante retiene y aplica definiciones apropiadas en el proceso de aprendizaje de las ciencias b??sicas para comprender la din??mica de los sistemas agroforestales. Asimismo, deduce, interpreta, ejecuta y propone alternativas de soluci??n frente a problem??ticas sociales, econ??micas, ambientales y agroforestales, teniendo en cuenta cualidades profesionales de aprender a conocer, a hacer, a convivir y a ser.|Competencias profesionales: El Profesional Agroforestal resuelve problem??ticas en la producci??n agroforestal y medio ambiental del pa??s, como una estrategia adecuada para la recuperaci??n de agro ecosistemas degradados, adem??s de contribuir al desarrollo socioecon??mico de las regiones agr??colas y forestales. De igual manera crea, acopla, asimila y desarrolla tecnolog??as que sean competitivas y de beneficio a las comunidades mediante la actividad agroforestal, teniendo en cuenta la sostenibilidad econ??mica, social y ambiental. As?? mismo resuelve problemas de productividad y gesti??n empresarial sustent??ndose en sus conocimientos de formaci??n acad??mica y aprovecha sosteniblemente recursos locales, regionales, y nacionales a trav??s de sistemas agroforestales, agro silvopastoriles o agro silvopecuarios.|Competencias ocupacionales: El ingeniero agroforestal de la UNSCH, se encuentra con capacidad para realizar diagn??stico y evaluaci??n de la situaci??n actual de la actividad agroforestal de la regi??n o del pa??s y proponer t??cnicas, pr??cticas y sistemas agroforestales con la finalidad de contribuir al manejo sustentable de los recursos naturales y desarrollo del pa??s, destacando la funci??n de mantenimiento de la biodiversidad en paisajes agr??colas deforestados; la reducci??n de la erosi??n y recuperaci??n de suelos degradados y por tanto la conservaci??n y recuperaci??n de la capacidad productiva del suelo y el mantenimiento de cantidad y calidad del agua.', 5, '2021-07-17 19:19:24.836056+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (5, 'BIOLOG??A', 'Realizar an??lisis microbiol??gicos con fines de prevenci??n y diagn??stico de enfermedades en seres vivos, as?? como el control de calidad microbiol??gica de alimentos y medicamentos.|Intervenir en programas de manejo y conservaci??n de los recursos naturales y labiodiversidad.|Aplicar herramientas biotecnol??gicas buscando contribuir en la soluci??n de problemas en agricultura, producci??n animal, producci??n y transformaci??n de alimentos, salud y ambiente.', 5, '2021-07-17 19:19:24.838021+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (6, 'EDUCACI??N INICIAL', 'Forma al profesional capacitado en la estimulaci??n temprana y aprestamiento integral del ni??o menor de 6 a??os, con una s??lida preparaci??n cient??fica y pedag??gica para conducir ??ptimamente el proceso educativo de los ni??os, al mismo tiempo de desarrollar el trabajo con padres de familia y la comunidad.', 5, '2021-07-17 19:19:24.839658+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (7, 'EDUCACI??N PRIMARIA', '', 5, '2021-07-17 19:19:24.841484+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (8, 'EDUCACI??N SECUNDARIA', 'Forma al profesional para que asume la responsabilidad de capacitar integralmente a los adolescentes y j??venes y conducir el proceso de ense??anza-aprendizaje usando los mejores m??todos y estrategias did??cticas de manera racional y cient??fica. Al finalizar con su carrera estar?? en condiciones de ejercer la docencia en el nivel secundario y universitario, de acuerdo a su especialidad; promover, organizar y dirigir instituciones educativas y desarrollar trabajos de investigaci??n pedag??gica. ', 5, '2021-07-17 19:19:24.843566+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (9, 'EDUCACI??N F??SICA', 'Forma al profesional que orienta las disciplinas f??sicas, deportivas y recreativas para incentivarlas en los educandos como parte de su desarrollo integral y equilibrado. Al concluir la carrera estar?? capacitado para ejercer la docencia en todos los niveles de la educaci??n nacional, promover el deporte en sus diferentes disciplinas y participar en la conservaci??n de la salud y la rehabilitaci??n de personas discapacitadas.', 5, '2021-07-17 19:19:24.845505+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (10, 'CONTABILIDAD Y AUDITOR??A', 'El ingresante a la carrera profesional de Contabilidad y Auditor??a debe tener desarrollado un pensamiento cr??tico, reflexivo y comunicativo, que posea conocimientos de las matem??ticas, razonamiento l??gico matem??tico y emprendedurismo', 5, '2021-07-17 19:19:24.847133+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (11, 'ADMINISTRACI??N DE EMPRESAS', 'Conocimiento integral de la empresa y organizaciones en general, para asumir los retos de las ??reas funcionales.|S??lidas habilidades anal??ticas.|Capacidad de resolver problemas complejos.|Capacidad para trabajar en equipos multidisciplinarios y bajo presi??n.|Habilidad para realizar propuestas de innovaci??n y creatividad en los negocios.|Habilidades de comunicaci??n orales y escritas.|Potencial  para contribuir al crecimiento y  desarrollo de empresas con ??tica y responsabilidad.', 5, '2021-07-17 19:19:24.848339+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (12, 'ECONOM??A', 'Cient??fico social del desarrollo integral, con conocimientos de la teor??a econ??mica, m??todos cuantitativos, finanzas y de investigaci??n, posee una capacidad anal??tica, critica, reflexiva creativa, de adaptaci??n tecnol??gica y aplicaci??n de instrumentos especializados para emprender, liderar, accionar y transformar los procesos econ??micos-sociales en las esferas productivas y distributiva de los resultados, as?? como coadyuvar a la gesti??n estatal planificada con valores ??ticos de responsabilidad social.', 5, '2021-07-17 19:19:24.849742+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (13, 'DERECHO', 'Desempe??ar la profesi??n con solvencia cient??fica y t??cnica, resolviendo adecuada y eficientemente los casos y/o problemas que se le plantean en su ejercicio profesional, aplicando las normas constitucionales, legales e infra legales acordes con el constitucionalismo y orientados al restablecimiento de la paz social con equidad.|Prestigiar el desempe??o profesional en los diferentes ??mbitos, tanto del sector p??blico como del sector privado.|Conducirse profesionalmente como l??der, con conocimiento de su entorno social, planteando propuestas de soluci??n a los problemas individuales y sociales.|Ejercer la profesi??n con respeto a los derechos humanos; el cumplimiento de los deberes c??vicos; es decir, de manera ??tica en lo individual como social, demostrando su formaci??n principista, rechazando y recusando toda forma de corrupci??n p??blica o privada.', 6, '2021-07-17 19:19:24.85119+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (2, 'INGENIER??A AGR??COLA', 'Fomenta y ejecuta proyectos de investigaci??n y eval??a los diferentes proyectos regionales y nacionales relacionados con la agroindustria, electrificaci??n, obras hidr??ulicas, saneamiento y caminos rurales instalaciones agr??colas, ganaderas y desarrollo rural en general.|Planifica y gerencia el manejo integral de cuencas.|Selecciona, dise??a, mantiene y administra las maquinarias y equipos utilizados en el medio rural; as?? como el aprovechamiento de la energ??a convencional y no  convencional.', 5, '2021-07-17 19:19:24.82641+00', '2021-07-18 13:36:55.79397+00', true, NULL, NULL, NULL, NULL, 'CIENCIAS AGRARIAS');
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (3, 'MEDICINA VETERINARIA', 'Fomenta la investigaci??n cient??fica y tecnol??gica orientada a la creaci??n y mejoramiento de tecnolog??as del sector.|Administra programas de salud animal y desarrollo pecuario, a mediano y largo plazo, en el ??mbito regional o nacional.|Preserva la salud p??blica y controla la calidad de alimentos de origen pecuario.|Orienta y asesora a ganaderos y comuneros en los aspectos de explotaci??n pecuaria.', 5, '2021-07-17 19:19:24.833474+00', '2021-07-18 13:38:16.470073+00', true, NULL, NULL, NULL, NULL, 'CIENCIAS AGRARIAS');
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (14, 'TRABAJO SOCIAL', 'El trabajador social describe, interpreta y explica la problem??tica social en el contexto de nuestra sociedad.|El trabajador social investiga cient??ficamente la realidad social, regional y nacional.|El trabajador social realiza diagn??sticos sociales, a fin de dise??ar y planificar una intervenci??n profesional promoviendo el desarrollo de las capacidades humanas y ampliando las opciones de la poblaci??n a partir de sus propias potencialidades.|El trabajador social se desempe??a en equipos multidisciplinarios para la investigaci??n, consultoria y promoci??n social.|El trabajador social gerencia proyectos de promoci??n social, realizando tareas de difusi??n y elaborando propuestas de pol??ticas publicas de impacto local, regional y nacional.|El trabajador social asume la docencia universitaria a in de formar profesionales con liderazgo.', 5, '2021-07-17 19:19:24.853363+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (15, 'ANTROPOLOG??A SOCIAL', 'Dirigir, participar en programas de investigaci??n cient??fica de su especialidad y ??reas afines, estando preparado para trabajar en equipos polivalentes de manera multidisciplinaria, interdisciplinaria y transdisciplinariamente.|Formular, ejecutar y evaluar planes y programas de desarrollo econ??mico y social a nivel local, regional y nacional.|Dirigir y participar en la elaboraci??n, ejecuci??n y evaluaci??n de planes, programas y proyectos de desarrollo.|Administrar instituciones y actividades culturales.|Participar e intervenir t??cnicamente en acciones orientadas a la defensa, conservaci??n y acrecentamiento del patrimonio cultural peruano y a la formaci??n de la conciencia hist??rica e identidad regional y nacional.|Desarrollar capacidades gerenciales y de liderazgo.|Desempe??ar la tarea docente en las diferentes modalidades de la Educaci??n Superior.', 5, '2021-07-17 19:19:24.855425+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (16, 'CIENCIAS DE LA COMUNICACI??N', 'Que act??a con efectividad como operador de cambios en escenarios p??blicos, haciendo uso de los medios de comunicaci??n masiva (prensa, radio y televisi??n) en funci??n al desarrollo.|Que crea, maneja e interpreta con eficiencia mensajes aplicados a los medios de comunicaci??n masiva y alternativa.|Que maneja con eficiencia el ciclo integral de un proceso de intervenci??n para el desarrollo, propuestas para el cambio de escenarios socioecon??micos: dise??o de proyectos, evaluaci??n, monitoreo, levantamiento de l??neas de base.|Experto en las t??cnicas de la comunicaci??n organizacional dirigida al interior y al exterior de las organizaciones. Dise??a diagn??sticos situacionales de las necesidades de comunicaci??n y propuestas de intervenci??n, y formula propuestas de posicionamiento institucional.|Investigador en el ??mbito de la comunicaci??n social.|Preparado para generar y gestionar empresas de comunicaciones.', 5, '2021-07-17 19:19:24.85715+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (17, 'ARQUEOLOG??A E HISTORIA', 'Entre las caracter??sticas deseables con que debe contar un aspirante a la Licenciatura en Arqueolog??a destaca su gran inquietud e inter??s por conocer y rescatar la historia del Per??. Deber?? caracterizarlo, adem??s, una gran sensibilidad, paciencia, tenacidad y conciencia clara en torno a una gran labor de trascendencia para el mejor conocimiento de nuestro complejo devenir hist??rico.|El arque??logo desempe??a una actividad f??sica y mental en el trabajo de excavaci??n, as?? como realiza una importante actividad intelectual en el campo y laboratorio. Debe mostrar un gran sentido de responsabilidad en respuesta al compromiso social que habr?? de asumir y a la importancia de la informaci??n que manejar??, cuyo uso y eventual divulgaci??n requiere de una alta calidad moral, ??tica y respeto.|Se requiere un individuo que en su proceder cotidiano demuestre entre los hechos integridad y disposici??n para el trabajo en equipo, as?? como una gran convicci??n ante las dificultades que enfrentar?? en su quehacer profesional. Que asuma un compromiso ante la sociedad y ante s?? mismo a fin de cumplir por encima de intereses que cuestionan su labor, sin conocer la verdadera esencia del quehacer cient??fico.', 5, '2021-07-17 19:19:24.858998+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (18, 'INGENIER??A CIVIL', 'Profesional con conocimientos cient??ficos, tecnol??gicos, habilidad innovadora y sensibilidad social capacitado para la planificaci??n, dise??o y el uso de herramientas m??s poderosas de su campo de acci??n.', 5, '2021-07-17 19:19:24.861082+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (19, 'INGENIER??A DE SISTEMAS', 'Elabora modelos, dise??os y construye sistemas realimentados.|Desarrolla software de diversa ??ndole y prop??sito, implementando arquitecturas de comunicaci??n de datos.|Construye sistemas adecuados para el soporte y la toma de decisiones, para el control y  operaciones en la industria.|Formula y administra proyectos en tecnolog??as de informaci??n, integrando los planes  estrat??gicos en sistemas de informaci??n y en tecnolog??as de informaci??n de negocios.|Investiga y construye sistemas para la administraci??n del conocimiento y ejerce la docencia superior.', 5, '2021-07-17 19:19:24.86259+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (20, 'CIENCIAS F??SICO MATEM??TICAS', 'Capacitado para dise??ar y desarrollar modelos matem??ticos aplicados a otras ciencias y tecnolog??as como Biolog??a, Qu??mica, Agronom??a, Ingenier??a, Ciencias de la Salud, Ciencias Sociales, Econom??a y otros campos del saber.|Participa en trabajos de investigaci??n en Ciencias Naturales e ingenier??a con tecnolog??as de ??ltima generaci??n.|Brinda consultor??as, asesor??as estad??sticas y capacitaci??n en software estad??stico y ejerce la docencia universitaria.', 5, '2021-07-17 19:19:24.864164+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (21, 'INGENIER??A DE MINAS', 'Profesional s??lido con capacidad t??cnica y gerencial, con profundos conocimientos actualizados en las ciencias y tecnolog??a.|Dise??a y planea los sistemas de minado de yacimientos minerales met??licos y no met??licos acorde con las normas ambientales, seguridad minera y salud ocupacional.|Competencias para la direcci??n de las empresas mineras, implementaci??n de las innovaciones tecnol??gicas, ???scalizaci??n minera y auditor??a ambiental.|Competencias para el dise??o y construcci??n de diversas obras subterr??neas.|Desempe??a la profesi??n dentro de los principios ??ticos y deontol??gicos.|Ejerce liderazgo para promover el trabajo en equipo, la toma de decisiones, supervisi??n y control de las operaciones mineras.', 5, '2021-07-17 19:19:24.86578+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (22, 'INGENIER??A QU??MICA', 'Seleccionar materias primas, insumos, variables y operaciones unitarias para el desarrollo de Tecnolog??as de Procesos Qu??micos Industriales en el marco de las normas de calidad del producto y est??ndares ambientales.|Organizar las ciencias de la Ingenier??a Qu??mica, operaciones y procesos unitarios para el dise??o de Plantas y Equipos Industriales de acuerdo a las normas y est??ndares nacionales e internacionales: ASTM y otros.|Planificar los estudios de mercado, tama??o y localizaci??n, ingenier??a del proyecto, evaluaci??n econ??mica y financiera, impactos ambientales para la Gesti??n de Proyectos Industriales teniendo en cuenta los niveles de estudio de inversi??n y las normas de inversi??n p??blica y privada vigentes: Invierte Per?? entre otros.', 5, '2021-07-17 19:19:24.867337+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (23, 'INGENIER??A EN INDUSTRIAS ALIMENTARIAS', 'Conservar las materias primas alimentarias y transformarlas en productos industrializados de consumo humano, con la mejor calidad y al m??s bajo precio.|Dise??ar con visi??n y creatividad los procesos, las plantas y los productos, en el volumen y cantidad suficientes que cubran las necesidades de los demandantes.|Aplicar principios cient??ficos,  tecnol??gicos y de ingenier??a, demostrados experimentalmente en su labor diaria de producci??n, control de calidad o de innovaci??n e investigaci??n cuando se requiera.|Gestionar la producci??n y la calidad en alimentos.|Ingenieros en Industrias Alimentarias con sentido social, comportamiento ??tico y capacidad de liderazgo.', 5, '2021-07-17 19:19:24.869428+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (25, 'FARMACIA Y BIOQU??MICA', 'Gestionar t??cnicamente los establecimientos farmac??uticos de acuerdo a pol??ticas institucionales y normas vigentes.|Realizar atenci??n farmac??utica, a las personas de los productos farmac??uticos, dispositivos m??dicos y productos sanitarios de acuerdo a las normas vigentes.|Regular la fabricaci??n y comercializaci??n de productos farmac??uticos, dispositivos m??dicos y productos sanitarios de acuerdo a las normas vigentes.|Analizar muestras biol??gicas y no biol??gicas, de productos farmac??uticos, dispositivos m??dicos y productos sanitarios de acuerdo a las normas vigentes.|Garantizar los procesos de producci??n de los productos farmac??uticos, dispositivos m??dicos y productos sanitarios de acuerdo a normas vigentes.', 5, '2021-07-17 19:19:24.873188+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (26, 'ENFERMER??A', 'Brinda cuidado en el ciclo de vida de la persona, familia y comunidad en sus etapas de desarrollo, en el proceso salud-enfermedad a trav??s del cuidado integral, educaci??n permanente, gesti??n e investigaci??n, teniendo en cuenta los valores morales y ??ticos, pleno respeto de la dignidad humana y principio de: integralidad, calidad y enfoque de interculturalidad.', 5, '2021-07-17 19:19:24.874907+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (27, 'OBSTETRICIA', 'Profesionales con competencias que brindan atenci??n integral a la mujer, familia y comunidad en salud sexual y reproductiva con ??nfasis en la etapa preconcepcional, concepcional y postconcepcional, desarrollando acciones preventivo-promocionales, asistenciales, de investigaci??n y administraci??n con responsabilidad social.', 5, '2021-07-17 19:19:24.876693+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (24, 'MEDICINA HUMANA', 'Brinda atenci??n integral de salud a nivel recuperativo, preventivo, promocional y rehabilitacional, con enfoque de salud individual y colectivo seg??n las necesidades de lapoblaci??n.|Realiza permanentemente investigaciones cient??ficas de car??cter original, contribuyendo a la soluci??n de problemas de inter??s regional y nacional.|Ejerce la profesi??n con alto sentido human??stico, filos??fico y ??tico, interpretando adecuadamente la historia de la medicina para contextualizarlas a la pr??ctica contempor??nea de la profesi??n m??dica.|Gerencia y gobierna organizaciones de salud en los diferente niveles de gesti??n, participando en diversos procesos pol??ticos y sociales que contribuyan a la mejora de la salud de la poblaci??n.', 10, '2021-07-17 19:19:24.871459+00', NULL, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Career" ("Id", "Denomination", "Information", "Duration", "Created_at", "Updated_at", "Status", "Link", laborfield, salary, photo, categoriaid) OVERRIDING SYSTEM VALUE VALUES (1, 'AGRONOM??A', 'Identifica y resuelve problemas del sector agrario a nivel regional y nacional.|Genera, gestiona y lidera proyectos que promueven el desarrollo agropecuario y social, con el  manejo racional del suelo, agua, clima, los cultivos, la sanidad vegetal, la ganader??a y la infraestructura agropecuaria para la producci??n y el desarrollo de una agricultura sostenible.|Desempe??a cargos directivos en entidades p??blicas y privadas del sector agrario o vinculado a ??l; ejerce la docencia y la investigaci??n e innovaci??n cient??fica y tecnol??gica.|Gestiona y gerencia su propia empresa, con su emprendimiento y compromiso para alcanzar su desarrollo profesional mediante estudios de maestr??a y doctorado en producci??n agr??cola, producci??n animal, econom??a agr??cola, ingenier??a agr??cola y desarrollo rural.', 5, '2021-07-17 19:19:24.564055+00', '2021-07-18 13:36:27.815477+00', true, NULL, NULL, NULL, NULL, 'CIENCIAS AGRARIAS');


--
-- Data for Name: CareerModality; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (2, 2, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (3, 3, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (4, 4, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (5, 5, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (6, 6, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (7, 7, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (8, 8, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (9, 9, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (10, 10, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (11, 11, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (12, 12, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (13, 13, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (14, 14, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (15, 15, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (16, 16, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (17, 17, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (18, 18, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (19, 19, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (20, 20, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (21, 21, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (22, 22, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (23, 23, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (24, 24, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (25, 25, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (26, 26, 1, 0);
INSERT INTO public."CareerModality" ("Id", "CareerId", "ModalityId", "Weight") OVERRIDING SYSTEM VALUE VALUES (27, 27, 1, 0);


--
-- Data for Name: Institution; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (1, 'Universidad Nacional de San Crist??bal de Huamanga', '', '2021-07-18 13:29:35.968241+00', NULL, true, 'Ayacucho', 'Huamanga', '03/07/1677', 'Res. N?? 050-2018-SUNEDU/CD', NULL);
INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (2, 'Universidad Nacional Mayor de San Marcos', '', '2021-07-18 13:29:36.228728+00', NULL, true, 'Lima', 'Lima', '12/05/1551', 'Res. N?? 036-2018-SUNEDU/CD', NULL);
INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (3, 'Universidad Nacional de San Antonio Abad del Cusco', '', '2021-07-18 13:29:36.23621+00', NULL, true, 'Cusco', 'Cusco', '01/06/1692', 'Res. N?? 059-2019-SUNEDU/CD', NULL);
INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (4, 'Universidad Nacional de Trujillo', '', '2021-07-18 13:29:36.239114+00', NULL, true, 'La Libertad', 'Trujillo', '10/05/1824', 'Res. N?? 127-2018-SUNEDU/CD', NULL);
INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (5, 'Universidad Nacional de San Agust??n de Arequipa', '', '2021-07-18 13:29:36.241161+00', NULL, true, 'Arequipa', 'Arequipa', '01/06/1692', 'Res. N?? 059-2019-SUNEDU/CD', NULL);
INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (6, 'Universidad Nacional de Ingenier??a', '', '2021-07-18 13:29:36.242718+00', NULL, true, 'Lima', 'Lima', '19/07/1955', 'Res. N?? 073-2017-SUNEDU/CD', NULL);
INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (7, 'Pontificia Universidad Cat??lica del Per??', '', '2021-07-18 13:29:36.244106+00', NULL, true, 'Lima', 'Lima', '24/03/1917', 'Res. N?? 025-2016-SUNEDU/CD', NULL);
INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (10, 'Universidad Ricardo Palma', '', '2021-07-18 13:29:36.249068+00', NULL, true, 'Lima', 'Lima', '01/07/1969', 'Res. N?? 040-2016-SUNEDU/CD', NULL);
INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (9, 'Universidad de San Mart??n de Porres', '', '2021-07-18 13:29:36.246892+00', NULL, true, 'Lima', 'Lima', '17/05/1962', 'Res. N?? 024-2017-SUNEDU/CD', NULL);
INSERT INTO public."Institution" ("Id", "Denomination", "Information", "Created_at", "Updated_at", "Status", departament, province, creationdate, licensing, photo) OVERRIDING SYSTEM VALUE VALUES (8, 'Universidad Peruana Cayetano Heredia', '', '2021-07-18 13:29:36.245509+00', NULL, true, 'Lima', 'Lima', '22/09/1961', 'Res. N?? 029-2016-SUNEDU/CD', NULL);


--
-- Data for Name: InstitutionCareer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (2, 1, 2);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (3, 1, 3);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (4, 1, 4);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (5, 1, 5);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (6, 1, 6);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (7, 1, 7);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (8, 1, 8);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (9, 1, 9);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (10, 1, 10);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (11, 1, 11);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (12, 1, 12);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (13, 1, 13);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (14, 1, 14);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (15, 1, 15);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (16, 1, 16);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (17, 1, 17);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (18, 1, 18);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (19, 1, 19);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (20, 1, 20);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (21, 1, 21);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (22, 1, 22);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (23, 1, 23);
INSERT INTO public."InstitutionCareer" ("Id", "InstitutionId", "CareerId") OVERRIDING SYSTEM VALUE VALUES (24, 1, 27);


--
-- Data for Name: Modality; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (1, 1, 'HUMAN??STICO - CULTURAL', 'Se vincula con la preservaci??n de los bienes culturales, la cr??tica y el asesoramiento literario, la investigaci??n de la realidad social e hist??rica, el an??lisis de fuentes bibliogr??ficas.', NULL, '2021-07-17 19:59:24.943488+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (2, 1, 'BIO ??? SANITARIO', 'Se vincula con la promoci??n de la salud y la recuperaci??n del enfermo a trav??s de la medicina asistencial.', NULL, '2021-07-17 19:59:25.217669+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (3, 1, 'CONSTRUCCI??N', 'Se vincula con la proyecci??n, direcci??n y ejecuci??n de obras arquitect??nicas, la decoraci??n, el dise??o y el proyecto de instalaciones.', NULL, '2021-07-17 19:59:25.225021+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (4, 1, 'C??LCULO', 'Se vincula con el abordaje de situaciones desde la matem??tica y elc??lculo.', NULL, '2021-07-17 19:59:25.227915+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (5, 1, 'ECONOM??A ??? ADMINISTRACI??N', 'Se vincula con la preparaci??n, an??lisis y proyecci??n de estados contables, presupuestarios y de impuestos en empresas, as?? como la elaboraci??n e implementaci??n de pol??ticas y procedimientos de trabajo administrativos.', NULL, '2021-07-17 19:59:25.230101+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (6, 1, 'ART??STICO ??? PL??STICO', 'Se vincula con la creaci??n art??stica, la ilustraci??n gr??fica, la educaci??n art??stica y la investigaci??n est??tica.', NULL, '2021-07-17 19:59:25.23194+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (7, 1, 'BIO ??? AGROPECUARIO', 'Se vincula con el conocimiento y la utilizaci??n de t??cnicas destinadas a sostener e incrementar la producci??n en materiaagr??cola-ganadera.', NULL, '2021-07-17 19:59:25.233422+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (8, 1, 'COMUNICACI??N SOCIAL', 'Se vincula con el tratamiento de la informaci??n, la recolecci??n y distribuci??n de la informaci??n y la comunicaci??n con fines comerciales, sociales y pol??ticos.', NULL, '2021-07-17 19:59:25.234938+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (9, 1, 'LENGUAS EXTRANJERAS', 'Se vincula con la docencia, la traducci??n escrita en diversas ??reas del conocimiento y la traducci??n en simult??neo.', NULL, '2021-07-17 19:59:25.23748+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (10, 1, 'GEOASTRON??MICO', 'Se vincula con el pron??stico de fen??menos astron??micos, el origen y evoluci??n del universo, el estudio de los recursos geol??gicos y el estudio integral de la tierra en tanto planeta.', NULL, '2021-07-17 19:59:25.239514+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (11, 1, 'ART??STICO ??? MUSICAL', 'Se vincula con la composici??n, arreglo e interpretaci??n musical, las investigaciones en materia de m??sica y la docencia en el arte musical.', NULL, '2021-07-17 19:59:25.242028+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (12, 1, 'JUR??DICO ??? POL??TICO', 'Se vincula con tareas de asesoramiento jur??dico y a la elaboraci??n de teor??as relativas a la vida pol??tica ', NULL, '2021-07-17 19:59:25.244381+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (13, 1, 'F??SICO ??? QU??MICO', 'Se vincula con la realizaci??n de an??lisis qu??micas, el desarrollo de la industria qu??mica y la investigaci??n de fen??menos f??sicos. ', NULL, '2021-07-17 19:59:25.246034+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (14, 1, 'EDUCATIVO ??? ASISTENCIAL', 'Se vincula con los m??todos de ense??anza y aprendizaje, la asistencia a sujetos con dificultades psicol??gicos o adaptativas y la comprensi??n de los problemas humanos.', NULL, '2021-07-17 19:59:25.247376+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (15, 1, 'TECNOL??GICO', 'Se vincula con la aplicaci??n de conocimientos cient??ficos y el perfeccionamiento de la t??cnica industrial. ', NULL, '2021-07-17 19:59:25.248686+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (16, 2, 'LING??ISTICA ??? VERBAL', 'Es la capacidad de emplear de manera eficaz las palabras, manipulando la estructura o sintaxis del lenguaje, la fon??tica, la sem??ntica y sus dimensiones pr??cticas.', NULL, '2021-07-17 19:59:25.250403+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (17, 2, 'MUSICAL', 'Es la capacidad de percibir, distinguir, transformar y expresar el ritmo, timbre y tono de los sonidos musicales.', NULL, '2021-07-17 19:59:25.25228+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (18, 2, 'L??GICO ??? MATEM??TICO', 'Es la capacidad de manejar n??meros, relaciones y patrones l??gicos de manera eficaz, as?? como otras funciones y abstracciones.', NULL, '2021-07-17 19:59:25.254719+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (19, 2, 'INTERPERSONAL', 'Es la posibilidad de distinguir y percibir los estados emocionales de los dem??s, y responder de manera efectiva a dichas acciones de forma pr??ctica.', NULL, '2021-07-17 19:59:25.256711+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (20, 2, 'ESPACIAL', 'Es la habilidad de apreciar con certeza la imagen visual y espacial, de representar gr??ficamente las ideas, y de sensibilizar el color, la l??nea, la forma, el espacio y sus interrelaciones.', NULL, '2021-07-17 19:59:25.258535+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (21, 2, 'CINEST??SICA', 'Es la habilidad para usar el cuerpo para expresar ideas y sentimientos, y sus particularidades de coordinaci??n, equilibrio, destreza, fuerza, flexibilidad y velocidad, as?? como propioceptivas y t??ctiles.', NULL, '2021-07-17 19:59:25.26059+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (22, 2, 'INTELIGENCIA INTRAPERSONAL', 'Es la habilidad de percibir adecuadamente los propios sentimientos y de actuar consecuentemente sobre la base de este conocimiento, de tener una autoimagen acertada, y capacidad de comprensi??n y amor propio.', NULL, '2021-07-17 19:59:25.262305+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (23, 2, 'NATURALISTA', 'Es la capacidad de distinguir, clasificar y utilizar elementos del medio ambiente, objetos, animales o plantas.', NULL, '2021-07-17 19:59:25.264186+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (24, 3, 'PERFIL PROACTIVO', '', NULL, '2021-07-17 19:59:25.265963+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (25, 3, 'PERFIL RECEPTIVO', '', NULL, '2021-07-17 19:59:25.268065+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (26, 3, 'PERFIL ORIENTADO A TAREAS', '', NULL, '2021-07-17 19:59:25.270384+00', NULL, true);
INSERT INTO public."Modality" ("Id", "TestId", "Denomination", "Description", "Image", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (27, 3, 'PERFIL ORIENTADO A PERSONAS', '??C??mo eres?:Eres una persona amistosa, persuasiva, cort??s.Aceptas las opiniones de los dem??s y escuchas efectivamente.|Te desempe??as bien en grupo, mostrando una actitud cordial y deseosa por ayudar|??C??mo te comunicas?:Posses la habilidad tanto de escuchar como de expresarte y te preocupas por que los dem??s entiendan el mensaje|Destacas por tu empat??a y captas r??pidamente la atenci??n de los dem??s.|Eres una persona serena y no amenazante en tu estilo de comunicaci??n, pero firme para defender tus argumentos.|??Qu?? te motiva?:Interactuar y relacionarte con la gente nueva y diferente.|Un ambiente amistoso y armonioso, donde puedas ayudar a los dem??s', NULL, '2021-07-17 19:59:25.272428+00', NULL, true);


--
-- Data for Name: Recomendation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Recomendation" ("Id", "ResultId", "CareerId", "Comments") OVERRIDING SYSTEM VALUE VALUES (1, 2, 27, '??Bien hecho!');


--
-- Data for Name: Response; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Result; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Result" ("Id", "UserId", "StatusId", "StartDate", "EndDate") OVERRIDING SYSTEM VALUE VALUES (1, 3, 3, '2021-11-19 22:56:45.689828+00', NULL);
INSERT INTO public."Result" ("Id", "UserId", "StatusId", "StartDate", "EndDate") OVERRIDING SYSTEM VALUE VALUES (2, 3, 4, '2021-11-19 23:14:22.34153+00', '2021-11-19 23:19:23.855117+00');


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Role" ("Id", "Denomination", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (1, 'Admin', '2021-07-17 17:33:39.820566+00', NULL, true);
INSERT INTO public."Role" ("Id", "Denomination", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (2, 'Expert', '2021-07-17 17:33:45.814944+00', NULL, true);
INSERT INTO public."Role" ("Id", "Denomination", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (3, 'Student', '2021-07-17 17:33:52.500197+00', NULL, true);


--
-- Data for Name: Status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Status" ("Id", "Denomination") OVERRIDING SYSTEM VALUE VALUES (1, 'Created');
INSERT INTO public."Status" ("Id", "Denomination") OVERRIDING SYSTEM VALUE VALUES (2, 'OnProgress');
INSERT INTO public."Status" ("Id", "Denomination") OVERRIDING SYSTEM VALUE VALUES (3, 'Cancelled');
INSERT INTO public."Status" ("Id", "Denomination") OVERRIDING SYSTEM VALUE VALUES (4, 'Finished');


--
-- Data for Name: Test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Test" ("Id", "Denomination", "AverageTime", "Instructions", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (1, 'Preferencias Vocacionales', 10, 'En las siguientes frases encontrar??s reflejadas diversas actividades y profesiones. Lee atentamente cada una de ellas y selecciona las que podr??an estar hablando de ti seg??n tus gustos personales. Debes indicar tus preferencias prescindiendo de otras consideraciones tales como ganancias econ??micas, tu capacidad para estudiar, posibilidades de encontrar trabajo en el futuro, prestigio, etc, No hay respuestas correctas ni incorrectas puesto que en ellas se refleja, simplemente, tuopini??n e intereses', '2021-07-17 17:05:22.509644+00', NULL, true);
INSERT INTO public."Test" ("Id", "Denomination", "AverageTime", "Instructions", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (3, 'Perfil de Comportamiento', 10, 'Lee el siguiente listado y marca cada palabra que usar??an ''text'' para describire. Recuerda marcar TODAS las palabras con las cuales entiendes que los dem??s te describen', '2021-07-17 17:15:40.644481+00', NULL, true);
INSERT INTO public."Test" ("Id", "Denomination", "AverageTime", "Instructions", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (2, 'Aptitudes', 10, '0 nada seguro de poder realizar esta actividad 
 4 totalmente seguro de poder realizar esta actividad 
 Puedes utilizar cualquier valor entre 0 y 4 para indicar tu nivel de seguridad. 
 Importante: Debes indicar tus respuestas en funci??n de lo que PUEDES realmente hacer y no de lo que te gustar??a  o interesar??a aprender.', '2021-07-17 17:11:59.65537+00', '2021-07-17 17:17:38.653113+00', true);


--
-- Data for Name: TestResult; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TestResult" ("Id", "ResultId", "TestId", "ModalityId", "Total", "AverageTime") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 3, 11, NULL);
INSERT INTO public."TestResult" ("Id", "ResultId", "TestId", "ModalityId", "Total", "AverageTime") OVERRIDING SYSTEM VALUE VALUES (2, 1, 2, 18, 20, NULL);
INSERT INTO public."TestResult" ("Id", "ResultId", "TestId", "ModalityId", "Total", "AverageTime") OVERRIDING SYSTEM VALUE VALUES (3, 2, 1, 3, 11, NULL);
INSERT INTO public."TestResult" ("Id", "ResultId", "TestId", "ModalityId", "Total", "AverageTime") OVERRIDING SYSTEM VALUE VALUES (4, 2, 2, 16, 14, NULL);
INSERT INTO public."TestResult" ("Id", "ResultId", "TestId", "ModalityId", "Total", "AverageTime") OVERRIDING SYSTEM VALUE VALUES (5, 2, 3, 24, 25, NULL);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."User" ("Id", "RolId", "Username", "Password", "DNI", "LastName", "FirstName", "Email", "Birthday", "Gender", "Phone", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Gedzeppelin', 'hgmO1xoP7UEwVrAmvetsp/brx2TyPkmb|BRKMh+X070LHNelyrh75z7N6QcrzfloV', '72499829', 'Palomino Naveros', 'Gedy Gedeon', 'gedy.palomino@gmail.com', '1996-07-24 14:48:00+00', 'M', '902729770', '0001-01-01 00:00:00+00', '2021-07-17 17:36:18.611511+00', false);
INSERT INTO public."User" ("Id", "RolId", "Username", "Password", "DNI", "LastName", "FirstName", "Email", "Birthday", "Gender", "Phone", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (2, 3, 'Lizelaser', 'Wj8KsZ6CVmyFSNY66vSeoxA/Ixsv4BXi|6ZJeeCZ2erKO5Z8JEyLCWd2uMzgbbhet', '74379437', 'La Serna Felices', 'Lieth Milagros', 'lizeth.lasernafelices@gmail.com', '1997-10-03 14:48:00+00', 'F', '933624871', '2021-11-19 22:21:22.503467+00', NULL, true);
INSERT INTO public."User" ("Id", "RolId", "Username", "Password", "DNI", "LastName", "FirstName", "Email", "Birthday", "Gender", "Phone", "Created_at", "Updated_at", "Status") OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Lizelasser', 'MoIuBJrOGOi+GiNvvn9ki49ffwWXHlDD|QeiHWf7CQ9MmUs6UxJhOAz+jzvch57Uu', '74379437', 'La Serna Felices', 'Lizeth Milagros', 'lizssdhdd@gmail.com', '1997-10-03 05:00:00+00', 'F', '933624871', '2021-11-19 22:56:37.198091+00', NULL, true);


--
-- Name: Alternative_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Alternative_Id_seq"', 254, true);


--
-- Name: CareerModality_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CareerModality_Id_seq"', 27, true);


--
-- Name: Career_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Career_Id_seq"', 27, true);


--
-- Name: InstitutionCareer_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."InstitutionCareer_Id_seq"', 24, true);


--
-- Name: Institution_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Institution_Id_seq"', 10, true);


--
-- Name: Modality_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Modality_Id_seq"', 27, true);


--
-- Name: Recomendation_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Recomendation_Id_seq"', 1, true);


--
-- Name: Response_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Response_Id_seq"', 1, false);


--
-- Name: Result_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Result_Id_seq"', 2, true);


--
-- Name: Role_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Role_Id_seq"', 3, true);


--
-- Name: TestResult_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TestResult_Id_seq"', 5, true);


--
-- Name: Test_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Test_Id_seq"', 3, true);


--
-- Name: User_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_Id_seq"', 3, true);


--
-- Name: status_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."status_Id_seq"', 4, true);


--
-- Name: CareerModality CareerModality_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CareerModality"
    ADD CONSTRAINT "CareerModality_pk" PRIMARY KEY ("Id");


--
-- Name: Career Carrera_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Career"
    ADD CONSTRAINT "Carrera_pk" PRIMARY KEY ("Id");


--
-- Name: InstitutionCareer InstitutionCareer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstitutionCareer"
    ADD CONSTRAINT "InstitutionCareer_pk" PRIMARY KEY ("Id");


--
-- Name: Institution Institution_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Institution"
    ADD CONSTRAINT "Institution_pk" PRIMARY KEY ("Id");


--
-- Name: Modality Modality_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modality"
    ADD CONSTRAINT "Modality_pk" PRIMARY KEY ("Id");


--
-- Name: Alternative Pregunta_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alternative"
    ADD CONSTRAINT "Pregunta_pk" PRIMARY KEY ("Id");


--
-- Name: Test Prueba_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Test"
    ADD CONSTRAINT "Prueba_pk" PRIMARY KEY ("Id");


--
-- Name: Recomendation Recomendacion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendation"
    ADD CONSTRAINT "Recomendacion_pk" PRIMARY KEY ("Id");


--
-- Name: Response Response_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Response"
    ADD CONSTRAINT "Response_PK" PRIMARY KEY ("Id");


--
-- Name: Result Result_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_pk" PRIMARY KEY ("Id");


--
-- Name: Role Rol_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Rol_pk" PRIMARY KEY ("Id");


--
-- Name: TestResult TestResult_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TestResult"
    ADD CONSTRAINT "TestResult_PK" PRIMARY KEY ("Id");


--
-- Name: User Usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "Usuario_pk" PRIMARY KEY ("Id");


--
-- Name: Status status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT status_pk PRIMARY KEY ("Id");


--
-- Name: Response Alternative_Response_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Response"
    ADD CONSTRAINT "Alternative_Response_FK" FOREIGN KEY ("AlternativeId") REFERENCES public."Alternative"("Id") MATCH FULL;


--
-- Name: CareerModality Career_CareerModality_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CareerModality"
    ADD CONSTRAINT "Career_CareerModality_FK" FOREIGN KEY ("CareerId") REFERENCES public."Career"("Id") MATCH FULL;


--
-- Name: InstitutionCareer Career_InstitutionCareer_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstitutionCareer"
    ADD CONSTRAINT "Career_InstitutionCareer_FK" FOREIGN KEY ("CareerId") REFERENCES public."Career"("Id") MATCH FULL;


--
-- Name: Recomendation Career_recomendation_Fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendation"
    ADD CONSTRAINT "Career_recomendation_Fk" FOREIGN KEY ("CareerId") REFERENCES public."Career"("Id") MATCH FULL;


--
-- Name: Alternative FK_Modality_Question; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alternative"
    ADD CONSTRAINT "FK_Modality_Question" FOREIGN KEY ("ModalityId") REFERENCES public."Modality"("Id") MATCH FULL;


--
-- Name: Modality FK_Test_Modality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modality"
    ADD CONSTRAINT "FK_Test_Modality" FOREIGN KEY ("TestId") REFERENCES public."Test"("Id") MATCH FULL;


--
-- Name: InstitutionCareer Institution_InstitutionCareer_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstitutionCareer"
    ADD CONSTRAINT "Institution_InstitutionCareer_FK" FOREIGN KEY ("InstitutionId") REFERENCES public."Institution"("Id") MATCH FULL;


--
-- Name: CareerModality Modality_CareerModality_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CareerModality"
    ADD CONSTRAINT "Modality_CareerModality_FK" FOREIGN KEY ("ModalityId") REFERENCES public."Modality"("Id") MATCH FULL;


--
-- Name: TestResult Modality_TestResult_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TestResult"
    ADD CONSTRAINT "Modality_TestResult_FK" FOREIGN KEY ("ModalityId") REFERENCES public."Modality"("Id") MATCH FULL;


--
-- Name: Recomendation Result_Recomendation_Fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendation"
    ADD CONSTRAINT "Result_Recomendation_Fk" FOREIGN KEY ("ResultId") REFERENCES public."Result"("Id") MATCH FULL;


--
-- Name: TestResult Result_TestResult_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TestResult"
    ADD CONSTRAINT "Result_TestResult_FK" FOREIGN KEY ("ResultId") REFERENCES public."Result"("Id") MATCH FULL;


--
-- Name: User Role_User_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "Role_User_FK" FOREIGN KEY ("RolId") REFERENCES public."Role"("Id") MATCH FULL;


--
-- Name: Result Status_result_Fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Status_result_Fk" FOREIGN KEY ("StatusId") REFERENCES public."Status"("Id");


--
-- Name: Response TestResult_Response_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Response"
    ADD CONSTRAINT "TestResult_Response_FK" FOREIGN KEY ("TestResultId") REFERENCES public."TestResult"("Id") MATCH FULL;


--
-- Name: TestResult Test_TestResult_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TestResult"
    ADD CONSTRAINT "Test_TestResult_FK" FOREIGN KEY ("TestId") REFERENCES public."Test"("Id") MATCH FULL;


--
-- Name: Result User_Result_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "User_Result_fk" FOREIGN KEY ("UserId") REFERENCES public."User"("Id") MATCH FULL;


--
-- PostgreSQL database dump complete
--

