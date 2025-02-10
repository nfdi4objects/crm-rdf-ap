default:
	quarto preview

docs:
	quarto render

ontology: crm-rdf-ap.html

crm-rdf-ap.html: crm-rdf-ap.ttl
	python -m venv .venv
	.venv/bin/pip install pylode
	.venv/bin/pylode $< -o $@

crm-rdf-ap.ttl: about.rdf cidoc-crm.rdf skos.rdf geo.ttl bibo.ttl time.ttl
	(ls $^ | xargs -n 1 rapper -g -q) | npm run --silent rdffilter > $@

