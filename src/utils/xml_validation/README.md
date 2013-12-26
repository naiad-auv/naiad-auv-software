XML Validator for Mission Control System programming language "Naiada"
======================================================================
Not really a validator but more of a specification (XML schema, XSD) for the
naiada programming language which is used as intermediate language from the IDE
to the compiler which compiles virtualmachine readable code.

On Ubuntu to validate your generated XML file including a Mission type the
following:

    xmllint --schema naiada-schema.xsd --noout <xml_file.xml>
