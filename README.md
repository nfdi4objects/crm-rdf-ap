# Application profile of CIDOC-CRM in RDF

This repository contains some guidelines how to best use CIDOC-CRM in RDF. It is work in progress.

## Motivation

CRM classes and properties do not fully map to RDF classes and properties. CRM is not an ontology by an *abstract data model*.

## CRM Classes to avoid

## CRM Classes to use with caution

### E42 Identifier

Don't use E42_Identifier for identifier for URIs. So use

~~~ttl
<something> crm:P1_is_identified_by <http://example.org/> .
~~~

instead of 

~~~ttl
<something> crm:P1_is_identified_by [ a crm:E42_Identifier ;  crm:P90_has_value "http://example.org/" ] .
~~~

## License

All of this repository can be used freely (CC0). Reference would be nice, nevertheless.
