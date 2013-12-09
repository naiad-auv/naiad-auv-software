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
#include "gensmc.h"

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
     ASM = 288,
     ADDR_TYPE = 289,
     MATH_TYPE = 290
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
#line 178 "./src/trac42.y.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 343 of yacc.c  */
#line 190 "./src/trac42.y.c"

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
#define YYLAST   353

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  43
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  16
/* YYNRULES -- Number of rules.  */
#define YYNRULES  57
/* YYNRULES -- Number of states.  */
#define YYNSTATES  189

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   290

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      36,    37,     2,     2,    41,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    39,    38,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    40,     2,    42,     2,     2,     2,     2,     2,     2,
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
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,    10,    23,    33,    48,    60,
      64,    66,    70,    73,    74,    79,    81,    86,    89,    91,
      96,   102,   110,   120,   128,   132,   135,   141,   147,   150,
     153,   156,   161,   165,   169,   173,   177,   181,   185,   189,
     193,   197,   201,   206,   208,   213,   215,   217,   219,   227,
     253,   255,   257,   260,   262,   264,   265,   269
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      44,     0,    -1,    45,    -1,    45,    46,    -1,    46,    -1,
      28,    15,    36,    47,    37,    30,    49,    31,    52,    25,
      15,    38,    -1,    28,    15,    30,    49,    31,    52,    25,
      15,    38,    -1,    29,    15,    36,    47,    37,    24,    14,
      30,    49,    31,    52,    25,    15,    38,    -1,    29,    15,
      24,    14,    30,    49,    31,    52,    25,    15,    38,    -1,
      47,    38,    48,    -1,    48,    -1,    15,    39,    51,    -1,
      49,    50,    -1,    -1,    15,    39,    51,    38,    -1,    14,
      -1,    34,    36,    14,    37,    -1,    52,    53,    -1,    53,
      -1,    15,    32,    54,    38,    -1,    33,    36,    17,    37,
      38,    -1,    20,    54,    21,    52,    25,    20,    38,    -1,
      20,    54,    21,    52,    22,    52,    25,    20,    38,    -1,
      23,    54,    27,    52,    25,    27,    38,    -1,    24,    54,
      38,    -1,    24,    38,    -1,    15,    36,    57,    37,    38,
      -1,    27,    52,    25,    27,    38,    -1,    26,    38,    -1,
       9,    54,    -1,    13,    54,    -1,    55,    36,    54,    37,
      -1,    54,     8,    54,    -1,    54,     9,    54,    -1,    54,
      10,    54,    -1,    54,    11,    54,    -1,    54,     4,    54,
      -1,    54,     3,    54,    -1,    54,     5,    54,    -1,    54,
       7,    54,    -1,    54,     6,    54,    -1,    36,    54,    37,
      -1,    15,    36,    57,    37,    -1,    15,    -1,    34,    36,
      15,    37,    -1,    18,    -1,    16,    -1,    19,    -1,    40,
      56,    41,    56,    41,    56,    42,    -1,    40,    40,    56,
      41,    56,    41,    56,    42,    41,    40,    56,    41,    56,
      41,    56,    42,    41,    40,    56,    41,    56,    41,    56,
      42,    42,    -1,    14,    -1,    35,    -1,     9,    19,    -1,
      19,    -1,    58,    -1,    -1,    58,    41,    54,    -1,    54,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    78,    78,    81,    82,    85,    86,    87,    88,    92,
      93,    96,    99,   100,   103,   106,   107,   110,   111,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   126,
     127,   128,   129,   130,   131,   132,   133,   134,   135,   136,
     137,   138,   139,   140,   141,   142,   143,   144,   145,   146,
     154,   155,   158,   159,   162,   163,   166,   167
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
  "LOOP", "PROCEDURE", "FUNCTION", "IS", "BGN", "ASSIGN", "ASM",
  "ADDR_TYPE", "MATH_TYPE", "'('", "')'", "';'", "':'", "'['", "','",
  "']'", "$accept", "program", "functions", "function", "formals",
  "formal", "decls", "decl", "type", "stmnts", "stmnt", "expr", "unaryop",
  "vec_comp", "actuals", "exprs", 0
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
     285,   286,   287,   288,   289,   290,    40,    41,    59,    58,
      91,    44,    93
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    43,    44,    45,    45,    46,    46,    46,    46,    47,
      47,    48,    49,    49,    50,    51,    51,    52,    52,    53,
      53,    53,    53,    53,    53,    53,    53,    53,    53,    54,
      54,    54,    54,    54,    54,    54,    54,    54,    54,    54,
      54,    54,    54,    54,    54,    54,    54,    54,    54,    54,
      55,    55,    56,    56,    57,    57,    58,    58
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,    12,     9,    14,    11,     3,
       1,     3,     2,     0,     4,     1,     4,     2,     1,     4,
       5,     7,     9,     7,     3,     2,     5,     5,     2,     2,
       2,     4,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     4,     1,     4,     1,     1,     1,     7,    25,
       1,     1,     2,     1,     1,     0,     3,     1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     2,     4,     0,     0,     1,     3,
      13,     0,     0,     0,     0,     0,     0,    10,     0,     0,
       0,     0,    12,     0,     0,     0,    13,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    18,    15,     0,
      11,    13,     9,     0,     0,     0,     0,    55,     0,     0,
      50,    43,    46,    45,    47,     0,    51,     0,     0,     0,
       0,     0,    25,     0,    28,     0,     0,     0,    17,     0,
       0,     0,     0,    14,     0,    57,     0,    54,    29,    30,
      55,     0,     0,     0,    53,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    24,
       0,     0,     0,     0,     0,     0,    13,    19,     0,     0,
       0,     0,    41,    52,     0,     0,    37,    36,    38,    40,
      39,    32,    33,    34,    35,     0,     0,     0,     0,     0,
       6,    16,     0,     0,     0,    26,    56,    42,    44,     0,
       0,     0,     0,    31,     0,    27,    20,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,     0,     0,     0,
       0,    21,    23,     5,     0,     0,    48,     0,     0,     0,
      22,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    49
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     3,     4,     5,    16,    17,    14,    22,    40,    36,
      37,    75,    60,    86,    76,    77
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -81
static const yytype_int16 yypact[] =
{
      70,    15,    40,    32,    70,   -81,    -2,    34,   -81,   -81,
     -81,    45,    54,    45,     0,    38,   -34,   -81,    43,    50,
      41,   296,   -81,    19,    60,    45,   -81,    51,    19,    29,
     168,   168,   140,    56,   296,    64,    59,   -81,   -81,    66,
     -81,   -81,   -81,    23,    90,    81,   168,   168,   168,   168,
     -81,    84,   -81,   -81,   -81,    95,   -81,   168,    17,   210,
      96,   185,   -81,     3,   -81,   103,   117,   120,   -81,   123,
      25,   296,   118,   -81,    14,   327,   110,   109,   -81,   -81,
     168,   136,    39,   133,   -81,    18,   116,   168,   168,   168,
     168,   168,   168,   168,   168,   168,   296,   168,   296,   -81,
     134,   125,   122,   142,   296,   226,   -81,   -81,   163,   168,
     169,   170,   -81,   -81,   164,    18,   335,   342,   104,   189,
     189,    52,    52,   198,   -81,   212,   135,   240,   172,   173,
     -81,   -81,   254,   207,    36,   -81,   327,   -81,   -81,    18,
     182,   296,   204,   -81,   199,   -81,   -81,   213,   187,   296,
     188,    18,   268,   192,   195,   202,   -81,   282,    18,   200,
     223,   -81,   -81,   -81,   229,   205,   -81,   216,   218,   217,
     -81,   -81,   208,    18,   220,    18,   221,    18,   215,   227,
     230,    18,   231,    18,   234,    18,   242,   243,   -81
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -81,   -81,   -81,   267,   263,   257,   -25,   -81,   258,   -32,
     -36,    76,   -81,   -80,   209,   -81
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      68,    43,    65,    24,    25,   114,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    20,    70,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    83,    83,    10,    68,
       6,    21,     8,    38,    11,   140,    84,    84,    20,   105,
      20,    99,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    20,   107,    39,    71,     7,   104,    85,    12,   150,
      15,    46,    94,    95,   125,    47,   127,   149,    18,    68,
      13,   159,   132,    26,    29,    44,   112,    23,   165,    30,
      28,   134,    31,    32,    67,    33,    34,    27,    25,    68,
      41,    68,    35,   174,    64,   176,    68,   178,     1,     2,
      66,   182,    69,   184,    72,   186,    59,    61,    63,   152,
      90,    91,    92,    93,    94,    95,    68,   157,    29,    73,
      80,    68,    74,    30,    78,    79,    31,    32,   100,    33,
      34,    81,    97,    82,   101,   102,    35,   103,    87,    88,
      89,    90,    91,    92,    93,    94,    95,   108,   106,    48,
     109,   111,   113,    49,    50,    51,    52,   115,    53,    54,
     130,   128,   129,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   143,   126,    55,    56,    57,    48,    62,   131,
      58,    49,    50,    51,    52,   136,    53,    54,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    92,    93,    94,
      95,   135,    55,    56,    57,   139,   137,   138,    58,    95,
     145,   146,    98,    87,    88,    89,    90,    91,    92,    93,
      94,    95,   148,   151,   153,   156,   154,    29,   155,   158,
     161,    96,    30,   162,   141,    31,    32,   142,    33,    34,
     163,    29,   166,   167,   168,    35,    30,   169,   173,    31,
      32,   133,    33,    34,   170,    29,   171,   179,   172,    35,
      30,   175,   177,    31,    32,   144,    33,    34,   180,    29,
     181,     9,   183,    35,    30,   185,    19,    31,    32,   147,
      33,    34,    42,    29,   187,   188,    45,    35,    30,   110,
       0,    31,    32,   160,    33,    34,     0,    29,     0,     0,
       0,    35,    30,     0,     0,    31,    32,   164,    33,    34,
       0,    29,     0,     0,     0,    35,    30,     0,     0,    31,
      32,     0,    33,    34,     0,     0,     0,     0,     0,    35,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    88,
      89,    90,    91,    92,    93,    94,    95,    89,    90,    91,
      92,    93,    94,    95
};

#define yypact_value_is_default(yystate) \
  ((yystate) == (-81))

#define yytable_value_is_error(yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
      36,    26,    34,    37,    38,    85,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    15,    41,     3,     4,     5,
       6,     7,     8,     9,    10,    11,     9,     9,    30,    65,
      15,    31,     0,    14,    36,   115,    19,    19,    15,    71,
      15,    38,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    15,    38,    34,    31,    15,    31,    40,    24,   139,
      15,    32,    10,    11,    96,    36,    98,    31,    14,   105,
      36,   151,   104,    30,    15,    24,    37,    39,   158,    20,
      39,   106,    23,    24,    25,    26,    27,    37,    38,   125,
      30,   127,    33,   173,    38,   175,   132,   177,    28,    29,
      36,   181,    36,   183,    14,   185,    30,    31,    32,   141,
       6,     7,     8,     9,    10,    11,   152,   149,    15,    38,
      36,   157,    46,    20,    48,    49,    23,    24,    25,    26,
      27,    36,    36,    57,    17,    15,    33,    14,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    37,    30,     9,
      41,    15,    19,    13,    14,    15,    16,    41,    18,    19,
      38,    27,    37,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    37,    97,    34,    35,    36,     9,    38,    37,
      40,    13,    14,    15,    16,   109,    18,    19,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     8,     9,    10,
      11,    38,    34,    35,    36,    41,    37,    37,    40,    11,
      38,    38,    27,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    15,    41,    20,    38,    27,    15,    15,    41,
      38,    21,    20,    38,    22,    23,    24,    25,    26,    27,
      38,    15,    42,    20,    15,    33,    20,    42,    40,    23,
      24,    25,    26,    27,    38,    15,    38,    42,    41,    33,
      20,    41,    41,    23,    24,    25,    26,    27,    41,    15,
      40,     4,    41,    33,    20,    41,    13,    23,    24,    25,
      26,    27,    25,    15,    42,    42,    28,    33,    20,    80,
      -1,    23,    24,    25,    26,    27,    -1,    15,    -1,    -1,
      -1,    33,    20,    -1,    -1,    23,    24,    25,    26,    27,
      -1,    15,    -1,    -1,    -1,    33,    20,    -1,    -1,    23,
      24,    -1,    26,    27,    -1,    -1,    -1,    -1,    -1,    33,
       3,     4,     5,     6,     7,     8,     9,    10,    11,     4,
       5,     6,     7,     8,     9,    10,    11,     5,     6,     7,
       8,     9,    10,    11
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    28,    29,    44,    45,    46,    15,    15,     0,    46,
      30,    36,    24,    36,    49,    15,    47,    48,    14,    47,
      15,    31,    50,    39,    37,    38,    30,    37,    39,    15,
      20,    23,    24,    26,    27,    33,    52,    53,    14,    34,
      51,    30,    48,    49,    24,    51,    32,    36,     9,    13,
      14,    15,    16,    18,    19,    34,    35,    36,    40,    54,
      55,    54,    38,    54,    38,    52,    36,    25,    53,    36,
      49,    31,    14,    38,    54,    54,    57,    58,    54,    54,
      36,    36,    54,     9,    19,    40,    56,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    21,    36,    27,    38,
      25,    17,    15,    14,    31,    52,    30,    38,    37,    41,
      57,    15,    37,    19,    56,    41,    54,    54,    54,    54,
      54,    54,    54,    54,    54,    52,    54,    52,    27,    37,
      38,    37,    52,    25,    49,    38,    54,    37,    37,    41,
      56,    22,    25,    37,    25,    38,    38,    25,    15,    31,
      56,    41,    52,    20,    27,    15,    38,    52,    41,    56,
      25,    38,    38,    38,    25,    56,    42,    20,    15,    42,
      38,    38,    41,    40,    56,    41,    56,    41,    56,    42,
      41,    40,    56,    41,    56,    41,    56,    42,    42
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
#line 78 "./src/trac42.y"
    { treeRoot = mProgram((yyvsp[(1) - (1)].yyNode)); }
    break;

  case 3:

/* Line 1806 of yacc.c  */
#line 81 "./src/trac42.y"
    { (yyval.yyNode) = connectFunctions((yyvsp[(1) - (2)].yyNode),(yyvsp[(2) - (2)].yyNode)); }
    break;

  case 4:

/* Line 1806 of yacc.c  */
#line 82 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 5:

/* Line 1806 of yacc.c  */
#line 85 "./src/trac42.y"
    { if (strcmp((yyvsp[(2) - (12)].yyString).strVal, (yyvsp[(11) - (12)].yyString).strVal) != 0) { yyerror("syntax error"); YYERROR; } else (yyval.yyNode) = mFunction(connectVariables((yyvsp[(4) - (12)].yyNode), (yyvsp[(7) - (12)].yyNode)), (yyvsp[(9) - (12)].yyNode), (yyvsp[(2) - (12)].yyString).strVal, VOID, (yyvsp[(2) - (12)].yyString).lineNr); }
    break;

  case 6:

/* Line 1806 of yacc.c  */
#line 86 "./src/trac42.y"
    { if (strcmp((yyvsp[(2) - (9)].yyString).strVal, (yyvsp[(8) - (9)].yyString).strVal) != 0) { yyerror("syntax error"); YYERROR; } else (yyval.yyNode) = mFunction((yyvsp[(4) - (9)].yyNode), (yyvsp[(6) - (9)].yyNode), (yyvsp[(2) - (9)].yyString).strVal, VOID, (yyvsp[(2) - (9)].yyString).lineNr); }
    break;

  case 7:

/* Line 1806 of yacc.c  */
#line 87 "./src/trac42.y"
    { if (strcmp((yyvsp[(2) - (14)].yyString).strVal, (yyvsp[(13) - (14)].yyString).strVal) != 0) { yyerror("syntax error"); YYERROR; } else (yyval.yyNode) = mFunction(connectVariables((yyvsp[(4) - (14)].yyNode), (yyvsp[(9) - (14)].yyNode)), (yyvsp[(11) - (14)].yyNode), (yyvsp[(2) - (14)].yyString).strVal, (yyvsp[(7) - (14)].yyType).type, (yyvsp[(2) - (14)].yyString).lineNr); }
    break;

  case 8:

/* Line 1806 of yacc.c  */
#line 88 "./src/trac42.y"
    { if (strcmp((yyvsp[(2) - (11)].yyString).strVal, (yyvsp[(10) - (11)].yyString).strVal) != 0) { yyerror("syntax error"); YYERROR; } else (yyval.yyNode) = mFunction((yyvsp[(6) - (11)].yyNode), (yyvsp[(8) - (11)].yyNode), (yyvsp[(2) - (11)].yyString).strVal, (yyvsp[(4) - (11)].yyType).type, (yyvsp[(2) - (11)].yyString).lineNr); }
    break;

  case 9:

/* Line 1806 of yacc.c  */
#line 92 "./src/trac42.y"
    { (yyval.yyNode) = connectVariables((yyvsp[(1) - (3)].yyNode),(yyvsp[(3) - (3)].yyNode)); }
    break;

  case 10:

/* Line 1806 of yacc.c  */
#line 93 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 11:

/* Line 1806 of yacc.c  */
#line 96 "./src/trac42.y"
    { (yyval.yyNode) = mVariable(kFormal, (yyvsp[(1) - (3)].yyString).strVal, (yyvsp[(3) - (3)].yyType).type, (yyvsp[(1) - (3)].yyString).lineNr); }
    break;

  case 12:

/* Line 1806 of yacc.c  */
#line 99 "./src/trac42.y"
    { if ((yyvsp[(1) - (2)].yyNode) != NULL) { (yyval.yyNode) = connectVariables((yyvsp[(1) - (2)].yyNode), (yyvsp[(2) - (2)].yyNode)); } else { (yyval.yyNode) = (yyvsp[(2) - (2)].yyNode); } }
    break;

  case 13:

/* Line 1806 of yacc.c  */
#line 100 "./src/trac42.y"
    { (yyval.yyNode) = NULL; }
    break;

  case 14:

/* Line 1806 of yacc.c  */
#line 103 "./src/trac42.y"
    { (yyval.yyNode) = mVariable(kLocal, (yyvsp[(1) - (4)].yyString).strVal, (yyvsp[(3) - (4)].yyType).type, (yyvsp[(1) - (4)].yyString).lineNr); }
    break;

  case 15:

/* Line 1806 of yacc.c  */
#line 106 "./src/trac42.y"
    { (yyval.yyType) = (yyvsp[(1) - (1)].yyType); }
    break;

  case 16:

/* Line 1806 of yacc.c  */
#line 107 "./src/trac42.y"
    { (yyval.yyType).lineNr = (yyvsp[(1) - (4)].yyLineNr); (yyval.yyType).type = (yyvsp[(3) - (4)].yyType).type + MATRIX; }
    break;

  case 17:

/* Line 1806 of yacc.c  */
#line 110 "./src/trac42.y"
    { (yyval.yyNode) = connectStmnts((yyvsp[(1) - (2)].yyNode),(yyvsp[(2) - (2)].yyNode)); }
    break;

  case 18:

/* Line 1806 of yacc.c  */
#line 111 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 19:

/* Line 1806 of yacc.c  */
#line 114 "./src/trac42.y"
    { (yyval.yyNode) = mAssign((yyvsp[(1) - (4)].yyString).strVal, (yyvsp[(3) - (4)].yyNode), (yyvsp[(1) - (4)].yyString).lineNr); }
    break;

  case 20:

/* Line 1806 of yacc.c  */
#line 115 "./src/trac42.y"
    { (yyval.yyNode) = mAsm((yyvsp[(3) - (5)].yyString).strVal, (yyvsp[(1) - (5)].yyLineNr)); }
    break;

  case 21:

/* Line 1806 of yacc.c  */
#line 116 "./src/trac42.y"
    { (yyval.yyNode) = mIf((yyvsp[(2) - (7)].yyNode), (yyvsp[(4) - (7)].yyNode), NULL, (yyvsp[(1) - (7)].yyLineNr)); }
    break;

  case 22:

/* Line 1806 of yacc.c  */
#line 117 "./src/trac42.y"
    { (yyval.yyNode) = mIf((yyvsp[(2) - (9)].yyNode), (yyvsp[(4) - (9)].yyNode), (yyvsp[(6) - (9)].yyNode), (yyvsp[(1) - (9)].yyLineNr)); }
    break;

  case 23:

/* Line 1806 of yacc.c  */
#line 118 "./src/trac42.y"
    { (yyval.yyNode) = mWhile((yyvsp[(2) - (7)].yyNode), (yyvsp[(4) - (7)].yyNode), (yyvsp[(1) - (7)].yyLineNr)); }
    break;

  case 24:

/* Line 1806 of yacc.c  */
#line 119 "./src/trac42.y"
    { (yyval.yyNode) = mReturn((yyvsp[(2) - (3)].yyNode), (yyvsp[(1) - (3)].yyLineNr)); }
    break;

  case 25:

/* Line 1806 of yacc.c  */
#line 120 "./src/trac42.y"
    { (yyval.yyNode) = mReturn(NULL, (yyvsp[(1) - (2)].yyLineNr)); }
    break;

  case 26:

/* Line 1806 of yacc.c  */
#line 121 "./src/trac42.y"
    { (yyval.yyNode) = mFuncCallStmnt((yyvsp[(3) - (5)].yyNode), (yyvsp[(1) - (5)].yyString).strVal, (yyvsp[(1) - (5)].yyString).lineNr); }
    break;

  case 27:

/* Line 1806 of yacc.c  */
#line 122 "./src/trac42.y"
    { (yyval.yyNode) = mLoop((yyvsp[(2) - (5)].yyNode), (yyvsp[(1) - (5)].yyLineNr)); }
    break;

  case 28:

/* Line 1806 of yacc.c  */
#line 123 "./src/trac42.y"
    { (yyval.yyNode) = mExit((yyvsp[(1) - (2)].yyLineNr)); }
    break;

  case 29:

/* Line 1806 of yacc.c  */
#line 126 "./src/trac42.y"
    { (yyval.yyNode) = mUnary((yyvsp[(1) - (2)].yyOperator).opType, (yyvsp[(2) - (2)].yyNode), (yyvsp[(1) - (2)].yyOperator).lineNr); }
    break;

  case 30:

/* Line 1806 of yacc.c  */
#line 127 "./src/trac42.y"
    { (yyval.yyNode) = mUnary((yyvsp[(1) - (2)].yyOperator).opType, (yyvsp[(2) - (2)].yyNode), (yyvsp[(1) - (2)].yyOperator).lineNr); }
    break;

  case 31:

/* Line 1806 of yacc.c  */
#line 128 "./src/trac42.y"
    { (yyval.yyNode) = mUnary((yyvsp[(1) - (4)].yyOperator).opType, (yyvsp[(3) - (4)].yyNode), (yyvsp[(1) - (4)].yyOperator).lineNr); }
    break;

  case 32:

/* Line 1806 of yacc.c  */
#line 129 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 33:

/* Line 1806 of yacc.c  */
#line 130 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 34:

/* Line 1806 of yacc.c  */
#line 131 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 35:

/* Line 1806 of yacc.c  */
#line 132 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 36:

/* Line 1806 of yacc.c  */
#line 133 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 37:

/* Line 1806 of yacc.c  */
#line 134 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 38:

/* Line 1806 of yacc.c  */
#line 135 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 39:

/* Line 1806 of yacc.c  */
#line 136 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 40:

/* Line 1806 of yacc.c  */
#line 137 "./src/trac42.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 41:

/* Line 1806 of yacc.c  */
#line 138 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(2) - (3)].yyNode); }
    break;

  case 42:

/* Line 1806 of yacc.c  */
#line 139 "./src/trac42.y"
    { (yyval.yyNode) = mFuncCallExpr((yyvsp[(3) - (4)].yyNode), (yyvsp[(1) - (4)].yyString).strVal, (yyvsp[(1) - (4)].yyString).lineNr); }
    break;

  case 43:

/* Line 1806 of yacc.c  */
#line 140 "./src/trac42.y"
    { (yyval.yyNode) = mRValue((yyvsp[(1) - (1)].yyString).strVal, (yyvsp[(1) - (1)].yyString).lineNr); }
    break;

  case 44:

/* Line 1806 of yacc.c  */
#line 141 "./src/trac42.y"
    { (yyval.yyNode) = mLValue((yyvsp[(3) - (4)].yyString).strVal, (yyvsp[(1) - (4)].yyLineNr)); }
    break;

  case 45:

/* Line 1806 of yacc.c  */
#line 142 "./src/trac42.y"
    { (yyval.yyNode) = mIntConst((yyvsp[(1) - (1)].yyInt).intVal, (yyvsp[(1) - (1)].yyInt).lineNr); }
    break;

  case 46:

/* Line 1806 of yacc.c  */
#line 143 "./src/trac42.y"
    { (yyval.yyNode) = mBoolConst((yyvsp[(1) - (1)].yyString).strVal, (yyvsp[(1) - (1)].yyString).lineNr); }
    break;

  case 47:

/* Line 1806 of yacc.c  */
#line 144 "./src/trac42.y"
    { (yyval.yyNode) = mFloatConst((yyvsp[(1) - (1)].yyFloat).floatVal, (yyvsp[(1) - (1)].yyFloat).lineNr); }
    break;

  case 48:

/* Line 1806 of yacc.c  */
#line 145 "./src/trac42.y"
    { (yyval.yyNode) = mVecConst((yyvsp[(2) - (7)].yyFloat).floatVal, (yyvsp[(4) - (7)].yyFloat).floatVal, (yyvsp[(6) - (7)].yyFloat).floatVal, (yyvsp[(2) - (7)].yyFloat).lineNr); }
    break;

  case 49:

/* Line 1806 of yacc.c  */
#line 148 "./src/trac42.y"
    { (yyval.yyNode) = mMatConst((yyvsp[(3) - (25)].yyFloat).floatVal, (yyvsp[(5) - (25)].yyFloat).floatVal, (yyvsp[(7) - (25)].yyFloat).floatVal, 
													         (yyvsp[(11) - (25)].yyFloat).floatVal, (yyvsp[(13) - (25)].yyFloat).floatVal, (yyvsp[(15) - (25)].yyFloat).floatVal, 
														 (yyvsp[(19) - (25)].yyFloat).floatVal, (yyvsp[(21) - (25)].yyFloat).floatVal, (yyvsp[(23) - (25)].yyFloat).floatVal, 
														 (yyvsp[(3) - (25)].yyFloat).lineNr); }
    break;

  case 50:

/* Line 1806 of yacc.c  */
#line 154 "./src/trac42.y"
    { (yyval.yyOperator).opType = ((yyvsp[(1) - (1)].yyType).type == INT ? INTOP : ((yyvsp[(1) - (1)].yyType).type == FLOAT ? FLOATOP : ERROP)); (yyval.yyOperator).lineNr = (yyvsp[(1) - (1)].yyType).lineNr; }
    break;

  case 51:

/* Line 1806 of yacc.c  */
#line 155 "./src/trac42.y"
    { (yyval.yyOperator) = (yyvsp[(1) - (1)].yyOperator); }
    break;

  case 52:

/* Line 1806 of yacc.c  */
#line 158 "./src/trac42.y"
    { (yyval.yyFloat) = (yyvsp[(2) - (2)].yyFloat); (yyval.yyFloat).floatVal *= -1.0; }
    break;

  case 53:

/* Line 1806 of yacc.c  */
#line 159 "./src/trac42.y"
    { (yyval.yyFloat) = (yyvsp[(1) - (1)].yyFloat); }
    break;

  case 54:

/* Line 1806 of yacc.c  */
#line 162 "./src/trac42.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 55:

/* Line 1806 of yacc.c  */
#line 163 "./src/trac42.y"
    { (yyval.yyNode) = NULL; }
    break;

  case 56:

/* Line 1806 of yacc.c  */
#line 166 "./src/trac42.y"
    { (yyval.yyNode) = connectActuals((yyvsp[(1) - (3)].yyNode), mActual((yyvsp[(3) - (3)].yyNode))); }
    break;

  case 57:

/* Line 1806 of yacc.c  */
#line 167 "./src/trac42.y"
    { (yyval.yyNode) = mActual((yyvsp[(1) - (1)].yyNode)); }
    break;



/* Line 1806 of yacc.c  */
#line 1982 "./src/trac42.y.c"
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
#line 170 "./src/trac42.y"

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
	 //printf("Building AST...");

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
         syntax_errors = yyparse();
         if (!syntax_errors) {
			
			//printf("DONE.\n");			

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

					// pass 5 - generate list file
					printf("Generating trac42 stack machine code to file \"");
					printf(lstname);
					printf("\"... ");
					generateSMC(treeRoot, symbolTable, lstname);
					printf("DONE.\n");
					printf("Cleaning up and exiting...\n");
					
				}
			}
				
			
            //fprintf (stderr, "The answer is 42\n");
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


