---
title: Canteens | OpenMensa API
---

# Canteens API

## Authentication

You can read all data anonymously.

## List canteens

List all canteens:

	GET /canteens

### Parameters

near[lat], near[lng]
: _Optional_ **float** - Searches for canteens near given coordinates. Both coordinates must be given.

near[dist]
: _Optional_ **float** - Maximum distance to search for canteens near given coordinates. Requires given latitude and longitude. Default distance is 10 km.

ids
: _Optional_ **string** - A comma separated list of canteen ids that should be returned.

### Response

<%= headers 200 %>
<%= json :canteens %>

## Get a single canteen

	GET /canteens/:id

### Reponse

<%= headers 200 %>
<%= json :canteen %>
