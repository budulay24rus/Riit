PGDMP  )                     |            EduTask    15.7    16.0 &    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    16397    EduTask    DATABASE     }   CREATE DATABASE "EduTask" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "EduTask";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            )           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16428    cities    TABLE     l   CREATE TABLE public.cities (
    city_id integer NOT NULL,
    city_name character varying(100) NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false    4            �            1259    16406 	   education    TABLE     y   CREATE TABLE public.education (
    education_id integer NOT NULL,
    education_level character varying(50) NOT NULL
);
    DROP TABLE public.education;
       public         heap    postgres    false    4            �            1259    16434    user_cities    TABLE     `   CREATE TABLE public.user_cities (
    user_id integer NOT NULL,
    city_id integer NOT NULL
);
    DROP TABLE public.user_cities;
       public         heap    postgres    false    4            �            1259    16412    user_education    TABLE     h   CREATE TABLE public.user_education (
    user_id integer NOT NULL,
    education_id integer NOT NULL
);
 "   DROP TABLE public.user_education;
       public         heap    postgres    false    4            �            1259    16399    users    TABLE     k   CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(100) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    16454 
   Users_list    VIEW     b  CREATE VIEW public."Users_list" AS
 SELECT u.user_id,
    u.user_name,
    uc_f.city_name,
    e.education_id,
    e.education_level
   FROM (((public.users u
     LEFT JOIN public.user_education ON ((user_education.user_id = u.user_id)))
     LEFT JOIN public.education e ON ((e.education_id = user_education.education_id)))
     LEFT JOIN ( SELECT uc.user_id,
            string_agg((c.city_name)::text, ', '::text) AS city_name
           FROM (public.user_cities uc
             LEFT JOIN public.cities c ON ((c.city_id = uc.city_id)))
          GROUP BY uc.user_id) uc_f ON ((uc_f.user_id = u.user_id)));
    DROP VIEW public."Users_list";
       public          postgres    false    217    215    217    215    218    218    220    220    221    221    4            �            1259    16427    cities_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cities_city_id_seq;
       public          postgres    false    4    220            *           0    0    cities_city_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;
          public          postgres    false    219            �            1259    16405    education_education_id_seq    SEQUENCE     �   CREATE SEQUENCE public.education_education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.education_education_id_seq;
       public          postgres    false    4    217            +           0    0    education_education_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.education_education_id_seq OWNED BY public.education.education_id;
          public          postgres    false    216            �            1259    16398    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    4    215            ,           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    214            }           2604    16431    cities city_id    DEFAULT     p   ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);
 =   ALTER TABLE public.cities ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    219    220    220            |           2604    16409    education education_id    DEFAULT     �   ALTER TABLE ONLY public.education ALTER COLUMN education_id SET DEFAULT nextval('public.education_education_id_seq'::regclass);
 E   ALTER TABLE public.education ALTER COLUMN education_id DROP DEFAULT;
       public          postgres    false    216    217    217            {           2604    16402    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    214    215    215            !          0    16428    cities 
   TABLE DATA                 public          postgres    false    220   r*                 0    16406 	   education 
   TABLE DATA                 public          postgres    false    217   �+       "          0    16434    user_cities 
   TABLE DATA                 public          postgres    false    221   ;,                 0    16412    user_education 
   TABLE DATA                 public          postgres    false    218   �-                 0    16399    users 
   TABLE DATA                 public          postgres    false    215   d.       -           0    0    cities_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cities_city_id_seq', 50, true);
          public          postgres    false    219            .           0    0    education_education_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.education_education_id_seq', 5, true);
          public          postgres    false    216            /           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 50, true);
          public          postgres    false    214            �           2606    16433    cities cities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    220            �           2606    16411    education education_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (education_id);
 B   ALTER TABLE ONLY public.education DROP CONSTRAINT education_pkey;
       public            postgres    false    217            �           2606    16438    user_cities user_cities_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.user_cities
    ADD CONSTRAINT user_cities_pkey PRIMARY KEY (user_id, city_id);
 F   ALTER TABLE ONLY public.user_cities DROP CONSTRAINT user_cities_pkey;
       public            postgres    false    221    221            �           2606    16416 "   user_education user_education_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.user_education
    ADD CONSTRAINT user_education_pkey PRIMARY KEY (user_id, education_id);
 L   ALTER TABLE ONLY public.user_education DROP CONSTRAINT user_education_pkey;
       public            postgres    false    218    218                       2606    16404    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    16444 $   user_cities user_cities_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_cities
    ADD CONSTRAINT user_cities_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);
 N   ALTER TABLE ONLY public.user_cities DROP CONSTRAINT user_cities_city_id_fkey;
       public          postgres    false    220    3205    221            �           2606    16439 $   user_cities user_cities_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_cities
    ADD CONSTRAINT user_cities_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 N   ALTER TABLE ONLY public.user_cities DROP CONSTRAINT user_cities_user_id_fkey;
       public          postgres    false    3199    215    221            �           2606    16422 /   user_education user_education_education_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_education
    ADD CONSTRAINT user_education_education_id_fkey FOREIGN KEY (education_id) REFERENCES public.education(education_id);
 Y   ALTER TABLE ONLY public.user_education DROP CONSTRAINT user_education_education_id_fkey;
       public          postgres    false    3201    218    217            �           2606    16417 *   user_education user_education_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_education
    ADD CONSTRAINT user_education_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 T   ALTER TABLE ONLY public.user_education DROP CONSTRAINT user_education_user_id_fkey;
       public          postgres    false    215    3199    218            !   *  x��սJa��~�b�(�df��T")$��^��b�B0)�{A���o�N�03��9�����]�?���y�L����������]�x�.?���u�y�<Y^-/���b���嫖�X�n��囖oX�m��屴�̰P6L�6�P7��7P8L�8�P9��9P:-�P:-�t��%��i��i��i��i��i��i��i��e��e��e��z>�P�,]P�,]P�,]P�,]P�,]P�,]PZ�����eiAiYZ�7��J�҂Ҳ���,-(-KJ�҂҃��?��]���            x���v
Q���W((M��L�KM)MN,���Ss�	uV�0�QP��L�PN����Q״��$F�P�cqq~rfbI��KjzQj*њ�����3Rs�I�l��X\�J�VS�V����"TGsq A�]W      "   8  x��ֻJQ��~�b�
ɾL.XY��&�
�b���_����}���t8�_O6N/�}���������<�Η��?=��v����q���h�u6����U=6��u�u�i�鯷Ͷ���ٮ���xV�_8��ԁ��ԁ�Ձ��Ձ�ց��ց�ׁ��ׁo�7�o�7�{],���������������M�&�M�&�M�&���/��|��|��|��|��|��|��|��|��|��|�����ߒoߒoߒoߒoߒo�Q�#��h�G��Q�}4�/�a���E         �   x���=
�PE�>��R�!�O4be�" L��)��f�n���s烙�n�}+U���9^nC7����_���w9n�����%��:��xG�H(�'�Q`�DQ`IK�h�����b;�x���)�S�n���67ln�ܰ�as����6wl���������;6wl��ܱy`���̓?fl�<�y`����s���P�oSY�/���         '  x��սJCQE��>�� ��37?XY�� L�()1��9���vX���L����ئ��}]�>?�ﯗ����>>�v�vwmq�����a����k�:{���^��^��^�z��u�ר��z��m�����y���9�g4�h�4�i5�j�5�k6�l�6�m7�n�7���+�+�
�뼰�W��}�|e_1_�W�W��}�|e_1ߴo2ߴo2ߴo<�d��M��M��M��M��M��M�[�-�[�-�[�-�[�-�s��|˾�|˾�|˾�|˾�|˾�|G������f�q     