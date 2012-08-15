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

search
: _Optional_ **string** - Searches/filters the list of all canteens with the given expression.

### Response

<%= headers 200 %>
<%= json(:canteen) { |h| [h] } %>

## Get a single canteen

	GET /canteens/:id

### Reponse

<%= headers 200 %>
<%= json(:canteen) %>
