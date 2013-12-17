###################################
#  Parse XML-file to Naiada-code  # 
#  Koi edition                    #
###################################

import xml.etree.ElementTree as ET
import os
import sys

tab = ""
prev = ""
primitives = {}
constants = {}
declared = {}
variables = {}

def body(parent):
    global tab, f, prev

    for i, x in enumerate(parent.getchildren()):

        tab += "   "

        if x.tag == 'label':
            f.write('\n' + tab + '<< ' + x.get('name') + ' >>\n')
        elif x.tag == 'branch':
            f.write(tab + 'if ' + x.get('input') + ' then\n')
            body(x)
            f.write(tab + 'end if;\n')
        elif x.tag == 'run':
            f.write(tab + x.get('primitive') + '(')
            prev = x.get('name')
            body(x)
            f.write(');\n')
        elif x.tag == 'input':
            if x.get('value') in variables:
                f.write(' ' + x.get('value'))
            elif x.get('value') in constants:
                f.write(' ' + constants[x.get('value')])
            else:
                f.write(' ' + prev + '_' + x.get('name'))
            
            if not len(parent.getchildren()) == i + 1:
                f.write(',')
        elif x.tag == 'output':
            if x.get('value') in variables:
                f.write(' access(' + x.get('value') + ')')
            else:
                f.write(' access(' + prev + '_' + x.get('name') + ')')
            
            if not len(parent.getchildren()) == i + 1:
                f.write(',')
        elif x.tag == 'true':
            body(x)
        elif x.tag == 'false':
            f.write(tab[:-3] + 'else\n')
            body(x)
        elif x.tag =='goto':
            f.write(tab + 'goto ' + x.get('label') + ';\n')
        elif x.tag =='set':
            if x.get('variable') in variables:
                f.write('   ' + x.get('variable') + ' := ')
                if x.get('value') in constants:
                    f.write(constants[x.get('value')] + ';\n')
                else:
                    f.write(x.get('value') + ';\n')
            else:
                sys.stderr.write("ERROR: Variable" + x.get('variable') + "does not exist!")

        tab = tab[:-3]

def readParametersFromFile(src):
    infile = open('../src/' + src, 'r')
    parameters = []

    for line in infile:
        if ': in ' in line:
            parameters.append(line)
        elif ': out ' in line:
            parameters.append(line)

    infile.close()

    return parameters

success = True

def validate(parent):
    global prev, success, tab

    tab += "   "

    for i, x in enumerate(parent.getchildren()):

        if x.tag == 'branch':
            validate(x)
        elif x.tag == 'run':
            prev = x.get('name')
            validate(x)
        elif x.tag == 'input':
            parameters = readParametersFromFile(primitives[parent.get('primitive')])

            if x.get('type') not in parameters[i]:
                sys.stderr.write('Wrong type for parameter in procedure call to ' + parent.get('primitive') + ', found ' + x.get('type'))
                success = False
            if ': in ' not in parameters[i]:
                sys.stderr.write('Expected input, found output in procedure call to ' + parent.get('primitive'))
                success = False
        elif x.tag == 'output':
            parameters = readParametersFromFile(primitives[parent.get('primitive')])

            if x.get('type') not in parameters[i]:
                sys.stderr.write('Wrong type for parameter in procedure call to ' + parent.get('primitive') + ', found ' + x.get('type'))
                success = False
            if ': out ' not in parameters[i]:
                sys.stderr.write('Expected output, found input in procedure call to ' + parent.get('primitive'))
                success = False
        elif x.tag == 'true':
            validate(x)
        elif x.tag == 'false':
            validate(x)
        #elif x.tag == 'label':
            #print tab + x.get('name')
            
    tab = tab[:-3]

    return success

def getPrimitives(parent):
    global f
    
    for x in parent.getchildren():
        if x.tag == 'primitive':
            infile = open('../src/' + x.get('src'), 'r')
            for line in infile:
                f.write(line)

            f.write('\n\n')
            primitives[x.get('name')] = x.get('src')
            infile.close()

def getConstants(parent):
    global constants, variables
    
    for x in parent.getchildren():
        if x.tag == 'constant':
            constants[x.get('name')] = x.get('value')
        elif x.tag == 'variable':
            variables[x.get('name')] = x.get('type')

def declaration(parent):
    global tab, f, prev, declared

    for x in parent.getchildren():

        tab = "   "

        if x.tag == 'branch':
            declaration(x)
        elif x.tag == 'run':
            prev = x.get('name')
            declaration(x)
            f.write('')
        elif x.tag == 'input' or x.tag == 'output':
            if (prev + '_' + x.get('name')) not in declared:
                if x.tag == 'output':
                    f.write(tab + prev + '_' + x.get('name') + ' : ' + x.get('type') + ';\n')
                declared[prev + '_' + x.get('name')] = x.get('type')            
        elif x.tag == 'true':
            declaration(x)
        elif x.tag == 'false':
            declaration(x)

def initialize(parent):
    global tab, f, prev

    for x in parent.getchildren():

        tab = "   "

        if x.tag == 'branch':
            initialize(x)
        elif x.tag == 'run':
            prev = x.get('name')
            initialize(x)
            f.write('')
        #elif x.tag == 'input':
        #    if len(x.get('value')) > 0:
        #        if x.get('value') in constants:
        #            f.write(tab + prev + '_' + x.get('name') + ' := ' + constants[x.get('value')] + ';\n')
        #        else:
        #            f.write(tab + prev + '_' + x.get('name') + ' := ' + x.get('value') + ';\n')
        #            
        elif x.tag == 'true':
            initialize(x)
        elif x.tag == 'false':
            initialize(x)

        tab = ""        

def main():
    global f, variables

    # Check if file exists and cmd in right format
    if len(sys.argv) == 2:
        if os.path.exists(sys.argv[1]):
            tree = ET.parse(sys.argv[1])
        else:
            sys.stderr.write("ERROR: File " + sys.argv[1] + "does not exist!")
            os._exit(1)
    else:
        sys.stderr.write("ERROR: Wrong format! \nUse: $python pyXML.py path-to-xml-file")
        os._exit(2)
        
    root = tree.getroot()
    seq = root.find('sequence')

    if 'name' in root.find('program').attrib:
        f = open('../debug/src/' + root.find('program').get('name'), 'w+')
    else:
        sys.stderr.write("ERROR: XML lacks program name!")
        sys.exit()

    # Add primitives
    getPrimitives(root)

    # Constants - initial values
    getConstants(root)

    f.write('procedure main is\n\n')

    # Declaration part
    for name, type in variables.iteritems():
        f.write('   ' + name + ' : ' + type + ';\n')
    declaration(seq)

    f.write('begin\n')

    # Initializing the declared variables
    initialize(seq)

    # Creating the body
    body(seq)

    f.write('\nend main;')    
    f.close()

    tab = ""
    
    # Validate sequence
    if not validate(seq):
        sys.stderr.write("\nERROR: could not validate primitive")
    else:
        sys.stdout.write(root.find('program').get('name'))


main()
                    
