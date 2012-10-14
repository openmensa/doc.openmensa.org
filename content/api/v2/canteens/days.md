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
: _Optional_ **string** of a date in following format: YYYY-MM-DD. If no start date is given it defaults to today.

<%= alert("You can use the <code>limit</code> parameter from pagination to specify a range of days.", :notice) %>

### Response

<%= alert("Do not expect a resource for every day. There can be days without a resource.", :warning) %>

<%= headers 200 %>
<%= json :days %>

## Get a single day

	GET /canteens/:canteen_id/days/:day_date

### Response

<%= headers 200 %>
<%= json :day %>
