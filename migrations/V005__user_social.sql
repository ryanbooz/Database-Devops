-- Script generated by Redgate Compare v1.7.1.7682

SET check_function_bodies = false;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.user_social...';END$$;
CREATE TABLE public.user_social (
    user_id integer NOT NULL,
    twitter_handle text,
    facebook_handle text,
    mastodon text
);
SET check_function_bodies = true;
