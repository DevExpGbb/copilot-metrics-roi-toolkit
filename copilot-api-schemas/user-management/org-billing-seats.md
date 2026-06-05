# Organization Billing Seats

**Method(s):** `GET`  
**Path:** `/orgs/{org}/copilot/billing/seats`  
**API Version:** `2026-03-10`  
**Category:** User Management  
**Level:** Org

## Description
Lists all Copilot seats for which the organization is currently being billed.

## Required Permissions
Classic PAT or OAuth app scopes:

- `manage_billing:copilot` **or**
- `read:org`

## Parameters

### Path Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `org` | string | Yes | The organization login. |

### Query Parameters
| Name | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `page` | integer | No | `1` | Page number for paginated results. |
| `per_page` | integer | No | `50` | Number of results per page. Maximum: `100`. |

## HTTP Status Codes
| Code | Meaning |
| --- | --- |
| `200` | Seat assignments returned successfully. |
| `401` | Authentication failed or was not provided. |
| `403` | Caller lacks permission to view organization Copilot billing data. |
| `404` | Organization not found or Copilot billing is unavailable for it. |
| `500` | GitHub server error. |

## Response Schema
This endpoint returns the same top-level structure as the enterprise billing seats endpoint: `total_seats` plus a `seats` array of seat objects.

```json
{
  "total_seats": 42,
  "seats": [
    {
      "assignee": {
        "login": "octocat",
        "id": 1,
        "node_id": "MDQ6VXNlcjE=",
        "avatar_url": "https://github.com/images/error/octocat_happy.gif",
        "gravatar_id": "",
        "url": "https://api.github.com/users/octocat",
        "html_url": "https://github.com/octocat",
        "type": "User",
        "site_admin": false
      },
      "organization": {
        "login": "github",
        "id": 1,
        "url": "https://api.github.com/orgs/github",
        "description": "A great organization"
      },
      "assigning_team": null,
      "pending_cancellation_date": null,
      "last_activity_at": "2024-03-01T12:00:00Z",
      "last_activity_editor": "vscode/1.85.0",
      "last_authenticated_at": "2024-03-01T11:00:00Z",
      "created_at": "2023-01-01T00:00:00Z",
      "plan_type": "business"
    }
  ]
}
```

### Fields
| Field | Type | Description |
| --- | --- | --- |
| `total_seats` | integer | Total billed seats for the organization. |
| `seats` | array | Seat assignment records billed to the organization. |
| `seats[].assignee` | object | GitHub simple user object for the assigned member. |
| `seats[].organization` | object \| null | Organization granting the seat. |
| `seats[].assigning_team` | object \| null | Team that grants the seat, when applicable. |
| `seats[].pending_cancellation_date` | string \| null | ISO 8601 date when cancellation will take effect. |
| `seats[].last_activity_at` | string \| null | Last recorded Copilot activity timestamp. |
| `seats[].last_activity_editor` | string \| null | Last editor associated with recorded activity. |
| `seats[].last_authenticated_at` | string \| null | Last successful Copilot authentication time. |
| `seats[].created_at` | string | When the seat assignment was created. |
| `seats[].plan_type` | string | Copilot plan type, such as `business`. |

## Example
```http
GET https://api.github.com/orgs/eldrick-test-org/copilot/billing/seats?per_page=10
Accept: application/vnd.github+json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>
```

## References
- GitHub Docs: <https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-user-management?apiVersion=2026-03-10#list-all-copilot-seat-assignments-for-an-organization>
