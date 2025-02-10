import { dataFactory as RDF } from "rdffilter"

export default ({subject, predicate, object}) => {
  if (object.termType === "Literal" && (object.language || "en") != "en") return false
  if (predicate.value === "http://www.w3.org/2000/01/rdf-schema#comment") return false
  if (subject.value === "http://www.w3.org/2008/05/skos" || subject.value === "http://purl.org/ontology/bibo/" || subject.value === "http://www.opengis.net/ont/geosparql") return false
  if (predicate.value === "http://www.w3.org/2000/01/rdf-schema#label" && object.termType === "Literal") {
    const m = subject.value.match("^http://www.cidoc-crm.org/cidoc-crm/([EP][0-9]+i?)")
    if (m) {
      object = RDF.literal(`${m[1]} ${object.value}`)
      return RDF.quad(subject, predicate, object)
    }
  }
  if (predicate.value === "http://www.w3.org/1999/02/22-rdf-syntax-ns#type" && object.value === "http://www.w3.org/2000/01/rdf-schema#Class") {
    return RDF.quad(subject, predicate, RDF.namedNode("http://www.w3.org/2002/07/owl#Class"))
  }
  return true
}
