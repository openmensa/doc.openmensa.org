---
title: Days | OpenMensa API
---

# Days API

## Authentication

You can read all data anonymously.

## List days of a canteen

	GET /canteens/:id/days

### Parameters

start
: _Optional_ **string** of a date in following format: YYYY-MM-DD. If no start date is given it defaults to yesterday.

range
: _Optional_ non-negative **integer** - Number of days since start date. If no range is given it defaults to 4 days.

### Response

<%= headers 200 %>
<%= json :days %>

## Get a single day

	GET /canteens/:canteen_id/days/:id

### Response

<%= headers 200 %>
<%= json :day %>