/* $Id: trac42.h 10 2007-10-25 15:31:33Z csg $
   FILE:        trac42.h
   CONTENTS:    trac42.h - This file contains defines for operators, types & type definitions of yylval types,
                           and for types in the trac42c generator
   REVISION:    1.0, 960917, Christer Eriksson & Jukka M„ki-Turja
   DESCRIPTION: Various defines and type definitons
*/
#ifndef _TRAC42__H_
#define _TRAC42__H_

/* These data types are shared between the scanner and the parser.
   Each of them contains all necessary information for the scanner to pass to the
   parser on the parse stack. */

/* The attribute of an integer token. */
typedef struct {
  int lineNr;
  int intVal;
} intStruct;

/* The attribute of the string and id tokens. */
typedef struct {
  int lineNr;
  char *strVal;
} stringStruct;

/* The attribute of a type name token. */
typedef struct {
  int lineNr;
  eType type;
} typeStruct;

/* The attribute of an operator token. */
typedef struct {
  int lineNr;
  int opType;
} opStruct;

#endif

