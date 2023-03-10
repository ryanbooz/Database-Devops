-- Script generated by Redgate Compare v1.7.1.7638

SET check_function_bodies = false;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.store...';END$$;
CREATE TABLE public.store (
    store_id integer NOT NULL,
    manager_staff_id integer NOT NULL,
    address_id integer NOT NULL,
    last_update timestamp with time zone NOT NULL DEFAULT now()
);
ALTER TABLE public.store ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.staff...';END$$;
CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    address_id integer NOT NULL,
    email text,
    store_id integer NOT NULL,
    active boolean NOT NULL DEFAULT true,
    username text NOT NULL,
    password text,
    last_update timestamp with time zone NOT NULL DEFAULT now(),
    picture bytea
);
ALTER TABLE public.staff ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.rental...';END$$;
CREATE TABLE public.rental (
    rental_id bigint NOT NULL,
    rental_date timestamp with time zone NOT NULL,
    inventory_id integer NOT NULL,
    customer_id integer NOT NULL,
    return_date timestamp with time zone,
    staff_id integer NOT NULL,
    last_update timestamp with time zone NOT NULL DEFAULT now()
);
ALTER TABLE public.rental ADD CONSTRAINT rental_pkey PRIMARY KEY (rental_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.payment...';END$$;
CREATE TABLE public.payment (
    payment_id bigint NOT NULL,
    customer_id integer NOT NULL,
    staff_id integer NOT NULL,
    rental_id integer NOT NULL,
    amount numeric(5,2) NOT NULL,
    payment_date timestamp with time zone NOT NULL
);
ALTER TABLE public.payment ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.language...';END$$;
CREATE TABLE public.language (
    language_id integer NOT NULL,
    name character(20) NOT NULL,
    last_update timestamp with time zone NOT NULL DEFAULT now()
);
ALTER TABLE public.language ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.inventory...';END$$;
CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    film_id integer NOT NULL,
    store_id integer NOT NULL,
    last_update timestamp with time zone NOT NULL DEFAULT now()
);
ALTER TABLE public.inventory ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.film_category...';END$$;
CREATE TABLE public.film_category (
    film_id integer NOT NULL,
    category_id integer NOT NULL,
    last_update timestamp(2) with time zone NOT NULL DEFAULT now()
);
ALTER TABLE public.film_category ADD CONSTRAINT film_category_pkey PRIMARY KEY (film_id, category_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.film_actor...';END$$;
CREATE TABLE public.film_actor (
    actor_id integer NOT NULL,
    film_id integer NOT NULL,
    last_update timestamp(2) with time zone NOT NULL DEFAULT now()
);
ALTER TABLE public.film_actor ADD CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id, film_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.customer...';END$$;
CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    store_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text,
    address_id integer NOT NULL,
    activebool boolean NOT NULL DEFAULT true,
    create_date date NOT NULL DEFAULT CURRENT_DATE,
    last_update timestamp(2) with time zone DEFAULT now(),
    active integer
);
ALTER TABLE public.customer ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.country...';END$$;
CREATE TABLE public.country (
    country_id integer NOT NULL,
    country text NOT NULL,
    last_update timestamp with time zone NOT NULL DEFAULT now()
);
ALTER TABLE public.country ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.city...';END$$;
CREATE TABLE public.city (
    city_id integer NOT NULL,
    city text NOT NULL,
    country_id integer NOT NULL,
    last_update timestamp(2) with time zone NOT NULL DEFAULT now()
);
ALTER TABLE public.city ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.category...';END$$;
CREATE TABLE public.category (
    category_id integer NOT NULL,
    name text NOT NULL,
    last_update timestamp(2) with time zone DEFAULT now()
);
ALTER TABLE public.category ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.address...';END$$;
CREATE TABLE public.address (
    address_id integer NOT NULL,
    address text NOT NULL,
    address2 text,
    district text NOT NULL,
    city_id integer NOT NULL,
    postal_code text,
    phone text NOT NULL,
    last_update timestamp(2) with time zone NOT NULL DEFAULT now()
);
ALTER TABLE public.address ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.customer.customer_address_id_fkey...';END$$;
ALTER TABLE public.customer ADD CONSTRAINT customer_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address (address_id) ON UPDATE CASCADE ON DELETE RESTRICT;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.actor...';END$$;
CREATE TABLE public.actor (
    actor_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    last_update timestamp(2) with time zone DEFAULT now()
);
ALTER TABLE public.actor ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.store_store_id_seq...';END$$;
CREATE SEQUENCE public.store_store_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.store.store_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.staff_staff_id_seq...';END$$;
CREATE SEQUENCE public.staff_staff_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.staff.staff_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.rental_rental_id_seq...';END$$;
CREATE SEQUENCE public.rental_rental_id_seq
AS bigint
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1
NO CYCLE
OWNED BY public.rental.rental_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.payment_payment_id_seq...';END$$;
CREATE SEQUENCE public.payment_payment_id_seq
AS bigint
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1
NO CYCLE
OWNED BY public.payment.payment_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.language_language_id_seq...';END$$;
CREATE SEQUENCE public.language_language_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.language.language_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.inventory_inventory_id_seq...';END$$;
CREATE SEQUENCE public.inventory_inventory_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.inventory.inventory_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.customer_customer_id_seq...';END$$;
CREATE SEQUENCE public.customer_customer_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.customer.customer_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.country_country_id_seq...';END$$;
CREATE SEQUENCE public.country_country_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.country.country_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.city_city_id_seq...';END$$;
CREATE SEQUENCE public.city_city_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.city.city_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.category_category_id_seq...';END$$;
CREATE SEQUENCE public.category_category_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.category.category_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.address_address_id_seq...';END$$;
CREATE SEQUENCE public.address_address_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.address.address_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.actor_actor_id_seq...';END$$;
CREATE SEQUENCE public.actor_actor_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.actor.actor_id;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.mpaa_rating...';END$$;
CREATE TYPE public.mpaa_rating AS ENUM ('G', 'PG', 'PG-13', 'R', 'NC-17');


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.year...';END$$;
CREATE DOMAIN public.year AS integer;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.film...';END$$;
CREATE TABLE public.film (
    film_id integer NOT NULL,
    title text NOT NULL,
    description text,
    release_year public.year,
    language_id integer NOT NULL,
    original_language_id integer,
    rental_duration smallint NOT NULL DEFAULT 3,
    rental_rate numeric(4,2) NOT NULL DEFAULT 4.99,
    length smallint,
    replacement_cost numeric(5,2) NOT NULL DEFAULT 19.99,
    rating public.mpaa_rating DEFAULT 'G'::public.mpaa_rating,
    last_update timestamp(2) with time zone DEFAULT now(),
    special_features text[],
    fulltext tsvector NOT NULL
);
ALTER TABLE public.film ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.film.film_original_language_id_fkey...';END$$;
ALTER TABLE public.film ADD CONSTRAINT film_original_language_id_fkey FOREIGN KEY (original_language_id) REFERENCES public.language (language_id) ON UPDATE CASCADE ON DELETE RESTRICT;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.film.film_language_id_fkey...';END$$;
ALTER TABLE public.film ADD CONSTRAINT film_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language (language_id) ON UPDATE CASCADE ON DELETE RESTRICT;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.film_film_id_seq...';END$$;
CREATE SEQUENCE public.film_film_id_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.film.film_id;
SET check_function_bodies = true;
