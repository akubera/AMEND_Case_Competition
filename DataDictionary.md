Amend Case Competition

Data Dictionary
===============

Metal Working Group's fiscal year begins in October and finishes in September. Each record
represents a job completed for a customer.

|   Name   | Type  |  Description                                       |    Values   |
|----------|-------|----------------------------------------------------|-------------|
|ID number |       |                                                    |             |
|Ftype     |String |                                                    |STK = "Stock"|
|Fkey      |int    |                                                    |             |
|fqtyrequir|int    |Quantity of parts ordered in this job               |             |
|fqtycomple|int    |Quantity of parts manufactured for this job         |             |
|fqtyshippe|int    |Quantity of parts shipped for this job              |             |
|fqtybackor|int    |Quantity on back order (incomplete)                 |             |
|fshipdate |date   |Date of shipment                                    |             |
|fsono     |int    |Sales Number                                        |             |
|fpartno   |string |Unique part number for identification               |             |
|frev      |string |Part revision                                       |             |
|fshipno   |string |Unique shipment number for identification           |             |
|fprice    |number |Price charged to customer (revenue made)            |             |
|faccumulat|int    |Total Cost for Job: Quantity Shipped * Cost per Part|             |
|factgross |number |"Profit Margin for job: (Revenue - Cost) / Revenue" |             |
|refcost   |number |Cost per part                                       |             |
|custcode  |string |Customer Code                                       |             |
