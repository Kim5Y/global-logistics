-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.inventory (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  item_name text NOT NULL,
  category text NOT NULL,
  stock_level integer DEFAULT 0,
  reorder_point integer NOT NULL DEFAULT 10,
  price numeric NOT NULL,
  supplier_email text NOT NULL,
  operation text,
  CONSTRAINT inventory_pkey PRIMARY KEY (id)
);
CREATE TABLE public.order_logs (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  item_name text,
  category text,
  price numeric,
  action text CHECK (action = ANY (ARRAY['inbound'::text, 'outbound'::text])),
  timestamp timestamp with time zone DEFAULT now(),
  CONSTRAINT order_logs_pkey PRIMARY KEY (id)
);
CREATE TABLE public.product_manuals (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  content text,
  metadata jsonb,
  embedding USER-DEFINED,
  CONSTRAINT product_manuals_pkey PRIMARY KEY (id)
);