---
title: Favs | OpenMensa API
---

# Favs API

## Authentication

You need to be authorized by OAuth to read and write a user's favorites.

## List favs

List the current users favs:

	GET /favs

The server will output them sorted ascendingly by `sort_value`.

### Response

<%= headers 200 %>
<%= json(:fav) { |h| [h] } %>

## Get a single fav

	GET /favs/:id

### Response

<%= headers 200 %>
<%= json :fav %>

## Create

	POST /favs

### Input

canteen_id
: _Required_ **integer** - The referenced canteen, needs to be unique among a user's favorites list.

sort_value
: _Required_ non-negative **integer** - A value by which the favorites are sorted ascendingly; the sequence of sort_values may contain duplicates or gaps.

<%= json \
  :canteen_id => 1,
  :index => 6
%>

### Response

<%= headers 201 %>
<%= json :fav %>

### Errors

On duplicate canteen_id:

<%= headers 409 %>

## Edit

	PATCH /favs/:id

### Input

canteen_id
: _Optional_ **integer** - The referenced canteen, needs to be unique among a user's favorites list.

index
: _Optional_ non-negative **integer** - A value by which the favorites are sorted ascendingly; the sequence of sort_values may contain duplicates or gaps.

<%= json \
  :index => 6
%>

### Response

<%= headers 200 %>
<%= json :fav %>

### Errors

On duplicate canteen_id:

<%= headers 409 %>

## Delete

	DELETE /favs/:id

### Response

<%= headers 204 %>
