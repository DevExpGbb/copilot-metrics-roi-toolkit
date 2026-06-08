# Get Billing AI Credit Usage Report for an Organization

**Method(s):** `GET`  
**Path:** `/organizations/{org}/settings/billing/ai_credit/usage`  
**API Version:** `2026-03-10`  
**Category:** Billing Usage  
**Level:** Organization

## Description
Gets a report of AI credit usage for an organization. Use this endpoint to inspect billed AI credit consumption by time period, user, model, or product for an organization within an enterprise.

## Required Permissions
Classic PAT or OAuth app scopes:

- `manage_billing:copilot` **or**
- `admin:org`

## Parameters

### Path Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `org` | string | Yes | The organization name. |

### Query Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `year` | integer | No | Return results for a single year. Defaults to the current year. |
| `month` | integer | No | Return results for a single month. Defaults to the current month. |
| `day` | integer | No | Return results for a single day. Defaults to the current day within the selected month/year. |
| `user` | string | No | Filter by GitHub username (case-insensitive). |
| `model` | string | No | Filter by model name (case-insensitive). |
| `product` | string | No | Filter by product name (case-insensitive). |

## HTTP Status Codes
| Code | Meaning |
| --- | --- |
| `200` | AI credit usage report returned successfully. |
| `400` | Bad request. |
| `403` | Caller lacks permissions to view organization billing usage. |
| `404` | Organization or billing usage resource not found. |
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
  "organization": "platform",
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
GET https://api.github.com/organizations/platform/settings/billing/ai_credit/usage?year=2025&month=6
Accept: application/vnd.github+json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>
```

## References
- GitHub Docs: <https://docs.github.com/en/rest/billing/usage?apiVersion=2026-03-10#get-billing-ai-credit-usage-report-for-an-organization>
