drop policy "Enable all for auth users" on "public"."boaring_check_list";

revoke delete on table "public"."boaring_check_list" from "anon";

revoke insert on table "public"."boaring_check_list" from "anon";

revoke references on table "public"."boaring_check_list" from "anon";

revoke select on table "public"."boaring_check_list" from "anon";

revoke trigger on table "public"."boaring_check_list" from "anon";

revoke truncate on table "public"."boaring_check_list" from "anon";

revoke update on table "public"."boaring_check_list" from "anon";

revoke delete on table "public"."boaring_check_list" from "authenticated";

revoke insert on table "public"."boaring_check_list" from "authenticated";

revoke references on table "public"."boaring_check_list" from "authenticated";

revoke select on table "public"."boaring_check_list" from "authenticated";

revoke trigger on table "public"."boaring_check_list" from "authenticated";

revoke truncate on table "public"."boaring_check_list" from "authenticated";

revoke update on table "public"."boaring_check_list" from "authenticated";

revoke delete on table "public"."boaring_check_list" from "service_role";

revoke insert on table "public"."boaring_check_list" from "service_role";

revoke references on table "public"."boaring_check_list" from "service_role";

revoke select on table "public"."boaring_check_list" from "service_role";

revoke trigger on table "public"."boaring_check_list" from "service_role";

revoke truncate on table "public"."boaring_check_list" from "service_role";

revoke update on table "public"."boaring_check_list" from "service_role";

alter table "public"."boaring_check_list" drop constraint "boaring_check_list_entity_fkey";

alter table "public"."boaring_check_list" drop constraint "boaring_check_list_org_fkey";

alter table "public"."boaring_check_list" drop constraint "boaring_check_list_policy_fkey";

alter table "public"."contract_check_list" drop constraint "contract_check_list_boarding_fkey";

alter table "public"."contracts" drop constraint "contracts_offboarding_fkey";

alter table "public"."contracts" drop constraint "contracts_onboarding_fkey";

alter table "public"."boaring_check_list" drop constraint "boaring_check_list_pkey";

drop index if exists "public"."boaring_check_list_pkey";

drop table "public"."boaring_check_list";

create table "public"."boarding_check_lists" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "checklist" jsonb[] not null,
    "org" text not null,
    "entity" bigint,
    "is_default" boolean not null,
    "type" boarding_type not null,
    "policy" bigint not null,
    "name" text not null,
    "description" text
);


alter table "public"."boarding_check_lists" enable row level security;

CREATE UNIQUE INDEX boaring_check_list_pkey ON public.boarding_check_lists USING btree (id);

alter table "public"."boarding_check_lists" add constraint "boaring_check_list_pkey" PRIMARY KEY using index "boaring_check_list_pkey";

alter table "public"."boarding_check_lists" add constraint "boaring_check_list_entity_fkey" FOREIGN KEY (entity) REFERENCES legal_entities(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."boarding_check_lists" validate constraint "boaring_check_list_entity_fkey";

alter table "public"."boarding_check_lists" add constraint "boaring_check_list_org_fkey" FOREIGN KEY (org) REFERENCES organisations(subdomain) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."boarding_check_lists" validate constraint "boaring_check_list_org_fkey";

alter table "public"."boarding_check_lists" add constraint "boaring_check_list_policy_fkey" FOREIGN KEY (policy) REFERENCES approval_policies(id) ON UPDATE CASCADE ON DELETE RESTRICT not valid;

alter table "public"."boarding_check_lists" validate constraint "boaring_check_list_policy_fkey";

alter table "public"."contract_check_list" add constraint "contract_check_list_boarding_fkey" FOREIGN KEY (boarding) REFERENCES boarding_check_lists(id) ON UPDATE CASCADE not valid;

alter table "public"."contract_check_list" validate constraint "contract_check_list_boarding_fkey";

alter table "public"."contracts" add constraint "contracts_offboarding_fkey" FOREIGN KEY (offboarding) REFERENCES boarding_check_lists(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."contracts" validate constraint "contracts_offboarding_fkey";

alter table "public"."contracts" add constraint "contracts_onboarding_fkey" FOREIGN KEY (onboarding) REFERENCES boarding_check_lists(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."contracts" validate constraint "contracts_onboarding_fkey";

grant delete on table "public"."boarding_check_lists" to "anon";

grant insert on table "public"."boarding_check_lists" to "anon";

grant references on table "public"."boarding_check_lists" to "anon";

grant select on table "public"."boarding_check_lists" to "anon";

grant trigger on table "public"."boarding_check_lists" to "anon";

grant truncate on table "public"."boarding_check_lists" to "anon";

grant update on table "public"."boarding_check_lists" to "anon";

grant delete on table "public"."boarding_check_lists" to "authenticated";

grant insert on table "public"."boarding_check_lists" to "authenticated";

grant references on table "public"."boarding_check_lists" to "authenticated";

grant select on table "public"."boarding_check_lists" to "authenticated";

grant trigger on table "public"."boarding_check_lists" to "authenticated";

grant truncate on table "public"."boarding_check_lists" to "authenticated";

grant update on table "public"."boarding_check_lists" to "authenticated";

grant delete on table "public"."boarding_check_lists" to "service_role";

grant insert on table "public"."boarding_check_lists" to "service_role";

grant references on table "public"."boarding_check_lists" to "service_role";

grant select on table "public"."boarding_check_lists" to "service_role";

grant trigger on table "public"."boarding_check_lists" to "service_role";

grant truncate on table "public"."boarding_check_lists" to "service_role";

grant update on table "public"."boarding_check_lists" to "service_role";

create policy "Enable all for auth users"
on "public"."boarding_check_lists"
as permissive
for all
to authenticated
using (true);



