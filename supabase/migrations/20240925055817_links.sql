create table "public"."links" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "link" character varying not null,
    "path" text not null,
    "org" text not null,
    "entity" bigint,
    "updated_at" timestamp with time zone not null default now(),
    "name" text not null
);


alter table "public"."links" enable row level security;

CREATE UNIQUE INDEX links_name_key ON public.links USING btree (name);

CREATE UNIQUE INDEX links_pkey ON public.links USING btree (id);

alter table "public"."links" add constraint "links_pkey" PRIMARY KEY using index "links_pkey";

alter table "public"."links" add constraint "links_entity_fkey" FOREIGN KEY (entity) REFERENCES legal_entities(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."links" validate constraint "links_entity_fkey";

alter table "public"."links" add constraint "links_name_key" UNIQUE using index "links_name_key";

alter table "public"."links" add constraint "links_org_fkey" FOREIGN KEY (org) REFERENCES organisations(subdomain) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."links" validate constraint "links_org_fkey";

grant delete on table "public"."links" to "anon";

grant insert on table "public"."links" to "anon";

grant references on table "public"."links" to "anon";

grant select on table "public"."links" to "anon";

grant trigger on table "public"."links" to "anon";

grant truncate on table "public"."links" to "anon";

grant update on table "public"."links" to "anon";

grant delete on table "public"."links" to "authenticated";

grant insert on table "public"."links" to "authenticated";

grant references on table "public"."links" to "authenticated";

grant select on table "public"."links" to "authenticated";

grant trigger on table "public"."links" to "authenticated";

grant truncate on table "public"."links" to "authenticated";

grant update on table "public"."links" to "authenticated";

grant delete on table "public"."links" to "service_role";

grant insert on table "public"."links" to "service_role";

grant references on table "public"."links" to "service_role";

grant select on table "public"."links" to "service_role";

grant trigger on table "public"."links" to "service_role";

grant truncate on table "public"."links" to "service_role";

grant update on table "public"."links" to "service_role";

create policy "Enable all for authenticated users only"
on "public"."links"
as permissive
for all
to authenticated
using (true);


create policy "Enable delete for authenticated users only"
on "public"."time_off"
as permissive
for delete
to authenticated
using (true);



