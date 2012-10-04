---
title: Meals | OpenMensa API
---

# Meals API

## Authentication

You can read all data anonymously.

## List meals of a day

	GET /canteens/:canteen_id/days/:id/meals

### Parameters

includes
: _Optional_ **string** - may be empty (only an array of meal IDs as property `meal_ids`) or `meals` (array of full nested meals as property `meals`). It defaults to empty.

### Response

<%= headers 200 %>
<%= json :meals %>

## Get a single meal

	GET /canteens/:canteen_id/days/:day_id/meals/:id

### Response

<%= headers 200 %>
<%= json :meal %>