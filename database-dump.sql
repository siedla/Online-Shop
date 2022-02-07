--
-- PostgreSQL database dump
--

-- Dumped from database version 11.10 (Ubuntu 11.10-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.2

-- Started on 2021-06-08 22:26:02

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
-- TOC entry 4103 (class 1262 OID 906412)
-- Name: oeqenakg; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE oeqenakg WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


\connect oeqenakg

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
-- TOC entry 9 (class 3079 OID 17135)
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- TOC entry 4105 (class 0 OID 0)
-- Dependencies: 9
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- TOC entry 5 (class 3079 OID 17680)
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- TOC entry 4106 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- TOC entry 16 (class 3079 OID 16661)
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- TOC entry 4107 (class 0 OID 0)
-- Dependencies: 16
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- TOC entry 7 (class 3079 OID 17577)
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- TOC entry 4108 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- TOC entry 22 (class 3079 OID 16384)
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- TOC entry 4109 (class 0 OID 0)
-- Dependencies: 22
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- TOC entry 10 (class 3079 OID 17130)
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- TOC entry 4110 (class 0 OID 0)
-- Dependencies: 10
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- TOC entry 4 (class 3079 OID 18303)
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- TOC entry 4111 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- TOC entry 6 (class 3079 OID 17664)
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- TOC entry 4112 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- TOC entry 17 (class 3079 OID 16650)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 4113 (class 0 OID 0)
-- Dependencies: 17
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 11 (class 3079 OID 17007)
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- TOC entry 4114 (class 0 OID 0)
-- Dependencies: 11
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- TOC entry 12 (class 3079 OID 16889)
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- TOC entry 4115 (class 0 OID 0)
-- Dependencies: 12
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- TOC entry 20 (class 3079 OID 16444)
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- TOC entry 4116 (class 0 OID 0)
-- Dependencies: 20
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- TOC entry 2 (class 3079 OID 18315)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- TOC entry 4117 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


--
-- TOC entry 13 (class 3079 OID 16812)
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- TOC entry 4118 (class 0 OID 0)
-- Dependencies: 13
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- TOC entry 14 (class 3079 OID 16775)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4119 (class 0 OID 0)
-- Dependencies: 14
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 8 (class 3079 OID 17571)
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- TOC entry 4120 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- TOC entry 19 (class 3079 OID 16619)
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- TOC entry 4121 (class 0 OID 0)
-- Dependencies: 19
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- TOC entry 18 (class 3079 OID 16629)
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- TOC entry 4122 (class 0 OID 0)
-- Dependencies: 18
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- TOC entry 3 (class 3079 OID 18308)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 4123 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- TOC entry 15 (class 3079 OID 16764)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 4124 (class 0 OID 0)
-- Dependencies: 15
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 21 (class 3079 OID 16430)
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- TOC entry 4125 (class 0 OID 0)
-- Dependencies: 21
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


--
-- TOC entry 963 (class 1255 OID 1184889)
-- Name: buyitemsfrombasket(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.buyitemsfrombasket(cid bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
Declare
    element jsonb;
	oid bigint;
    r record;
	b jsonb;
	q int;
BEGIN
  SELECT "basket" into b FROM public."Customer" where "customerId" = cid;
  
  for r in (select jsonb_array_elements(b) element)
  loop 
  	select "quantity" into q from public."Product" where "productId" = (r.element->>'id')::bigint;
  	if q < (r.element->>'quantity')::bigint
	then
		raise EXCEPTION 'not enough products in store prodId % req_quan % quan %', (r.element->>'id')::bigint, (r.element->>'quantity')::bigint, q;
  	end if;
  end loop;
  
  insert into public."Order" ("customerId", "orderDate", "state")
  values(cid, now(), false) returning "orderId" into oid;
  
    for r in (select jsonb_array_elements(b) element)
    loop
		insert into public."OrderDetails" ("orderId", "productId", "quantity")
		values (oid, (r.element->>'id')::bigint, (r.element->>'quantity')::bigint);
		update public."Product" set "quantity" = "quantity" - (r.element->>'quantity')::bigint where "productId" = (r.element->>'id')::bigint;
    end loop;
	call public.clearBasket(cid);
END;
$$;


--
-- TOC entry 954 (class 1255 OID 935492)
-- Name: clearbasket(bigint); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.clearbasket(cid bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
	update public."Customer" set "basket" = '[]'::jsonb where "customerId" = cid;
END;
$$;


--
-- TOC entry 957 (class 1255 OID 935494)
-- Name: clearobserved(bigint); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.clearobserved(cid bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
	update public."Customer" set "observed" = '[]'::jsonb where "customerId" = cid;
END;
$$;


--
-- TOC entry 959 (class 1255 OID 1001309)
-- Name: customerhistory(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.customerhistory(cid bigint) RETURNS TABLE(name character varying, price bigint, quantity bigint, orderdate date)
    LANGUAGE plpgsql
    AS $$
begin
return query select pr."name", pr."price", od."quantity", o."orderDate"
	from public."Order" o
	inner join public."OrderDetails" od on o."orderId" = od."orderId" 
	inner join public."Product" pr on od."productId" = pr."productId"
	where "customerId" = cid;		

end;
$$;


--
-- TOC entry 955 (class 1255 OID 976740)
-- Name: customerhistorydetails(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.customerhistorydetails(oid bigint) RETURNS TABLE(orderid bigint, productid bigint, quantity bigint)
    LANGUAGE plpgsql
    AS $$
begin
return query select * from public."OrderDetails" where "orderId"=oid;		

end;
$$;


--
-- TOC entry 962 (class 1255 OID 1183898)
-- Name: getUserBasketProducts(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public."getUserBasketProducts"(cid bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
Declare
	element jsonb;
	r record;
	b jsonb;
	res jsonb;
begin

SELECT "basket" into b FROM public."Customer" where "customerId" = cid;

res := '[]'::jsonb;

-- res := res || '{"a" : 1}'::jsonb;

for r in (select jsonb_array_elements(b) element)
loop
-- 	res := res || '{"a" : 1}'::jsonb;
	res := res || (select to_jsonb(row_to_json(row))
		from (
			select "productId", "name", "price", (r.element->>'quantity')::bigint as "quantity"
			from public."Product"
			where "productId" = (r.element->>'id')::bigint
		) row)::jsonb;
end loop;

RETURN res;

end;
$$;


--
-- TOC entry 961 (class 1255 OID 1183991)
-- Name: getUserObservedProducts(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public."getUserObservedProducts"(cid bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
Declare
	element jsonb;
	r record;
	b jsonb;
	res jsonb;
begin

SELECT "observed" into b FROM public."Customer" where "customerId" = cid;

res := '[]'::jsonb;

-- res := res || '{"a" : 1}'::jsonb;

for r in (select jsonb_array_elements(b) element)
loop
-- 	res := res || '{"a" : 1}'::jsonb;
	res := res || (select to_jsonb(row_to_json(row))
		from (
			select "productId", "name", "price", "quantity"
			from public."Product"
			where "productId" = (r.element->>'id')::bigint
		) row)::jsonb;
end loop;

RETURN res;

end;
$$;


--
-- TOC entry 953 (class 1255 OID 1250626)
-- Name: insertcategory(text); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.insertcategory(categoryname text)
    LANGUAGE plpgsql
    AS $$
BEGIN
	insert into public."Category" ("name")
	select categoryName
	where not exists (select 1 from public."Category" where "name"=categoryName);
END;
$$;


--
-- TOC entry 952 (class 1255 OID 917212)
-- Name: insertintotest(text); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.insertintotest(name text)
    LANGUAGE sql
    AS $$
        INSERT INTO test ("name") VALUES (name);
        $$;


--
-- TOC entry 960 (class 1255 OID 1250926)
-- Name: insertproduct(bigint, character varying, bigint, bigint, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.insertproduct(categoryid bigint, productname character varying, price bigint, quantity bigint, thumbnails character varying, description character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	insert into public."Product" ("categoryID", "name", "price", "quantity", "thumbnails", "description")
	values (categoryId, productName, price, quantity, thumbnails, description);
END;
$$;


--
-- TOC entry 956 (class 1255 OID 983857)
-- Name: mmidecode(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.mmidecode(todecode bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
	modulo 	CONSTANT INT8 = 2117404477;
	decoder CONSTANT INT8 = 102421293;
BEGIN
	RETURN (toDecode * decoder) % modulo;
END
$$;


--
-- TOC entry 958 (class 1255 OID 983855)
-- Name: mmiencode(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.mmiencode(toencode bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
	modulo 	CONSTANT INT8 = 2117404477;
	encoder CONSTANT INT8 = 5852724;
BEGIN
	RETURN (toEncode * encoder) % modulo;
END
$$;


SET default_tablespace = '';

--
-- TOC entry 224 (class 1259 OID 917306)
-- Name: Category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Category" (
    "categoryId" bigint NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 917304)
-- Name: Category_categoryId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."Category" ALTER COLUMN "categoryId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Category_categoryId_seq"
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 931637)
-- Name: Customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Customer" (
    adress character varying,
    "birthDate" date,
    "cardNumber" bigint,
    "customerId" bigint NOT NULL,
    "customerPassword" character varying NOT NULL,
    "fullName" character varying,
    mail character varying,
    username character varying NOT NULL,
    basket jsonb NOT NULL,
    observed jsonb NOT NULL,
    "isEmployee" boolean
);


--
-- TOC entry 230 (class 1259 OID 931753)
-- Name: Customer_customerId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."Customer" ALTER COLUMN "customerId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Customer_customerId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 917335)
-- Name: Order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Order" (
    "orderId" bigint NOT NULL,
    "customerId" bigint,
    "orderDate" date,
    state boolean
);


--
-- TOC entry 228 (class 1259 OID 917346)
-- Name: OrderDetails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."OrderDetails" (
    "orderId" bigint,
    "productId" bigint,
    quantity bigint
);


--
-- TOC entry 231 (class 1259 OID 935121)
-- Name: Order_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."Order" ALTER COLUMN "orderId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Order_orderId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 917320)
-- Name: Product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Product" (
    "productId" bigint NOT NULL,
    "categoryID" bigint,
    name character varying NOT NULL,
    price bigint,
    quantity bigint,
    photos jsonb,
    thumbnails character varying,
    description character varying
);


--
-- TOC entry 225 (class 1259 OID 917318)
-- Name: Product_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."Product" ALTER COLUMN "productId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Product_productId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 917146)
-- Name: test; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test (
    id bigint NOT NULL,
    name text
);


--
-- TOC entry 232 (class 1259 OID 1210025)
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.test ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.test_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4089 (class 0 OID 917306)
-- Dependencies: 224
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (1, 'name');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (4, 'laptopy');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (5, 'telewizory');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (6, 'smartfony');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (7, 'pralki');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (8, 'Suszarki');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (9, 'Odkurzacze');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (10, 'Gry');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (11, 'tablety');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (12, 'test');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (13, 'Konsole');
INSERT INTO public."Category" OVERRIDING SYSTEM VALUE VALUES (14, 'zmywarki');


--
-- TOC entry 4094 (class 0 OID 931637)
-- Dependencies: 229
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Customer" OVERRIDING SYSTEM VALUE VALUES (NULL, '2021-06-15', NULL, 9, '4297f44b13955235245b2497399d7a93', 'Pokaz Baza', 'pokaz@gmail.com', 'Pokaz_Baza_xxx', '[]', '[]', false);
INSERT INTO public."Customer" OVERRIDING SYSTEM VALUE VALUES ('adress', '2001-09-28', 123, 2, 'password', 'name', 'mail', 'username', '[{"id": "2", "quantity": 14}, {"id": "12", "quantity": 4}, {"id": "7", "quantity": 3}, {"id": "3", "quantity": 1}, {"id": "20", "quantity": 1}]', '[{"id": "12"}, {"id": "2"}, {"id": "1"}, {"id": "20"}, {"id": "3"}, {"id": "7"}]', NULL);
INSERT INTO public."Customer" OVERRIDING SYSTEM VALUE VALUES (NULL, '2021-06-07', NULL, 8, '9e38e8d688743e0d07d669a1fcbcd35b', 'Tester Testowy', 'tester1@test.pl', 'Testerrr', '[]', '[]', false);
INSERT INTO public."Customer" OVERRIDING SYSTEM VALUE VALUES (NULL, '2021-04-26', NULL, 5, '9e38e8d688743e0d07d669a1fcbcd35b', 'Test Test', 'test@test.pl', 'tester123', '[]', '[{"id": "12"}, {"id": "23"}]', true);
INSERT INTO public."Customer" OVERRIDING SYSTEM VALUE VALUES (NULL, '2021-06-17', NULL, 6, '698d51a19d8a121ce581499d7b701668', '214124', 'test@gmail.com', '1111', '[]', '[]', false);
INSERT INTO public."Customer" OVERRIDING SYSTEM VALUE VALUES ('adress', '2001-09-28', 123, 3, 'password', 'name', 'mail', 'username', '[]', '[]', NULL);
INSERT INTO public."Customer" OVERRIDING SYSTEM VALUE VALUES ('adress', '2001-09-28', 123, 1, 'password', 'name', 'mail', 'username', '[{"id": "20", "quantity": 1}]', '[{"id": "1"}]', NULL);
INSERT INTO public."Customer" OVERRIDING SYSTEM VALUE VALUES (NULL, '2008-06-19', NULL, 7, '207023ccb44feb4d7dadca005ce29a64', 'Jan Kowalski', 'kowalski@gmail.com', 'kowal', '[]', '[]', false);


--
-- TOC entry 4092 (class 0 OID 917335)
-- Dependencies: 227
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (18, 1, '2021-05-18', false);
INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (19, 1, '2021-05-24', false);
INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (20, 1, '2021-05-26', false);
INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (22, 1, '2021-05-31', false);
INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (23, 1, '2021-05-31', false);
INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (24, 2, '2021-05-31', false);
INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (25, 5, '2021-06-07', false);
INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (26, 5, '2021-06-07', false);
INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (27, 5, '2021-06-08', false);
INSERT INTO public."Order" OVERRIDING SYSTEM VALUE VALUES (28, 5, '2021-06-08', false);


--
-- TOC entry 4093 (class 0 OID 917346)
-- Dependencies: 228
-- Data for Name: OrderDetails; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."OrderDetails" VALUES (18, 2, 2);
INSERT INTO public."OrderDetails" VALUES (18, 3, 1);
INSERT INTO public."OrderDetails" VALUES (19, 1, 1);
INSERT INTO public."OrderDetails" VALUES (19, 2, 1);
INSERT INTO public."OrderDetails" VALUES (22, 10, 1);
INSERT INTO public."OrderDetails" VALUES (22, 7, 1);
INSERT INTO public."OrderDetails" VALUES (23, 3, 3);
INSERT INTO public."OrderDetails" VALUES (23, 1, 1);
INSERT INTO public."OrderDetails" VALUES (23, 10, 1);
INSERT INTO public."OrderDetails" VALUES (24, 2, 1);
INSERT INTO public."OrderDetails" VALUES (24, 4, 2);
INSERT INTO public."OrderDetails" VALUES (24, 7, 1);
INSERT INTO public."OrderDetails" VALUES (25, 23, 1);
INSERT INTO public."OrderDetails" VALUES (26, 12, 1);
INSERT INTO public."OrderDetails" VALUES (26, 23, 1);
INSERT INTO public."OrderDetails" VALUES (27, 23, 1);
INSERT INTO public."OrderDetails" VALUES (27, 12, 1);
INSERT INTO public."OrderDetails" VALUES (27, 10, 4);
INSERT INTO public."OrderDetails" VALUES (28, 12, 1);
INSERT INTO public."OrderDetails" VALUES (28, 23, 1);


--
-- TOC entry 4091 (class 0 OID 917320)
-- Dependencies: 226
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (25, 7, 'Pralka Bosch WAJ2006SPL', 1399, 63, NULL, 'https://i.postimg.cc/Y9FxWyYP/bosh.jpg', 'Klasa energetyczna: D, Ładowanie: Od frontu, Klasa wirowania: C, Prędkość: 1000 obr./min., Ładowność: 7 kg, Szerokość: 59,8 cm, Głębokość: 54,6 cm, Wysokość: 84,8 cm, Pojemność bębna: 7 l, Funkcje: Program szybki, Opóźnienie startu pracy, Wyświetlacz');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (18, 5, 'Telewizor samsung a', 3999, 10, NULL, 'https://i.postimg.cc/BQ3kg2hy/telewizor.jpg', 'Telewizor Samsung Przekątna: 55 cali, Matryca: LED, Odświeżanie: 50 Hz, Wi-Fi, Tuner: DVB-C, DVB-T2, DVB-S2, Rodzaj ekranu: Prosty, Dostępne łącza bezprzewodowe: Bluetooth, Wi-Fi, DLNA, LAN, AirPlay');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (10, 5, 'Telewizor LG 42LN5400', 1499, 61, NULL, 'https://i.postimg.cc/L6YzWWn0/telewizor.jpg', 'Telewizor LG Przekątna: 42 cale, Matryca: LED, Odświeżanie: 100 Hz, Nie posiada, Tuner: DVB-C, DVB-T, Rodzaj ekranu: Prosty, Dostępne łącza bezprzewodowe: Brak');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (12, 4, 'Laptop lenovo214111', 3999, 5, NULL, 'https://i.postimg.cc/ZKfmqmDM/laptop.jpg', 'Opis..');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (23, 4, 'Laptop HP 250 G6 15,6"/i5/4GB/128GB/Win10 (1WZ01EA)', 2899, 35, NULL, 'https://i.postimg.cc/MpcqVy3B/laptop.jpg', 'Notebooki 15,6 cala, laptop z procesorem Intel Core i5 , 4GB RAM SSD, grafika HD Graphics 620. System operacyjny: Windows 10');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (27, 8, 'cos', 123, NULL, NULL, NULL, 'cos');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (29, 7, 'Test', 123, 10, NULL, NULL, 'Test opis');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (28, 7, 'asd', 444, NULL, NULL, NULL, 'opisnowy');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (2, 5, 'Telewizor Samsung', 1999, 11, NULL, 'https://i.postimg.cc/BQ3kg2hy/telewizor.jpg', 'Telewizor Samsung Przekątna: 50 cali, Matryca: LED, Wi-Fi, Tuner: DVB-C, DVB-T2, DVB-S2, Rodzaj ekranu: Prosty, Dostępne łącza bezprzewodowe: Bluetooth, Wi-Fi, DLNA');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (1, 13, 'Playstation 5', 2999, 8, NULL, 'https://i.postimg.cc/kX5Fq4DG/playstation.jpg', 'Konsole do gier Sony PlayStation 5 825GB, Rodzaj: Stacjonarne, Wersja: Podstawowa');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (7, 13, 'Xbox series X', 2499, 10, NULL, 'https://i.postimg.cc/gJnX1wgb/xbox.jpg', 'Konsole do gier Microsoft Xbox Series S 512GB, Rodzaj: Stacjonarne, Wersja: Zestaw producenta');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (22, 7, 'Pralka Electrolux EW6F329SP PerfectCare', 1999, 29, NULL, 'https://i.postimg.cc/Pr4XzXMW/pralka.jpg', 'Klasa energetyczna: D, Ładowanie: Od frontu, Klasa wirowania: B, Prędkość: 1200 obr./min., Ładowność: 9 kg, Szerokość: 60 cm, Głębokość: 66 cm, Wysokość: 85 cm, Pojemność bębna: 68 l, Funkcje: Program szybki, Opóźnienie startu pracy, Zwalczanie alergenów STEAM, Odświeżanie parowe, Czas do końca prania, Sensor załadunku bębna, Blokada rodzicielska, Zabezpieczenie przed zalaniem, Wyświetlacz');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (20, 14, 'Bosch Serie4 SMS46LI04E', 1599, 12, NULL, 'https://i.postimg.cc/1zYcg1TP/zmywarka.jpg', 'Zmywarka klasy energetycznej E, pojemność 13 kompletów, sterowanie Elektroniczne, poziom hałasu 46 dB, wysokość 84,5 cm ., funkcje: Dodatkowe suszenie, Blokada przycisków');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (3, 9, 'Electrolux PowerForce EPF62IS', 449, 45, NULL, 'https://i.postimg.cc/Gmtjbp7z/odkrzurzacz.jpg', 'Odkurzacz tradycyjny, moc: 700 W, pojemność: 3,5 l. Filtr: Zmywalny Hygiene 12. Głośność: od 76 do 80 dB. Roczne zużycie energii: do 30 kWh');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (4, 6, 'Samsung Galaxy S21 5G SM-G991 8/128GB Szary', 3299, 20, '{}', 'https://i.postimg.cc/SN2sqFLC/telefon.jpg', 'Smartfon Samsung z ekranem 6,2 cala, wyświetlacz Dynamic AMOLED 2X. Aparat 12 Mpix, pamięć 8 GB RAM, bateria 4000mAh. Obsługuje sieć: 5G');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (19, 6, 'iPhone 12', 3799, 12, NULL, 'https://i.postimg.cc/gcq9ZMYQ/iphone.jpg', 'Smartfon Apple z ekranem 6,1 cala, wyświetlacz OLED. Aparat 12 Mpix, pamięć 4 GB RAM, bateria 2815mAh. Obsługuje sieć: 5G');
INSERT INTO public."Product" OVERRIDING SYSTEM VALUE VALUES (24, 14, 'Electrolux ESF63020X', 1099, 14, NULL, 'https://i.postimg.cc/7Y0pkmRm/zmywarka.jpg', 'Pojemność 12 kompletów, poziom hałasu 49 dB, funkcje: Opóźniony start');


--
-- TOC entry 4087 (class 0 OID 917146)
-- Dependencies: 222
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (1, 'tester');
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (2, 'test');
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (3, 'test2');
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (4, 'test2');
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (5, 'test3');
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (6, 'test3');


--
-- TOC entry 4126 (class 0 OID 0)
-- Dependencies: 223
-- Name: Category_categoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Category_categoryId_seq"', 14, true);


--
-- TOC entry 4127 (class 0 OID 0)
-- Dependencies: 230
-- Name: Customer_customerId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Customer_customerId_seq"', 9, true);


--
-- TOC entry 4128 (class 0 OID 0)
-- Dependencies: 231
-- Name: Order_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Order_orderId_seq"', 28, true);


--
-- TOC entry 4129 (class 0 OID 0)
-- Dependencies: 225
-- Name: Product_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Product_productId_seq"', 29, true);


--
-- TOC entry 4130 (class 0 OID 0)
-- Dependencies: 232
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.test_id_seq', 6, true);


--
-- TOC entry 3954 (class 2606 OID 917313)
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY ("categoryId");


--
-- TOC entry 3960 (class 2606 OID 931644)
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY ("customerId");


--
-- TOC entry 3958 (class 2606 OID 917339)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("orderId");


--
-- TOC entry 3956 (class 2606 OID 917327)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("productId");


--
-- TOC entry 3952 (class 2606 OID 917153)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- TOC entry 3961 (class 2606 OID 917328)
-- Name: Product categoryId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "categoryId" FOREIGN KEY ("categoryID") REFERENCES public."Category"("categoryId");


--
-- TOC entry 3962 (class 2606 OID 931653)
-- Name: Order customerId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "customerId" FOREIGN KEY ("customerId") REFERENCES public."Customer"("customerId") NOT VALID;


--
-- TOC entry 3964 (class 2606 OID 917354)
-- Name: OrderDetails orderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderDetails"
    ADD CONSTRAINT "orderId" FOREIGN KEY ("orderId") REFERENCES public."Order"("orderId");


--
-- TOC entry 3963 (class 2606 OID 917349)
-- Name: OrderDetails productId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderDetails"
    ADD CONSTRAINT "productId" FOREIGN KEY ("productId") REFERENCES public."Product"("productId");


--
-- TOC entry 4104 (class 0 OID 0)
-- Dependencies: 4103
-- Name: DATABASE oeqenakg; Type: ACL; Schema: -; Owner: -
--

REVOKE CONNECT,TEMPORARY ON DATABASE oeqenakg FROM PUBLIC;


-- Completed on 2021-06-08 22:28:40

--
-- PostgreSQL database dump complete
--

