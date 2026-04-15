-- public.buildings определение
CREATE EXTENSION IF NOT EXISTS postgis;
-- Drop table

-- DROP TABLE public.buildings;

CREATE TABLE public.buildings (
	id serial4 NOT NULL,
	osm_id text NOT NULL,
	addr_city text NULL,
	addr_street text NULL,
	addr_housenumber text NULL,
	addr_place text NULL,
	building text NULL,
	building_levels text NULL,
	"name" text NULL,
	geom public.geometry(multipolygon, 4326) NOT NULL,
	CONSTRAINT buildings_osm_id_key UNIQUE (osm_id),
	CONSTRAINT buildings_pkey PRIMARY KEY (id)
);

-- public.poi определение

-- Drop table

-- DROP TABLE public.poi;

CREATE TABLE public.poi (
	id serial4 NOT NULL,
	osm_id text NOT NULL,
	"name" text NULL,
	power text NULL,
	"tower:type" text NULL,
	"tower:construction" text NULL,
	material text NULL,
	geom public.geometry(point, 4326) NOT NULL,
	CONSTRAINT poi_osm_id_key UNIQUE (osm_id),
	CONSTRAINT poi_pkey PRIMARY KEY (id)
);

-- public.roads определение

-- Drop table

-- DROP TABLE public.roads;

CREATE TABLE public.roads (
	id serial4 NOT NULL,
	osm_id text NOT NULL,
	"name" text NULL,
	highway text NULL,
	"ref" text NULL,
	maxspeed text NULL,
	oneway text NULL,
	surface text NULL,
	lanes text NULL,
	geom public.geometry(multilinestring, 4326) NOT NULL,
	CONSTRAINT roads_osm_id_key UNIQUE (osm_id),
	CONSTRAINT roads_pkey PRIMARY KEY (id)
);

INSERT INTO public.buildings (osm_id,addr_city,addr_street,addr_housenumber,addr_place,building,building_levels,"name",geom) VALUES
	 ('way/1478776408','село Русская Борковка','6-я улица','508','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.2826899 53.6010793, 49.2826791 53.6010472, 49.282776 53.6010358, 49.2827867 53.6010679, 49.2826899 53.6010793)))'::public.geometry),
	 ('way/1478776409','село Русская Борковка','6-я улица','507','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.2826574 53.6009105, 49.2826424 53.6008741, 49.2827382 53.6008601, 49.2827532 53.6008966, 49.2826574 53.6009105)))'::public.geometry),
	 ('way/1478776410','село Русская Борковка','6-я улица','90','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.2829118 53.6009083, 49.2828951 53.6008546, 49.2829888 53.6008444, 49.2830054 53.6008981, 49.2829118 53.6009083)))'::public.geometry),
	 ('way/1478776411','село Русская Борковка','6-я улица','87','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.2827024 53.600737, 49.2826342 53.6007427, 49.282625 53.600704, 49.2826931 53.6006983, 49.2827024 53.600737)))'::public.geometry),
	 ('way/1478776412','село Русская Борковка','6-я улица','514','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.2827325 53.6001815, 49.2827188 53.6001198, 49.282805 53.6001131, 49.2828226 53.6001915, 49.2827875 53.6001943, 49.2827838 53.6001774, 49.2827325 53.6001815)))'::public.geometry),
	 ('way/1478776413','село Русская Борковка','6-я улица','77','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.2822991 53.5999013, 49.2822659 53.5997729, 49.282398 53.5997609, 49.2824311 53.5998893, 49.2822991 53.5999013)))'::public.geometry),
	 ('way/1478776414','село Русская Борковка','6-я улица','516','СНТ "Сборщик"','house','1',NULL,'SRID=4326;MULTIPOLYGON (((49.282584 53.5998129, 49.282573 53.5997737, 49.2826759 53.5997635, 49.2826869 53.5998028, 49.282584 53.5998129)))'::public.geometry),
	 ('way/1478776415','село Русская Борковка','6-я улица','517','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.2825503 53.5996762, 49.2825375 53.5996143, 49.2826141 53.5996088, 49.2826269 53.5996706, 49.2825503 53.5996762)))'::public.geometry),
	 ('way/1478776416','село Русская Борковка','6-я улица','500','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.2823242 53.599663, 49.2823107 53.5996049, 49.2823587 53.599601, 49.2823722 53.5996591, 49.2823242 53.599663)))'::public.geometry),
	 ('way/1478776417','село Русская Борковка','6-я улица','75','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.2822261 53.5995799, 49.2822178 53.5995504, 49.2823131 53.599541, 49.2823214 53.5995705, 49.2822261 53.5995799)))'::public.geometry);
INSERT INTO public.buildings (osm_id,addr_city,addr_street,addr_housenumber,addr_place,building,building_levels,"name",geom) VALUES
	 ('way/1478776418','село Русская Борковка','8-я улица','90','СНТ "Сборщик"','house','2',NULL,'SRID=4326;MULTIPOLYGON (((49.284323 53.6006968, 49.28431 53.6006643, 49.2843927 53.6006527, 49.2844057 53.6006852, 49.284323 53.6006968)))'::public.geometry);

INSERT INTO public.roads (osm_id,"name",highway,"ref",maxspeed,oneway,surface,lanes,geom) VALUES
	 ('way/308549388','6-я улица','service',NULL,NULL,NULL,NULL,NULL,'SRID=4326;MULTILINESTRING ((49.2804558 53.5927673, 49.2829147 53.6012205))'::public.geometry),
	 ('way/308549389','7-я улица','service',NULL,NULL,NULL,NULL,NULL,'SRID=4326;MULTILINESTRING ((49.2837574 53.6011293, 49.2812961 53.5926972))'::public.geometry),
	 ('way/308549390','8-я улица','service',NULL,NULL,NULL,NULL,NULL,'SRID=4326;MULTILINESTRING ((49.282142 53.5926267, 49.2845957 53.6010073))'::public.geometry);


CREATE INDEX idx_buildings_geom ON buildings USING GIST (geom);
CREATE INDEX idx_roads_geom ON roads USING GIST (geom);
CREATE INDEX idx_poi_geom ON poi USING GIST (geom);