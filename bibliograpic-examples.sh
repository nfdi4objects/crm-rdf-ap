#!/usr/bin/bash

# get sample bibliographic data from diverse sources

# Crossref
curl -s -L -H "Accept: text/turtle" "https://doi.org/10.1126/science.1157784" > examples/crossref.ttl

# Zenodo
curl -s https://zenodo.org/records/10971391/export/json-ld | npm run -s jsonld2rdf > examples/zenodo.ttl

# Zotero
curl -s 'https://api.zotero.org/groups/4673379/items?format=rdf_bibliontology&limit=5' > examples/zotero-bibo.rdf
curl -s 'https://api.zotero.org/groups/4673379/items?format=rdf_dc&limit=5' > examples/zotero-dc.rdf
curl -s 'https://api.zotero.org/groups/4673379/items?format=rdf_zotero&limit=5' > examples/zotero-zotero.rdf
