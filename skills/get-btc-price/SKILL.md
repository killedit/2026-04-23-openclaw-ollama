---
name: get-btc-price
description: Fetches the current Bitcoin price in USD using the Coinbase API
metadata:
  openclaw:
    requires:
      bins: [curl]
---

# Skill: get-btc-price
## Description
Fetches the current Bitcoin price in USD using the public Coinbase API.

## When to Use
- User asks: "What is the Bitcoin price?"
- User asks: "BTC price?"
- User asks: "Current Bitcoin price in USD?"
- Any request for current BTC/USD price

## How to Use
Use the `exec` tool to run:

```bash
curl -s https://api.coinbase.com/v2/prices/BTC-USD/spot
```

Extract the `amount` value from the JSON response and return it as: **The current Bitcoin price is $X**, where X is the amount.

## Example Response
```json
{"data":{"amount":"80759.165","base":"BTC","currency":"USD"}}
```

Return: "The current Bitcoin price is $80,759.17"