---
title: Meals | OpenMensa API
---

# Meals API

## Authentication

You can read all data anonymously.

## List meals of a canteen

	GET /canteens/:id/meals

### Parameters

start
: _Optional_ **string** of a date in following format: YYYY-MM-DD. If no start date is given it defaults to today.

range
: _Optional_ non-negative **integer** - Number of days since start date for which to return meals. If no range is given it defaults to 2 days.

### Response

<%= headers 200 %>
<%= json :meals %>

## Get a single meal

	GET /canteens/:canteen_id/meals/:id

### Response

<%= headers 200 %>
<%= json :meal %>