PGDMP     (                    {            relationalDatabase    15.2    15.2     "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    16398    relationalDatabase    DATABASE     ?   CREATE DATABASE "relationalDatabase" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';
 $   DROP DATABASE "relationalDatabase";
                postgres    false            ?            1259    16418    aircraft    TABLE     ?   CREATE TABLE public.aircraft (
    id bigint NOT NULL,
    type text NOT NULL,
    airline_name text NOT NULL,
    number_of_passengers numeric NOT NULL
);
    DROP TABLE public.aircraft;
       public         heap    postgres    false            ?            1259    16473    aircraft_airport    TABLE     j   CREATE TABLE public.aircraft_airport (
    aircraft_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
 $   DROP TABLE public.aircraft_airport;
       public         heap    postgres    false            ?            1259    16411    airport    TABLE     h   CREATE TABLE public.airport (
    id bigint NOT NULL,
    name text NOT NULL,
    code text NOT NULL
);
    DROP TABLE public.airport;
       public         heap    postgres    false            ?            1259    16425    city    TABLE     ?   CREATE TABLE public.city (
    id bigint NOT NULL,
    name text NOT NULL,
    state text NOT NULL,
    population numeric NOT NULL
);
    DROP TABLE public.city;
       public         heap    postgres    false            ?            1259    16442    city_airport    TABLE     b   CREATE TABLE public.city_airport (
    city_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
     DROP TABLE public.city_airport;
       public         heap    postgres    false            ?            1259    16404 	   passenger    TABLE     ?   CREATE TABLE public.passenger (
    id bigint NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    phone_num numeric NOT NULL,
    city_id bigint
);
    DROP TABLE public.passenger;
       public         heap    postgres    false            ?            1259    16455    passenger_aircraft    TABLE     n   CREATE TABLE public.passenger_aircraft (
    passenger_id bigint NOT NULL,
    aircraft_id bigint NOT NULL
);
 &   DROP TABLE public.passenger_aircraft;
       public         heap    postgres    false                      0    16418    aircraft 
   TABLE DATA           P   COPY public.aircraft (id, type, airline_name, number_of_passengers) FROM stdin;
    public          postgres    false    216   +                  0    16473    aircraft_airport 
   TABLE DATA           C   COPY public.aircraft_airport (aircraft_id, airport_id) FROM stdin;
    public          postgres    false    220   !                 0    16411    airport 
   TABLE DATA           1   COPY public.airport (id, name, code) FROM stdin;
    public          postgres    false    215   ?!                 0    16425    city 
   TABLE DATA           ;   COPY public.city (id, name, state, population) FROM stdin;
    public          postgres    false    217   ?"                 0    16442    city_airport 
   TABLE DATA           ;   COPY public.city_airport (city_id, airport_id) FROM stdin;
    public          postgres    false    218   T#                 0    16404 	   passenger 
   TABLE DATA           R   COPY public.passenger (id, first_name, last_name, phone_num, city_id) FROM stdin;
    public          postgres    false    214   ?#                 0    16455    passenger_aircraft 
   TABLE DATA           G   COPY public.passenger_aircraft (passenger_id, aircraft_id) FROM stdin;
    public          postgres    false    219   &       ?           2606    16424    aircraft aircraft_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT aircraft_pkey;
       public            postgres    false    216                       2606    16417    airport airports_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.airport
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.airport DROP CONSTRAINT airports_pkey;
       public            postgres    false    215            ?           2606    16431    city city_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    217            }           2606    16410    passenger passengers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.passenger
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.passenger DROP CONSTRAINT passengers_pkey;
       public            postgres    false    214            ?           2606    16463    passenger_aircraft aircraft_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_aircraft
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);
 H   ALTER TABLE ONLY public.passenger_aircraft DROP CONSTRAINT aircraft_fk;
       public          postgres    false    216    219    3201            ?           2606    16476    aircraft_airport aircraft_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft_airport
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);
 F   ALTER TABLE ONLY public.aircraft_airport DROP CONSTRAINT aircraft_fk;
       public          postgres    false    220    216    3201            ?           2606    16450    city_airport airport_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.city_airport
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airport(id) NOT VALID;
 A   ALTER TABLE ONLY public.city_airport DROP CONSTRAINT airport_fk;
       public          postgres    false    215    218    3199            ?           2606    16481    aircraft_airport airport_fk    FK CONSTRAINT        ALTER TABLE ONLY public.aircraft_airport
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airport(id);
 E   ALTER TABLE ONLY public.aircraft_airport DROP CONSTRAINT airport_fk;
       public          postgres    false    215    3199    220            ?           2606    16445    city_airport city_fk    FK CONSTRAINT     r   ALTER TABLE ONLY public.city_airport
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES public.city(id);
 >   ALTER TABLE ONLY public.city_airport DROP CONSTRAINT city_fk;
       public          postgres    false    3203    218    217            ?           2606    16468    passenger passenger_city    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger
    ADD CONSTRAINT passenger_city FOREIGN KEY (city_id) REFERENCES public.city(id) NOT VALID;
 B   ALTER TABLE ONLY public.passenger DROP CONSTRAINT passenger_city;
       public          postgres    false    217    214    3203            ?           2606    16458    passenger_aircraft passenger_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_aircraft
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passenger(id);
 I   ALTER TABLE ONLY public.passenger_aircraft DROP CONSTRAINT passenger_fk;
       public          postgres    false    3197    219    214               ?   x?m?KN?0??3??	Nb;YRJ
;$? !???MNOX?????(??M?#?(%7X?-LBt??
?;?Hr?B??6.-a?'?*܎?a+???g?Z?G4??9????k?:?v-??r?r?]?????9?9j??#rs-??2???GSs}()&_ϱ???ccP????g????F????Tr.??١?a??ĥd???V?a'qn??U??|????5?x         Y   x?%???@Bϡ?|???CXyB 'O,?2&?K?<???fb??'?[?#n	ڷUZ???????L??Fk?i?m?Wv??x ???           x?]??n?0E????T???C
??T	??n??+f?r?V?}E U??s?#?;??r?^f{C?A*??q[Xh5#??uY?JΌ?]?*???^8lL's???FV}??t??;(0?>?<??R?tj#S???q??\g??@o??`??GΦ?B<B????:g?Y˷?O????Y^?:????a??S???L?`?b??r&#?GK???k|MP?l??D?a.^˹?E2??X~???iNأ?;???^?d?o-uL?????i<?>Λ???F??2}         ?   x?U?9?0 ??W?(>??@AC$
?U?(??W?P~ԣ?p??-??"?J?R??3M?r??[[??#5???Tp*[hϐ???_??%?QZh?ƴ???/?z),?L?rw]??
??pɁ@??H?F.-Q???N??????54         4   x????@??;?g?"??SRY?7?J?N7C????K+On?? ???         g  x?%?͒? ????l!???h2??$3٧?&{q?,?%????k???{?51q2???ҵ??S?Ǩ??OΚ??ѭ?yh{u????fo?O֢Q??????r?b?%qċ?Ө??/???w?t?r??2ʁJ?Z?ڎ?9F?d?PX"ݴt*gm?c"s??N&&?u??ϲ)B.F?&1??L????;?JL9?8?ؐ>?ܩi??)L??p?.̄b/t???Zz??-????:liյ6*?<??M?? ???w?wl򩽗q&'?m??0?????0?b>~mm?#??w???{??L?t??փ?1?%?)h-??q????,6??????B?>???<K??"?YOo???c?????r??dH7=?Yg??[?rw???{;H????Ŝ??2??V?TNٜ?=?4??Q??m݆|?>ϒ???c??I?xf?أA??è????ox2?	????ZO[ȧ?{??????2I??>ڄ??? v??t?N?z???'LΎCf??g5?>fN??RY??܎?Z?N:?]W?nH-X?Kf??ˋ3?Y.@?֦?Y$???@??>_??D??9???EK???*W:
@?_6A?[?H>?ru?!ր??_˲?T???         ?   x??O?Azk0[?????ǂ]?|,T@?f?a??o,=?m.?a8?!a?^0??Az$?8F?4????U? ???r?5??!?nj.??E)ӦZjc??ݢ	oʷ?*???Qv??'?@??1?W?O?~??9?E?     