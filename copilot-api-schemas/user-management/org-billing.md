# Organization Billing

**Method(s):** `GET`  
**Path:** `/orgs/{org}/copilot/billing`  
**API Version:** `2026-03-10`  
**Category:** User Management  
**Level:** Org

## Description
Gets information about an organization's Copilot subscription, including seat breakdown, plan type, seat-management mode, and feature-policy settings.

## Required Permissions
Classic PAT or OAuth app scopes:

- `manage_billing:copilot` **or**
- `read:org`

## Parameters

### Path Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `org` | string | Yes | The organization login. |

## HTTP Status Codes
| Code | Meaning |
| --- | --- |
| `200` | Organization billing information returned successfully. |
| `401` | Authentication failed or was not provided. |
| `403` | Caller lacks permission to view organization Copilot billing data. |
| `404` | Organization not found or Copilot billing is unavailable for it. |
| `422` | Validation failed for a supplied parameter. |
| `500` | GitHub server error. |

## Response Schema
```json
{
  "seat_breakdown": {
    "total": 100,
    "added_this_cycle": 5,
    "pending_cancellation": 2,
    "pending_invitation": 1,
    "active_this_cycle": 93,
    "inactive_this_cycle": 7
  },
  "public_code_suggestions": "block",
  "ide_chat": "enabled",
  "platform_chat": "enabled",
  "cli": "enabled",
  "seat_management_setting": "assign_selected",
  "plan_type": "business"
}
```

### Fields
| Field | Type | Description |
| --- | --- | --- |
| `seat_breakdown.total` | integer | Total seats in the subscription. |
| `seat_breakdown.added_this_cycle` | integer | Seats added during the current billing cycle. |
| `seat_breakdown.pending_cancellation` | integer | Seats scheduled for cancellation. |
| `seat_breakdown.pending_invitation` | integer | Seats awaiting acceptance of invitation or assignment completion. |
| `seat_breakdown.active_this_cycle` | integer | Seats with activity during the current billing cycle. |
| `seat_breakdown.inactive_this_cycle` | integer | Seats without activity during the current billing cycle. |
| `public_code_suggestions` | string | Public code suggestion policy, such as `allow` or `block`. |
| `ide_chat` | string | Whether IDE chat is enabled. |
| `platform_chat` | string | Whether platform chat is enabled. |
| `cli` | string | Whether Copilot CLI is enabled. |
| `seat_management_setting` | string | Seat assignment mode, such as `assign_selected`. |
| `plan_type` | string | Copilot plan type, such as `business`. |

## Example
```http
GET https://api.github.com/orgs/eldrick-test-org/copilot/billing
Accept: application/vnd.github+json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>
```

## References
- GitHub Docs: <https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-user-management?apiVersion=2026-03-10#get-copilot-seat-information-and-settings-for-an-organization>
