# Organization Selected Users

**Method(s):** `POST` / `DELETE`  
**Path:** `/orgs/{org}/copilot/billing/selected_users`  
**API Version:** `2026-03-10`  
**Category:** User Management  
**Level:** Org

> ⚠️ **MUTATING ENDPOINT — Documented only. Never executed by tooling in this repository.**

## Description
This endpoint manages direct user-based Copilot seat assignment for an organization.

- **POST:** Purchases a Copilot seat for each specified user in the organization.
- **DELETE:** Sets seats for all specified users to `pending cancellation`.
- **Note:** Seats assigned via team membership cannot be cancelled through this endpoint.

## Required Permissions
Classic PAT or OAuth app scopes:

- `manage_billing:copilot` **or**
- `admin:org`

## Parameters

### Path Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `org` | string | Yes | The organization login. |

### Request Body
Applies to both `POST` and `DELETE`.

| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `selected_usernames` | array of strings | Yes | GitHub usernames to add to or remove from direct seat assignment. |

#### Example Body
```json
{
  "selected_usernames": ["cooluser1", "hacker2"]
}
```

## HTTP Status Codes

### POST
| Code | Meaning |
| --- | --- |
| `201` | Seats were created for the specified users. |
| `401` | Authentication failed or was not provided. |
| `403` | Caller lacks permission to manage organization Copilot billing. |
| `404` | Organization or one of the specified users was not found. |
| `422` | Validation failed for the request payload. |
| `500` | GitHub server error. |

### DELETE
| Code | Meaning |
| --- | --- |
| `200` | Seats were marked for cancellation. |
| `401` | Authentication failed or was not provided. |
| `403` | Caller lacks permission to manage organization Copilot billing. |
| `404` | Organization or one of the specified users was not found. |
| `422` | Validation failed for the request payload. |
| `500` | GitHub server error. |

## Response Schema

### POST `201`
```json
{ "seats_created": 3 }
```

### DELETE `200`
```json
{ "seats_cancelled": 3 }
```

| Field | Type | Description |
| --- | --- | --- |
| `seats_created` | integer | Number of seats created for the specified users. |
| `seats_cancelled` | integer | Number of seats moved to pending cancellation. |

## Example

### POST
```http
POST https://api.github.com/orgs/eldrick-test-org/copilot/billing/selected_users
Accept: application/vnd.github+json
Content-Type: application/json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>

{
  "selected_usernames": ["cooluser1", "hacker2"]
}
```

### DELETE
```http
DELETE https://api.github.com/orgs/eldrick-test-org/copilot/billing/selected_users
Accept: application/vnd.github+json
Content-Type: application/json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>

{
  "selected_usernames": ["cooluser1", "hacker2"]
}
```

## References
- GitHub Docs: <https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-user-management?apiVersion=2026-03-10#add-users-to-the-copilot-subscription-for-an-organization>
