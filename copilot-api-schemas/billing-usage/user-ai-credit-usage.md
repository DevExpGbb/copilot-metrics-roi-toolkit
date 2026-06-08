# Get Billing AI Credit Usage Report for a User

**Method(s):** `GET`  
**Path:** `/users/{username}/settings/billing/ai_credit/usage`  
**API Version:** `2026-03-10`  
**Category:** Billing Usage  
**Level:** User

## Description
Gets a report of AI credit usage for a user. Use this endpoint to inspect billed AI credit consumption by time period, model, or product for an individual user account.

## Required Permissions
Classic PAT or OAuth app scopes:

- This endpoint is scoped to the authenticated user account and may require a personal billing token.

## Parameters

### Path Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `username` | string | Yes | The GitHub username. |

### Query Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `year` | integer | No | Return results for a single year. Defaults to the current year. |
| `month` | integer | No | Return results for a single month. Defaults to the current month. |
| `day` | integer | No | Return results for a single day. Defaults to the current day within the selected month/year. |
| `model` | string | No | Filter by model name (case-insensitive). |
| `product` | string | No | Filter by product name (case-insensitive). |

## HTTP Status Codes
| Code | Meaning |
| --- | --- |
| `200` | AI credit usage report returned successfully. |
| `400` | Bad request. |
| `403` | Caller lacks permissions to view user billing usage. |
| `404` | User or billing usage resource not found. |
| `500` | GitHub server error. |
| `503` | Service unavailable. |

## Response Schema
```json
{
  "timePeriod": {
    "year": 2025,
    "month": 6,
    "day": 10
  },
  "user": "octocat",
  "product": "copilot",
  "model": "gpt-4.1",
  "usageItems": [
    {
      "product": "Copilot",
      "sku": "AI-CREDITS",
      "model": "gpt-4.1",
      "unitType": "credits",
      "pricePerUnit": 1,
      "grossQuantity": 10,
      "grossAmount": 10,
      "discountQuantity": 0,
      "discountAmount": 0,
      "netQuantity": 10,
      "netAmount": 10
    }
  ]
}
```

## Example
```http
GET https://api.github.com/users/octocat/settings/billing/ai_credit/usage?year=2025&month=6
Accept: application/vnd.github+json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>
```

## References
- GitHub Docs: <https://docs.github.com/en/rest/billing/usage?apiVersion=2026-03-10#get-billing-ai-credit-usage-report-for-a-user>
