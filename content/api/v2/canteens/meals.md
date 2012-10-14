---
title: Meals | OpenMensa API
---

# Meals API

## Authentication

You can read all data anonymously.

## List meals of a day

	GET /canteens/:canteen_id/days/:day_date/meals

### Response

<%= headers 200 %>
<%= json :meals %>

## Get a single meal

	GET /canteens/:canteen_id/days/:day_date/meals/:id

### Response

<%= headers 200 %>
<%= json :meal %>
