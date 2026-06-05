# Organization Member Copilot

**Method(s):** `GET`  
**Path:** `/orgs/{org}/members/{username}/copilot`  
**API Version:** `2026-03-10`  
**Category:** User Management  
**Level:** Org

## Description
Gets Copilot seat details for a specific organization member.

## Required Permissions
Classic PAT or OAuth app scopes:

- `manage_billing:copilot` **or**
- `read:org`

## Parameters

### Path Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `org` | string | Yes | The organization login. |
| `username` | string | Yes | The GitHub username to inspect. |

## HTTP Status Codes
| Code | Meaning |
| --- | --- |
| `200` | Seat details returned successfully. |
| `401` | Authentication failed or was not provided. |
| `403` | Caller lacks permission to view organization member Copilot details. |
| `404` | Organization or user not found, or no seat details are available. |
| `422` | Validation failed for a supplied parameter. |
| `500` | GitHub server error. |

## Response Schema
```json
{
  "assignee": {
    "login": "ewega",
    "id": 12345,
    "node_id": "MDQ6VXNlcjE=",
    "avatar_url": "https://github.com/images/error/octocat_happy.gif",
    "gravatar_id": "",
    "url": "https://api.github.com/users/ewega",
    "html_url": "https://github.com/ewega",
    "type": "User",
    "site_admin": false
  },
  "organization": {
    "login": "eldrick-test-org",
    "id": 9876,
    "url": "https://api.github.com/orgs/eldrick-test-org",
    "description": "Test organization"
  },
  "assigning_team": {
    "id": 1,
    "name": "engineering",
    "slug": "engineering"
  },
  "pending_cancellation_date": null,
  "last_activity_at": "2024-03-01T12:00:00Z",
  "last_activity_editor": "vscode/1.85.0",
  "last_authenticated_at": "2024-03-01T11:00:00Z",
  "created_at": "2023-01-01T00:00:00Z",
  "plan_type": "business"
}
```

### Fields
| Field | Type | Description |
| --- | --- | --- |
| `assignee` | object | GitHub simple user object for the assigned member, including nested user fields such as `login`, `id`, `node_id`, `avatar_url`, `url`, `html_url`, `type`, and `site_admin`. |
| `organization` | object \| null | Organization that grants the seat. |
| `assigning_team` | object \| null | Team that grants the seat, when applicable. |
| `pending_cancellation_date` | string \| null | ISO 8601 date when the seat cancellation will take effect. |
| `last_activity_at` | string \| null | Last recorded Copilot activity timestamp. |
| `last_activity_editor` | string \| null | Editor associated with the most recent Copilot activity. |
| `last_authenticated_at` | string \| null | Last successful Copilot authentication time. |
| `created_at` | string | When the seat assignment was created. |
| `plan_type` | string | Copilot plan type, such as `business`. |

## Example
```http
GET https://api.github.com/orgs/eldrick-test-org/members/ewega/copilot
Accept: application/vnd.github+json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>
```

## References
- GitHub Docs: <https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-user-management?apiVersion=2026-03-10#get-copilot-seat-assignment-details-for-a-user>
