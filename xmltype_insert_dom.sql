/* How ADD Child XMLTYPE block insert in DOM */

declare 
  doc DBMS_XMLDOM.DOMDocument;
  root dbms_xmldom.DOMNode;
  toto_node dbms_xmldom.DOMNode;
  v_xml xmltype := xmltype('<a><b>bbbb</b><c>ccccc</c></a>') ;
  childDoc  DBMS_XMLDOM.DOMDocument;
  childDocElement   DBMS_XMLDOM.DOMELEMENT;
begin 
doc := DBMS_XMLDOM.newDOMDocument;

DBMS_XMLDOM.setVersion(doc, '1.0');
DBMS_XMLDOM.setcharset(doc, 'ISO-8859-15');
root := DBMS_XMLDOM.makeNode(doc);
toto_node := DBMS_XMLDOM.appendChild(root, DBMS_XMLDOM.makeNode(DBMS_XMLDOM.createElement(doc, 'toto1')));
childDoc  := DBMS_XMLDOM.NEWDOMDOCUMENT(v_xml);
childDocElement      := DBMS_XMLDOM.getDocumentElement(childDoc);
childDocElement      := DBMS_XMLDOM.makeElement(DBMS_XMLDOM.importNode(doc,DBMS_XMLDOM.makeNode(childDocElement),TRUE));

root := DBMS_XMLDOM.appendChild(toto_node,DBMS_XMLDOM.makeNode(childDocElement));
dbms_output.put_line(DBMS_XMLDOM.GETXMLTYPE(doc).getClobVal());
end; 
