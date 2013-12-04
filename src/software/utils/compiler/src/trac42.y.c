/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.5"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 268 of yacc.c  */
#line 15 "./src/trac42.y"

#include <stdio.h>
#include <malloc.h>
#include <stddef.h>
#include <string.h>
#include "ast.h"        /* Data structures and constructors for the AST */
#include "trac42.h"     /* Various definitions */
#include "symtab.h"
#include "emit.h"
#include "trac42.y.h"   /* Declaration of tokens, genereated by bison. */
#include "gentrac42.h"
#include "name.h"
#include "types.h"
#include "offset.h"
//#include "gensmc.h"

extern FILE *yyin;
int yyerror(const char *s);
int yylex(void);



/* Line 268 of yacc.c  */
#line 94 "./src/trac42.y.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     OROP = 258,
     ANDOP = 259,
     EQOP = 260,
     MEMTOP = 261,
     LELTOP = 262,
     PLUSOP = 263,
     MINUSOP = 264,
     MULDIVOP = 265,
     VECOP = 266,
     UNOP = 267,
     NOTOP = 268,
     BASIC_TYPE = 269,
     ID = 270,
     BOOL_CONST = 271,
     STRING_CONST = 272,
     INT_CONST = 273,
     FLOAT_CONST = 274,
     IF = 275,
     THEN = 276,
     ELSE = 277,
     WHILE = 278,
     RETURN = 279,
     END = 280,
     EXIT = 281,
     LOOP = 282,
     PROCEDURE = 283,
     FUNCTION = 284,
     IS = 285,
     BGN = 286,
     ASSIGN = 287,
     ASM = 288
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 293 of yacc.c  */
#line 37 "./src/trac42.y"

   t_tree       yyNode;
   floatStruct  yyFloat;
   intStruct    yyInt;
   stringStruct yyString;
   typeStruct   yyType;
   opStruct     yyOperator;
   int          yyLineNr;



/* Line 293 of yacc.c  */
#line 175 "./src/trac42.y.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 343 of yacc.c  */
#line 187 "./src/trac42.y.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  8
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   362

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  41
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  14
/* YYNRULES -- Number of rules.  */
#define YYNRULES  52
/* YYNRULES -- Number of states.  */
#define YYNSTATES  178

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   288

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      34,    35,     2,     2,    39,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    37,    36,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    38,     2,    40,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,     5,     8,    10,    23,    33,    48,    60,
      64,    66,    70,    73,    74,    79,    82,    84,    89,    95,
     103,   113,   121,   125,   128,   134,   140,   143,   146,   149,
     154,   158,   162,   166,   170,   174,   178,   182,   186,   190,
     194,   199,   201,   203,   205,   207,   215,   241,   244,   246,
     248,   249,   253
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      42,     0,    -1,    43,    -1,    43,    44,    -1,    44,    -1,
      28,    15,    34,    45,    35,    30,    47,    31,    49,    25,
      15,    36,    -1,    28,    15,    30,    47,    31,    49,    25,
      15,    36,    -1,    29,    15,    34,    45,    35,    24,    14,
      30,    47,    31,    49,    25,    15,    36,    -1,    29,    15,
      24,    14,    30,    47,    31,    49,    25,    15,    36,    -1,
      45,    36,    46,    -1,    46,    -1,    15,    37,    14,    -1,
      47,    48,    -1,    -1,    15,    37,    14,    36,    -1,    49,
      50,    -1,    50,    -1,    15,    32,    51,    36,    -1,    33,
      34,    17,    35,    36,    -1,    20,    51,    21,    49,    25,
      20,    36,    -1,    20,    51,    21,    49,    22,    49,    25,
      20,    36,    -1,    23,    51,    27,    49,    25,    27,    36,
      -1,    24,    51,    36,    -1,    24,    36,    -1,    15,    34,
      53,    35,    36,    -1,    27,    49,    25,    27,    36,    -1,
      26,    36,    -1,     9,    51,    -1,    13,    51,    -1,    14,
      34,    51,    35,    -1,    51,     8,    51,    -1,    51,     9,
      51,    -1,    51,    10,    51,    -1,    51,    11,    51,    -1,
      51,     4,    51,    -1,    51,     3,    51,    -1,    51,     5,
      51,    -1,    51,     7,    51,    -1,    51,     6,    51,    -1,
      34,    51,    35,    -1,    15,    34,    53,    35,    -1,    15,
      -1,    18,    -1,    16,    -1,    19,    -1,    38,    52,    39,
      52,    39,    52,    40,    -1,    38,    38,    52,    39,    52,
      39,    52,    40,    39,    38,    52,    39,    52,    39,    52,
      40,    39,    38,    52,    39,    52,    39,    52,    40,    40,
      -1,     9,    19,    -1,    19,    -1,    54,    -1,    -1,    54,
      39,    51,    -1,    51,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    74,    74,    77,    78,    81,    82,    83,    84,    88,
      89,    92,    95,    96,    99,   103,   104,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,   134,   135,   136,   137,   138,   146,   147,   150,
     151,   154,   155
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "OROP", "ANDOP", "EQOP", "MEMTOP",
  "LELTOP", "PLUSOP", "MINUSOP", "MULDIVOP", "VECOP", "UNOP", "NOTOP",
  "BASIC_TYPE", "ID", "BOOL_CONST", "STRING_CONST", "INT_CONST",
  "FLOAT_CONST", "IF", "THEN", "ELSE", "WHILE", "RETURN", "END", "EXIT",
  "LOOP", "PROCEDURE", "FUNCTION", "IS", "BGN", "ASSIGN", "ASM", "'('",
  "')'", "';'", "':'", "'['", "','", "']'", "$accept", "program",
  "functions", "function", "formals", "formal", "decls", "decl", "stmnts",
  "stmnt", "expr", "vec_comp", "actuals", "exprs", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,    40,    41,    59,    58,    91,    44,
      93
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    41,    42,    43,    43,    44,    44,    44,    44,    45,
      45,    46,    47,    47,    48,    49,    49,    50,    50,    50,
      50,    50,    50,    50,    50,    50,    50,    51,    51,    51,
      51,    51,    51,    51,    51,    51,    51,    51,    51,    51,
      51,    51,    51,    51,    51,    51,    51,    52,    52,    53,
      53,    54,    54
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,    12,     9,    14,    11,     3,
       1,     3,     2,     0,     4,     2,     1,     4,     5,     7,
       9,     7,     3,     2,     5,     5,     2,     2,     2,     4,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       4,     1,     1,     1,     1,     7,    25,     2,     1,     1,
       0,     3,     1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     2,     4,     0,     0,     1,     3,
      13,     0,     0,     0,     0,     0,     0,    10,     0,     0,
       0,     0,    12,     0,     0,     0,    13,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    16,    11,    13,
       9,     0,     0,     0,     0,    50,     0,     0,     0,    41,
      43,    42,    44,     0,     0,     0,     0,    23,     0,    26,
       0,     0,     0,    15,     0,     0,     0,    14,     0,    52,
       0,    49,    27,    28,     0,    50,     0,     0,    48,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    22,     0,     0,     0,     0,     0,    13,    17,
       0,     0,     0,     0,    39,    47,     0,     0,    35,    34,
      36,    38,    37,    30,    31,    32,    33,     0,     0,     0,
       0,     6,     0,     0,     0,    24,    51,    29,    40,     0,
       0,     0,     0,     0,    25,    18,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,     0,     0,     0,     0,
      19,    21,     5,     0,     0,    45,     0,     0,     0,    20,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    46
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     3,     4,     5,    16,    17,    14,    22,    36,    37,
      69,    80,    70,    71
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -73
static const yytype_int16 yypact[] =
{
     -23,    10,    14,     9,   -23,   -73,   -26,    29,   -73,   -73,
     -73,    16,    20,    16,    -5,    30,    48,   -73,    17,    52,
      34,   312,   -73,    51,    50,    16,   -73,    61,    75,    28,
     156,   156,    36,    55,   312,    59,   214,   -73,   -73,   -73,
     -73,    -4,    87,    71,   156,   156,   156,   156,    74,    79,
     -73,   -73,   -73,   156,    -6,   198,   173,   -73,    12,   -73,
     228,    97,   100,   -73,    -3,   312,    86,   -73,    33,   343,
      82,    80,   -73,   -73,   156,   156,   120,   101,   -73,    47,
      83,   156,   156,   156,   156,   156,   156,   156,   156,   156,
     312,   312,   -73,    94,   132,   137,   312,   242,   -73,   -73,
     149,   156,   153,   133,   -73,   -73,   147,    47,   351,   127,
     134,    68,    68,    93,    93,   176,   -73,   200,   256,   155,
     157,   -73,   270,   174,    15,   -73,   343,   -73,   -73,    47,
     158,   312,   172,   168,   -73,   -73,   181,   162,   312,   160,
      47,   284,   175,   177,   178,   -73,   298,    47,   170,   192,
     -73,   -73,   -73,   201,   188,   -73,   182,   185,   191,   -73,
     -73,   179,    47,   193,    47,   196,    47,   202,   197,   206,
      47,   207,    47,   210,    47,   205,   216,   -73
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -73,   -73,   -73,   227,   237,   233,   -25,   -73,   -32,   -36,
      65,   -72,   184,   -73
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      63,    41,    60,    77,    10,     1,     2,   106,    11,     8,
      20,    20,    20,    78,    64,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    63,     6,    21,    65,    96,     7,
      20,    15,    79,    97,    18,   130,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    46,   138,    26,    92,    47,
      48,    49,    50,    12,    51,    52,    77,   139,   117,   118,
      44,    63,    45,    13,   122,    38,    78,    23,   148,    99,
      53,    28,    57,   124,    54,   154,    86,    87,    88,    89,
      39,    63,    63,    24,    25,    42,    63,    27,    25,    43,
     163,    59,   165,    61,   167,    55,    56,    58,   171,   141,
     173,    66,   175,    88,    89,    63,   146,    67,    74,    68,
      63,    72,    73,    75,    94,    95,    98,   100,    76,   101,
     105,   119,   107,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    83,    84,    85,    86,    87,    88,    89,   102,
      84,    85,    86,    87,    88,    89,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   104,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    46,   126,   120,   128,    47,
      48,    49,    50,   121,    51,    52,    81,    82,    83,    84,
      85,    86,    87,    88,    89,   125,   129,    89,   127,   137,
      53,   134,   142,   135,    54,   143,   144,   140,   145,   147,
      91,    81,    82,    83,    84,    85,    86,    87,    88,    89,
     155,   150,   156,   151,   152,    29,   157,   162,   159,    90,
      30,   160,   131,    31,    32,   132,    33,    34,   158,    29,
     161,     9,   164,    35,    30,   166,   169,    31,    32,    62,
      33,    34,   168,    29,   170,   176,   172,    35,    30,   174,
      19,    31,    32,    93,    33,    34,   177,    29,    40,   103,
       0,    35,    30,     0,     0,    31,    32,   123,    33,    34,
       0,    29,     0,     0,     0,    35,    30,     0,     0,    31,
      32,   133,    33,    34,     0,    29,     0,     0,     0,    35,
      30,     0,     0,    31,    32,   136,    33,    34,     0,    29,
       0,     0,     0,    35,    30,     0,     0,    31,    32,   149,
      33,    34,     0,    29,     0,     0,     0,    35,    30,     0,
       0,    31,    32,   153,    33,    34,     0,    29,     0,     0,
       0,    35,    30,     0,     0,    31,    32,     0,    33,    34,
       0,     0,     0,     0,     0,    35,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    82,    83,    84,    85,    86,
      87,    88,    89
};

#define yypact_value_is_default(yystate) \
  ((yystate) == (-73))

#define yytable_value_is_error(yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
      36,    26,    34,     9,    30,    28,    29,    79,    34,     0,
      15,    15,    15,    19,    39,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    60,    15,    31,    31,    31,    15,
      15,    15,    38,    65,    14,   107,     3,     4,     5,     6,
       7,     8,     9,    10,    11,     9,    31,    30,    36,    13,
      14,    15,    16,    24,    18,    19,     9,   129,    90,    91,
      32,    97,    34,    34,    96,    14,    19,    37,   140,    36,
      34,    37,    36,    98,    38,   147,     8,     9,    10,    11,
      30,   117,   118,    35,    36,    24,   122,    35,    36,    14,
     162,    36,   164,    34,   166,    30,    31,    32,   170,   131,
     172,    14,   174,    10,    11,   141,   138,    36,    34,    44,
     146,    46,    47,    34,    17,    15,    30,    35,    53,    39,
      19,    27,    39,     3,     4,     5,     6,     7,     8,     9,
      10,    11,     5,     6,     7,     8,     9,    10,    11,    74,
       6,     7,     8,     9,    10,    11,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    35,     3,     4,     5,     6,
       7,     8,     9,    10,    11,     9,   101,    35,    35,    13,
      14,    15,    16,    36,    18,    19,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    36,    39,    11,    35,    15,
      34,    36,    20,    36,    38,    27,    15,    39,    36,    39,
      27,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      40,    36,    20,    36,    36,    15,    15,    38,    36,    21,
      20,    36,    22,    23,    24,    25,    26,    27,    40,    15,
      39,     4,    39,    33,    20,    39,    39,    23,    24,    25,
      26,    27,    40,    15,    38,    40,    39,    33,    20,    39,
      13,    23,    24,    25,    26,    27,    40,    15,    25,    75,
      -1,    33,    20,    -1,    -1,    23,    24,    25,    26,    27,
      -1,    15,    -1,    -1,    -1,    33,    20,    -1,    -1,    23,
      24,    25,    26,    27,    -1,    15,    -1,    -1,    -1,    33,
      20,    -1,    -1,    23,    24,    25,    26,    27,    -1,    15,
      -1,    -1,    -1,    33,    20,    -1,    -1,    23,    24,    25,
      26,    27,    -1,    15,    -1,    -1,    -1,    33,    20,    -1,
      -1,    23,    24,    25,    26,    27,    -1,    15,    -1,    -1,
      -1,    33,    20,    -1,    -1,    23,    24,    -1,    26,    27,
      -1,    -1,    -1,    -1,    -1,    33,     3,     4,     5,     6,
       7,     8,     9,    10,    11,     4,     5,     6,     7,     8,
       9,    10,    11
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    28,    29,    42,    43,    44,    15,    15,     0,    44,
      30,    34,    24,    34,    47,    15,    45,    46,    14,    45,
      15,    31,    48,    37,    35,    36,    30,    35,    37,    15,
      20,    23,    24,    26,    27,    33,    49,    50,    14,    30,
      46,    47,    24,    14,    32,    34,     9,    13,    14,    15,
      16,    18,    19,    34,    38,    51,    51,    36,    51,    36,
      49,    34,    25,    50,    47,    31,    14,    36,    51,    51,
      53,    54,    51,    51,    34,    34,    51,     9,    19,    38,
      52,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      21,    27,    36,    25,    17,    15,    31,    49,    30,    36,
      35,    39,    51,    53,    35,    19,    52,    39,    51,    51,
      51,    51,    51,    51,    51,    51,    51,    49,    49,    27,
      35,    36,    49,    25,    47,    36,    51,    35,    35,    39,
      52,    22,    25,    25,    36,    36,    25,    15,    31,    52,
      39,    49,    20,    27,    15,    36,    49,    39,    52,    25,
      36,    36,    36,    25,    52,    40,    20,    15,    40,    36,
      36,    39,    38,    52,    39,    52,    39,    52,    40,    39,
      38,    52,    39,    52,    39,    52,    40,    40
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* This macro is provided for backward compatibility. */

#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  YYSIZE_T yysize1;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = 0;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
                if (! (yysize <= yysize1
                       && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                  return 2;
                yysize = yysize1;
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  yysize1 = yysize + yystrlen (yyformat);
  if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
    return 2;
  yysize = yysize1;

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1806 of yacc.c  */
#line 74 "./src/trac42.y"
    { treeRoot = mProgram((yyvsp[(1) - (1)].yyNode)); }
    break;

  case 3:

/* Line 1806 of yacc.c  */
#line 77 "./src/trac42.y"
    { (yyval.yyNode) = connectFunctions((yyvsp[(1) - (2)].yyNode),(yyvsp[(2) - (2)].yyNode)); }
    break;

  case 4:

/* Line 1806 of yacc.c  */
#line 78 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 5:

/* Line 1806 of yacc.c  */
#line 81 "./src/trac42.y"
    { (yyval.yyNode) = mFunction(connectVariables((yyvsp[(4) - (12)].yyNode), (yyvsp[(7) - (12)].yyNode)), (yyvsp[(9) - (12)].yyNode), (yyvsp[(2) - (12)].yyString).strVal, VOID, (yyvsp[(2) - (12)].yyString).lineNr); }
    break;

  case 6:

/* Line 1806 of yacc.c  */
#line 82 "./src/trac42.y"
    { (yyval.yyNode) = mFunction((yyvsp[(4) - (9)].yyNode), (yyvsp[(6) - (9)].yyNode), (yyvsp[(2) - (9)].yyString).strVal, VOID, (yyvsp[(2) - (9)].yyString).lineNr); }
    break;

  case 7:

/* Line 1806 of yacc.c  */
#line 83 "./src/trac42.y"
    { (yyval.yyNode) = mFunction(connectVariables((yyvsp[(4) - (14)].yyNode), (yyvsp[(9) - (14)].yyNode)), (yyvsp[(11) - (14)].yyNode), (yyvsp[(2) - (14)].yyString).strVal, (yyvsp[(7) - (14)].yyType).type, (yyvsp[(2) - (14)].yyString).lineNr); }
    break;

  case 8:

/* Line 1806 of yacc.c  */
#line 84 "./src/trac42.y"
    { (yyval.yyNode) = mFunction((yyvsp[(6) - (11)].yyNode), (yyvsp[(8) - (11)].yyNode), (yyvsp[(2) - (11)].yyString).strVal, (yyvsp[(4) - (11)].yyType).type, (yyvsp[(2) - (11)].yyString).lineNr); }
    break;

  case 9:

/* Line 1806 of yacc.c  */
#line 88 "./src/trac42.y"
    { (yyval.yyNode) = connectVariables((yyvsp[(1) - (3)].yyNode),(yyvsp[(3) - (3)].yyNode)); }
    break;

  case 10:

/* Line 1806 of yacc.c  */
#line 89 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 11:

/* Line 1806 of yacc.c  */
#line 92 "./src/trac42.y"
    { (yyval.yyNode) = mVariable(kFormal, (yyvsp[(1) - (3)].yyString).strVal, (yyvsp[(3) - (3)].yyType).type, (yyvsp[(1) - (3)].yyString).lineNr); }
    break;

  case 12:

/* Line 1806 of yacc.c  */
#line 95 "./src/trac42.y"
    { if ((yyvsp[(1) - (2)].yyNode) != NULL) { (yyval.yyNode) = connectVariables((yyvsp[(1) - (2)].yyNode), (yyvsp[(2) - (2)].yyNode)); } else { (yyval.yyNode) = (yyvsp[(2) - (2)].yyNode); } }
    break;

  case 13:

/* Line 1806 of yacc.c  */
#line 96 "./src/trac42.y"
    { (yyval.yyNode) = NULL; }
    break;

  case 14:

/* Line 1806 of yacc.c  */
#line 99 "./src/trac42.y"
    { (yyval.yyNode) = mVariable(kLocal, (yyvsp[(1) - (4)].yyString).strVal, (yyvsp[(3) - (4)].yyType).type, (yyvsp[(1) - (4)].yyString).lineNr); }
    break;

  case 15:

/* Line 1806 of yacc.c  */
#line 103 "./src/trac42.y"
    { (yyval.yyNode) = connectStmnts((yyvsp[(1) - (2)].yyNode),(yyvsp[(2) - (2)].yyNode)); }
    break;

  case 16:

/* Line 1806 of yacc.c  */
#line 104 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 17:

/* Line 1806 of yacc.c  */
#line 107 "./src/trac42.y"
    { (yyval.yyNode) = mAssign((yyvsp[(1) - (4)].yyString).strVal, (yyvsp[(3) - (4)].yyNode), (yyvsp[(1) - (4)].yyString).lineNr); }
    break;

  case 18:

/* Line 1806 of yacc.c  */
#line 108 "./src/trac42.y"
    { (yyval.yyNode) = mAsm((yyvsp[(3) - (5)].yyString).strVal, (yyvsp[(1) - (5)].yyLineNr)); }
    break;

  case 19:

/* Line 1806 of yacc.c  */
#line 109 "./src/trac42.y"
    { (yyval.yyNode) = mIf((yyvsp[(2) - (7)].yyNode), (yyvsp[(4) - (7)].yyNode), NULL, (yyvsp[(1) - (7)].yyLineNr)); }
    break;

  case 20:

/* Line 1806 of yacc.c  */
#line 110 "./src/trac42.y"
    { (yyval.yyNode) = mIf((yyvsp[(2) - (9)].yyNode), (yyvsp[(4) - (9)].yyNode), (yyvsp[(6) - (9)].yyNode), (yyvsp[(1) - (9)].yyLineNr)); }
    break;

  case 21:

/* Line 1806 of yacc.c  */
#line 111 "./src/trac42.y"
    { (yyval.yyNode) = mWhile((yyvsp[(2) - (7)].yyNode), (yyvsp[(4) - (7)].yyNode), (yyvsp[(1) - (7)].yyLineNr)); }
    break;

  case 22:

/* Line 1806 of yacc.c  */
#line 112 "./src/trac42.y"
    { (yyval.yyNode) = mReturn((yyvsp[(2) - (3)].yyNode), (yyvsp[(1) - (3)].yyLineNr)); }
    break;

  case 23:

/* Line 1806 of yacc.c  */
#line 113 "./src/trac42.y"
    { (yyval.yyNode) = mReturn(NULL, (yyvsp[(1) - (2)].yyLineNr)); }
    break;

  case 24:

/* Line 1806 of yacc.c  */
#line 114 "./src/trac42.y"
    { (yyval.yyNode) = mFuncCallStmnt((yyvsp[(3) - (5)].yyNode), (yyvsp[(1) - (5)].yyString).strVal, (yyvsp[(1) - (5)].yyString).lineNr); }
    break;

  case 25:

/* Line 1806 of yacc.c  */
#line 115 "./src/trac42.y"
    { (yyval.yyNode) = mLoop((yyvsp[(2) - (5)].yyNode), (yyvsp[(1) - (5)].yyLineNr)); }
    break;

  case 26:

/* Line 1806 of yacc.c  */
#line 116 "./src/trac42.y"
    { (yyval.yyNode) = mExit((yyvsp[(1) - (2)].yyLineNr)); }
    break;

  case 27:

/* Line 1806 of yacc.c  */
#line 119 "./src/trac42.y"
    { (yyval.yyNode) = mUnary((yyvsp[(1) - (2)].yyOperator).opType, (yyvsp[(2) - (2)].yyNode), (yyvsp[(1) - (2)].yyOperator).lineNr); }
    break;

  case 28:

/* Line 1806 of yacc.c  */
#line 120 "./src/trac42.y"
    { (yyval.yyNode) = mUnary((yyvsp[(1) - (2)].yyOperator).opType, (yyvsp[(2) - (2)].yyNode), (yyvsp[(1) - (2)].yyOperator).lineNr); }
    break;

  case 29:

/* Line 1806 of yacc.c  */
#line 121 "./src/trac42.y"
    { (yyval.yyNode) = mUnary(((yyvsp[(1) - (4)].yyType).type == INT ? INTOP : ((yyvsp[(1) - (4)].yyType).type == FLOAT ? FLOATOP : ERROP)), (yyvsp[(3) - (4)].yyNode), (yyvsp[(1) - (4)].yyType).lineNr); }
    break;

  case 30:

/* Line 1806 of yacc.c  */
#line 122 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 31:

/* Line 1806 of yacc.c  */
#line 123 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 32:

/* Line 1806 of yacc.c  */
#line 124 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 33:

/* Line 1806 of yacc.c  */
#line 125 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 34:

/* Line 1806 of yacc.c  */
#line 126 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 35:

/* Line 1806 of yacc.c  */
#line 127 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 36:

/* Line 1806 of yacc.c  */
#line 128 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 37:

/* Line 1806 of yacc.c  */
#line 129 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 38:

/* Line 1806 of yacc.c  */
#line 130 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 39:

/* Line 1806 of yacc.c  */
#line 131 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(2) - (3)].yyNode); }
    break;

  case 40:

/* Line 1806 of yacc.c  */
#line 132 "./src/trac42.y"
    { (yyval.yyNode) = mFuncCallExpr((yyvsp[(3) - (4)].yyNode), (yyvsp[(1) - (4)].yyString).strVal, (yyvsp[(1) - (4)].yyString).lineNr); }
    break;

  case 41:

/* Line 1806 of yacc.c  */
#line 133 "./src/trac42.y"
    { (yyval.yyNode) = mRValue((yyvsp[(1) - (1)].yyString).strVal, (yyvsp[(1) - (1)].yyString).lineNr); }
    break;

  case 42:

/* Line 1806 of yacc.c  */
#line 134 "./src/trac42.y"
    { (yyval.yyNode) = mIntConst((yyvsp[(1) - (1)].yyInt).intVal, (yyvsp[(1) - (1)].yyInt).lineNr); }
    break;

  case 43:

/* Line 1806 of yacc.c  */
#line 135 "./src/trac42.y"
    { (yyval.yyNode) = mBoolConst((yyvsp[(1) - (1)].yyString).strVal, (yyvsp[(1) - (1)].yyString).lineNr); }
    break;

  case 44:

/* Line 1806 of yacc.c  */
#line 136 "./src/trac42.y"
    { (yyval.yyNode) = mFloatConst((yyvsp[(1) - (1)].yyFloat).floatVal, (yyvsp[(1) - (1)].yyFloat).lineNr); }
    break;

  case 45:

/* Line 1806 of yacc.c  */
#line 137 "./src/trac42.y"
    { (yyval.yyNode) = mVecConst((yyvsp[(2) - (7)].yyFloat).floatVal, (yyvsp[(4) - (7)].yyFloat).floatVal, (yyvsp[(6) - (7)].yyFloat).floatVal, (yyvsp[(2) - (7)].yyFloat).lineNr); }
    break;

  case 46:

/* Line 1806 of yacc.c  */
#line 140 "./src/trac42.y"
    { (yyval.yyNode) = mMatConst((yyvsp[(3) - (25)].yyFloat).floatVal, (yyvsp[(5) - (25)].yyFloat).floatVal, (yyvsp[(7) - (25)].yyFloat).floatVal, 
													         (yyvsp[(11) - (25)].yyFloat).floatVal, (yyvsp[(13) - (25)].yyFloat).floatVal, (yyvsp[(15) - (25)].yyFloat).floatVal, 
														 (yyvsp[(19) - (25)].yyFloat).floatVal, (yyvsp[(21) - (25)].yyFloat).floatVal, (yyvsp[(23) - (25)].yyFloat).floatVal, 
														 (yyvsp[(3) - (25)].yyFloat).lineNr); }
    break;

  case 47:

/* Line 1806 of yacc.c  */
#line 146 "./src/trac42.y"
    { (yyval.yyFloat) = (yyvsp[(2) - (2)].yyFloat); (yyval.yyFloat).floatVal *= -1.0; }
    break;

  case 48:

/* Line 1806 of yacc.c  */
#line 147 "./src/trac42.y"
    { (yyval.yyFloat) = (yyvsp[(1) - (1)].yyFloat); }
    break;

  case 49:

/* Line 1806 of yacc.c  */
#line 150 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 50:

/* Line 1806 of yacc.c  */
#line 151 "./src/trac42.y"
    { (yyval.yyNode) = NULL; }
    break;

  case 51:

/* Line 1806 of yacc.c  */
#line 154 "./src/trac42.y"
    { (yyval.yyNode) = connectActuals((yyvsp[(1) - (3)].yyNode), mActual((yyvsp[(3) - (3)].yyNode))); }
    break;

  case 52:

/* Line 1806 of yacc.c  */
#line 155 "./src/trac42.y"
    { (yyval.yyNode) = mActual((yyvsp[(1) - (1)].yyNode)); }
    break;



/* Line 1806 of yacc.c  */
#line 1939 "./src/trac42.y.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 2067 of yacc.c  */
#line 158 "./src/trac42.y"

int main (int argc, char *argv[])
{
   int syntax_errors;
   char *p, *objname, *basename, *lstname;
   t_symtable *symbolTable;
   eType typeRet;

   symbolTable = NULL;

   if (argc <= 1) {
      fprintf (stderr, "No source file specified.\n");
   } else {
      yyin = fopen (argv[1], "r+");
      if (yyin == NULL) {
         fprintf (stderr, "Could not open input file %s\n", argv[1]);
      } else {
         basename = malloc(strlen(argv[1]) + 5);
         strcpy(basename, argv[1]);
         p = strstr (basename, ".t42");
         if (p) {
            *p = 0;
         }
         objname = malloc(strlen(basename) + 5);
         lstname = malloc(strlen(basename) + 6);
         strcpy(objname, basename);
         strcpy(lstname, basename);
         strcat(objname, ".obj");
         strcat(lstname, "_.lst");
		 printf("Building AST...");
         syntax_errors = yyparse();
         if (!syntax_errors) {
			
			printf("DONE.\n");			

			// pass 1 - generate trac42 code back from AST
			printf("Generating trac42 code from AST to file \"generatedcode.t42\"... ");
			genTrac42Traverse(treeRoot);

			printf("DONE.\n");

			//pass 2 - name analysis
			printf("Building symbol tables and performing name analysis... ");
			symbolTable = nameAnalysis(treeRoot);
			if (nameErrorType > 0)
			{
				printf("\n");
				// name analysis error
				fprintf (stderr, "Name analysis found an error on line %d: '", nameErrorLineNr);
				fprintf (stderr, nameErrorId);
				switch(nameErrorType)
				{
				case NAME_ERROR_TYPE_ALREADY_DEFINED:
					fprintf(stderr, "' is already declared.\n");
					break;
				case NAME_ERROR_TYPE_NOT_DEFINED:
					fprintf(stderr, "' is not declared.\n");
					break;
				default:
					break;
				}
			}
			else
			{
				printf("DONE.\n");

				// pass 3 - type control
				printf("Performing type control... ");
				typeRet = typeControl(treeRoot, symbolTable);
				if (typeRet != VOID)
				{
					fprintf (stderr, "Type mismatch on line %d.\n", typeErrorLineNr);
				}
				else
				{
					printf("DONE.\n");
					
					// pass 4 - offset calculations
					printf("Calculating offsets for IDs... ");
					offsetCalc(treeRoot, symbolTable);


					printf("DONE.\n");
/*
					// pass 5 - generate list file
					printf("Generating trac42 stack machine code to file \"");
					printf(lstname);
					printf("\"... ");
					generateSMC(treeRoot, symbolTable, lstname);
					printf("Done!\n");
					printf("Cleaning up and exiting...\n");
					*/
				}
			}
				
			
            //fprintf (stderr, "The answer is 42\n");
         } else {
            fprintf (stderr, "There were syntax errors.\n");
         }
		 destroyTables(symbolTable); 
		 destroy_tree(treeRoot);
         free(basename);
         free(objname);
         free(lstname);
      }
   }
   //system("pause");
   printf("\n");
   return 0;
}

int yyerror(const char *s)
{
   extern int yylineno;
   fprintf (stderr, "A %s at line %d\n",s, yylineno);
   return 0;
}


