# Organization Selected Teams

**Method(s):** `POST` / `DELETE`  
**Path:** `/orgs/{org}/copilot/billing/selected_teams`  
**API Version:** `2026-03-10`  
**Category:** User Management  
**Level:** Org

> ⚠️ **MUTATING ENDPOINT — Documented only. Never executed by tooling in this repository.**

## Description
This endpoint manages team-based Copilot seat assignment for an organization.

- **POST:** Purchases a Copilot seat for all users within each specified team in the organization.
- **DELETE:** Sets seats for all members of each specified team to `pending cancellation`.

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
| `selected_teams` | array of strings | Yes | Team slugs to add to or remove from Copilot seat assignment. |

#### Example Body
```json
{
  "selected_teams": ["engteam1", "engteam2"]
}
```

## HTTP Status Codes

### POST
| Code | Meaning |
| --- | --- |
| `201` | Seats were created for members of the specified teams. |
| `401` | Authentication failed or was not provided. |
| `403` | Caller lacks permission to manage organization Copilot billing. |
| `404` | Organization or one of the specified teams was not found. |
| `422` | Validation failed for the request payload. |
| `500` | GitHub server error. |

### DELETE
| Code | Meaning |
| --- | --- |
| `200` | Seats were marked for cancellation. |
| `401` | Authentication failed or was not provided. |
| `403` | Caller lacks permission to manage organization Copilot billing. |
| `404` | Organization or one of the specified teams was not found. |
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
| `seats_created` | integer | Number of seats created for members of the specified teams. |
| `seats_cancelled` | integer | Number of seats moved to pending cancellation. |

## Example

### POST
```http
POST https://api.github.com/orgs/eldrick-test-org/copilot/billing/selected_teams
Accept: application/vnd.github+json
Content-Type: application/json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>

{
  "selected_teams": ["engteam1", "engteam2"]
}
```

### DELETE
```http
DELETE https://api.github.com/orgs/eldrick-test-org/copilot/billing/selected_teams
Accept: application/vnd.github+json
Content-Type: application/json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>

{
  "selected_teams": ["engteam1", "engteam2"]
}
```

## References
- GitHub Docs: <https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-user-management?apiVersion=2026-03-10#add-teams-to-the-copilot-subscription-for-an-organization>
