-- Script generated by Redgate Compare v1.7.1.7638

SET check_function_bodies = false;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.city.city_country_id_fkey...';END$$;
ALTER TABLE public.city ADD CONSTRAINT city_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country (country_id) ON UPDATE CASCADE ON DELETE RESTRICT;
SET check_function_bodies = true;