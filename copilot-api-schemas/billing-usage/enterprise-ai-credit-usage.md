# Get Billing AI Credit Usage Report for an Enterprise

**Method(s):** `GET`  
**Path:** `/enterprises/{enterprise}/settings/billing/ai_credit/usage`  
**API Version:** `2026-03-10`  
**Category:** Billing Usage  
**Level:** Enterprise

## Description
Gets a report of AI credit usage for an enterprise. Use this endpoint to inspect billed AI credit consumption by time period, organization, user, model, product, or cost center.

## Required Permissions
Classic PAT or OAuth app scopes:

- `manage_billing:copilot` **or**
- `admin:enterprise`

## Parameters

### Path Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `enterprise` | string | Yes | The enterprise slug. |

### Query Parameters
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `year` | integer | No | Return results for a single year. Defaults to the current year. |
| `month` | integer | No | Return results for a single month. Defaults to the current month. |
| `day` | integer | No | Return results for a single day. Defaults to the current day within the selected month/year. |
| `organization` | string | No | Filter by organization name (case-insensitive). |
| `user` | string | No | Filter by GitHub username (case-insensitive). |
| `model` | string | No | Filter by model name (case-insensitive). |
| `product` | string | No | Filter by product name (case-insensitive). |
| `cost_center_id` | string | No | Filter by cost center ID. Use `none` to target usage not associated with a cost center. |

## HTTP Status Codes
| Code | Meaning |
| --- | --- |
| `200` | AI credit usage report returned successfully. |
| `400` | Bad request. |
| `403` | Caller lacks permissions to view enterprise billing usage. |
| `404` | Enterprise or billing usage resource not found. |
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
  "enterprise": "acme-enterprise",
  "user": "octocat",
  "organization": "platform",
  "product": "copilot",
  "model": "gpt-4.1",
  "costCenter": {
    "id": "cost-center-123",
    "name": "Engineering"
  },
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
GET https://api.github.com/enterprises/acme-enterprise/settings/billing/ai_credit/usage?year=2025&month=6
Accept: application/vnd.github+json
X-GitHub-Api-Version: 2026-03-10
Authorization: Bearer <token>
```

## References
- GitHub Docs: <https://docs.github.com/en/enterprise-cloud@latest/rest/billing/usage?apiVersion=2026-03-10#get-billing-ai-credit-usage-report-for-an-enterprise>
