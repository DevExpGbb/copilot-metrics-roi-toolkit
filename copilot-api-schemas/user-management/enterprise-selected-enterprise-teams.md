# Enterprise Selected Enterprise Teams

**Method(s):** `POST` / `DELETE`  
**Path:** `/enterprises/{enterprise}/copilot/billing/selected_enterprise_teams`  
**API Version:** `2026-03-10`  
**Category:** User Management  
**Level:** Enterprise

> ⚠️ **MUTATING ENDPOINT — Documented only. Never executed by tooling in this repository.**

## Description
This endpoint manages enterprise-team-based Copilot seat assignment for an enterprise.

- **POST:** Purchases a GitHub Copilot seat for all users in each specified enterprise team.
- **DELETE:** Sets seats for all members of each specified enterprise team to `pending cancellation`.

## Required Permissions
Classic PAT or OAuth app scopes:

- `manage_billing:copilot` **or**
- `admin:enterprise`

## Parameters

### Path Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `enterprise` | string | Yes | The enterprise slug. |

### Request Body
Applies to both `POST` and `DELETE`.

| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `selected_enterprise_teams` | array of strings | Yes | Enterprise team slugs to add to or remove from Copilot seat assignment. |

#### Example Body
```json
{
  "selected_enterprise_teams": ["engteam1", "engteam2"]
}
```

## HTTP Status Codes

### POST
| Code | Meaning |
| --- | --- |
| `201` | Seats were created for the specified enterprise teams. |
| `401` | Authentication failed or was not provided. |
| `403` | Caller lacks permission to manage enterprise Copilot billing. |
| `404` | Enterprise or one of the specified teams was not found. |
| `422` | Validation failed for the request payload. |
| `500` | GitHub server error. |

### DELETE
| Code | Meaning |
| --- | --- |
| `200` | Seats were marked for cancellation. |
| `202` | Cancellation was accepted for asynchronous processing. |
| `401` | Authentication failed or was not provided. |
| `403` | Caller lacks permission to manage enterprise Copilot billing. |
| `404` | Enterprise or one of the specified teams was not found. |
| `422` | Validation failed for the request payload. |
| `500` | GitHub server error. |

## Response Schema

### POST `201`
```json
{ "seats_created": 3 }
```

| Field | Type | Description |
| --- | --- | --- |
| `seats_created` | integer | Number of seats created for members of the specified enterprise teams. |

### DELETE `200`
```json
{ "seats_cancelled": 3 }
```

### DELETE `202`
```json
{ "message": "Cancellation accepted" }
```

| Field | Type | Description |
| --- | --- | --- |
| `seats_cancelled` | integer | Number of seats moved to pending cancellation when the operation completes immediately. |
| `message` | string | Confirmation that the cancellation request was accepted for processing. |

## Example

### POST
```http
POST https://api.github.com/enterprises/avocado-corp/copilot/billing/selected_enterprise_teams
Accept: application/vnd.github+json
Content-Type: application/json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>

{
  "selected_enterprise_teams": ["engteam1", "engteam2"]
}
```

### DELETE
```http
DELETE https://api.github.com/enterprises/avocado-corp/copilot/billing/selected_enterprise_teams
Accept: application/vnd.github+json
Content-Type: application/json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>

{
  "selected_enterprise_teams": ["engteam1", "engteam2"]
}
```

## References
- GitHub Docs: <https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-user-management?apiVersion=2026-03-10#add-enterprise-teams-to-the-copilot-subscription-for-an-enterprise>
