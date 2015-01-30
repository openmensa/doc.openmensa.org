---
title: Canteens | OpenMensa API
---

# Canteens API

The **Canteens API** allows to query for all canteens or a geographical filtered subset. Canteens are supposed to not change very often and should be cached locally.

## List canteens

List all canteens:

	GET /canteens

### Parameters

near\[lat\], near\[lng\]
: _Optional_ **float** - Searches for canteens near given coordinates. Both coordinates must be given.

near\[dist\]
: _Optional_ **float** - Maximum distance to search for canteens near given coordinates. Requires given latitude and longitude. Default distance is 10 km.

ids
: _Optional_ **string** - A comma separated list of canteen ids that should be returned.

### Response

<%= curl "canteens" %>
<%= headers 200, :pagination => "canteens" %>
<%= json :canteens %>

id
: **int** - The canteen's numeric ID, which identifys it uniquely within the API.

name
: **string** - The canteen's name.

address
: **string** - A human readable real-world locator (vulgo _street address_).

coordinates
: **list of floats** (or **null**) - The coordinates of the canteen, gievn as list of latitude and longitude in north-eastern direction (negative values imply southern or western hemisphere). Can be null if coordinates are unknown.

### Examples

Return all canteens within a 5km radius around the Uni Potsdam canteen in Griebnitzsee.

<%= curl "canteens?near[lat]=52.393535&near[lng]=13.127814&near[dist]=5" %>

## Get a single canteen

	GET /canteens/:id

### Reponse

<%= curl "canteens/1" %>
<%= headers 200 %>
<%= json :canteen %>
