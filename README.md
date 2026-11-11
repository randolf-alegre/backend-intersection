# Section L API

Rails 8.1 API for the Section L apartment hotel (Ruby 3.4.2, SQLite).

```bash
bin/setup
bin/rails db:seed
bin/rails server
```

The API is served at `http://localhost:3000`. Specs run with `bin/rspec`.

## Conventions

Send `Content-Type: application/json`. Request fields use snake_case. Every JSON response camelizes keys (`refresh_token` becomes `refreshToken`, `has_next_page` becomes `hasNextPage`).

Protected routes expect:

```
Authorization: Bearer <token>
```

Access tokens expire after 24 hours. Refresh tokens expire after 30 days.

| Status | Body | When |
| --- | --- | --- |
| 401 | `{ "error": "Unauthorized" }` | Missing token, bad token, or bad login |
| 403 | `{ "error": "Forbidden" }` | Signed in, but not an admin |
| 404 | `{ "error": "Record not found" }` | Unknown id |
| 400 | Rails parameter error | A required key is missing |

Admin routes require a user whose `admin` flag is true. Guests can call the read routes that are not marked admin.

## Authentication

### `POST /api/login`

No token. Send either a guest keycard or a user email and password.

Guest:

```json
{ "keycard_token": "SL-GUEST-001" }
```

User:

```json
{ "email": "admin@g.com", "password": "asdf12345" }
```

Guest or non-admin user:

```json
{ "token": "<jwt>", "refreshToken": "<refresh>" }
```

Admin user (includes `admin`):

```json
{ "token": "<jwt>", "refreshToken": "<refresh>", "admin": true }
```

Unknown keycard, unknown email, or wrong password returns 401.

### `POST /api/refresh`

No access token. Issues a new access token.

```json
{ "refresh_token": "<refresh>" }
```

```json
{ "token": "<jwt>" }
```

An expired or unknown refresh token returns 401.

## Properties

A property is `{ "id", "name", "address", "description", "createdAt", "updatedAt" }`. `address` and `description` are required.

### `GET /api/properties`

Any signed-in actor. Query: `page` (default 1), `per_page` (default 10). A blank or non-positive value falls back to the default.

```json
{
  "properties": [ { "id": 1, "name": "Section L", "address": "Tokyo", "description": "Apartment hotel", "createdAt": "2026-11-09T00:00:00.000Z", "updatedAt": "2026-11-09T00:00:00.000Z" } ],
  "hasNextPage": false
}
```

### `GET /api/properties/search`

Any signed-in actor. Same pagination query. `name` is an exact, case-insensitive match. Omitting `name` lists every property.

```
GET /api/properties/search?name=section%20l&page=1&per_page=10
```

A `name` that matches nothing returns 404 `{ "error": "Property not found" }`. A match uses the same `{ "properties", "hasNextPage" }` body as the index.

### `POST /api/properties`

Admin.

```json
{
  "property": {
    "name": "Section L",
    "address": "Yanaka, Tokyo",
    "description": "Apartment hotel"
  }
}
```

Returns the created property.

### `PATCH /api/properties/:id` or `PUT /api/properties/:id`

Admin. Same `property` object. Send only the fields to change. Returns the property.

### `DELETE /api/properties/:id`

Admin.

```json
{ "message": "Property deleted successfully" }
```

### `POST /api/properties/associate_neighborhoods`

Admin. Links neighborhoods that are not already linked. `property` is the property id.

```json
{ "property": 1, "neighborhood_ids": [ 1, 2 ] }
```

Returns the property. Unknown property id returns 404.

## Neighborhoods

A neighborhood is `{ "id", "name", "hashtag", "description", "hashtagDescription", "city", "tags", "createdAt", "updatedAt" }`. All of those fields except the id and timestamps are required.

### `GET /api/properties/:property_id/neighborhoods`

Any signed-in actor. Returns the neighborhoods linked to that property, as an array.

### `GET /api/neighborhoods/all`

Admin. Returns every neighborhood, as an array.

### `POST /api/neighborhoods`

Admin. Status 201.

```json
{
  "neighborhood": {
    "name": "Yanaka",
    "hashtag": "yanaka",
    "description": "Temple town",
    "hashtag_description": "Walk the lanes",
    "city": "Tokyo",
    "tags": "Historic"
  }
}
```

Returns the created neighborhood.

### `PATCH /api/neighborhoods/:id` or `PUT /api/neighborhoods/:id`

Admin. Same `neighborhood` object. Returns the neighborhood.

### `DELETE /api/neighborhoods/:id`

Admin.

```json
{ "message": "Neighborhood deleted successfully" }
```

### `POST /api/neighborhoods/associate_properties`

Admin. Links properties that are not already linked. `neighborhood` is the neighborhood id.

```json
{ "neighborhood": 1, "property_ids": [ 1, 2 ] }
```

Returns the neighborhood.

### `POST /api/neighborhoods/associate_establishments`

Admin. Links establishments that are not already linked.

```json
{ "neighborhood": 1, "establishment_ids": [ 1, 2 ] }
```

Returns the neighborhood.

## Establishments

An establishment is `{ "id", "name", "establishmentCategoryId", "short", "long", "maps", "string", "coverImage", "tags", "createdAt", "updatedAt" }`. `name`, `short`, `long`, `maps`, and `coverImage` are required. `maps` and `cover_image` must be URLs. `establishment_category_id` is optional. `tags` may be blank.

### `GET /api/properties/:property_id/neighborhoods/:neighborhood_id/establishments`

Any signed-in actor. The neighborhood must belong to that property. Returns the linked establishments, as an array.

### `GET /api/establishments/all`

Admin. Returns every establishment, as an array.

### `POST /api/establishments`

Admin. Status 201.

```json
{
  "establishment": {
    "name": "Kayaba Coffee",
    "establishment_category_id": 1,
    "short": "Kissaten",
    "long": "A wood-lined coffee shop in Yanaka.",
    "maps": "https://maps.example/kayaba",
    "cover_image": "https://images.example/kayaba.jpg",
    "tags": "Cafes",
    "string": ""
  }
}
```

Returns the created establishment.

### `PATCH /api/establishments/:id` or `PUT /api/establishments/:id`

Admin. Same `establishment` object. Returns the establishment.

### `DELETE /api/establishments/:id`

Admin.

```json
{ "message": "Establishment deleted successfully" }
```

## Establishment categories

A category is `{ "id", "name", "createdAt", "updatedAt" }`. `name` is required and unique. Every category route is admin-only, including the list.

### `GET /api/establishment_categories`

Returns every category, as an array.

### `POST /api/establishment_categories`

Status 201.

```json
{ "establishment_category": { "name": "Cafes" } }
```

Returns the created category.

### `PATCH /api/establishment_categories/:id` or `PUT /api/establishment_categories/:id`

Same `establishment_category` object. Returns the category.

### `DELETE /api/establishment_categories/:id`

```json
{ "message": "Establishment category deleted successfully" }
```

## Health

`GET /up` needs no token. It returns 200 when the app has booted.
