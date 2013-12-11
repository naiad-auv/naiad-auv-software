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
#line 17 "./src/naiada.y"

#include <stdio.h>
#include <malloc.h>
#include <stddef.h>
#include <string.h>
#include "ast.h"        /* Data structures and constructors for the AST */
#include "naiada.h"     /* Various definitions */
#include "symtab.h"
#include "naiada.y.h"   /* Declaration of tokens, genereated by bison. */
#include "regennaiada.h"
#include "name.h"
#include "types.h"
#include "offset.h"
#include "gensmc.h"

extern FILE *yyin;
int yyerror(const char *s);
void showManual();
int yylex(void);



/* Line 268 of yacc.c  */
#line 94 "./src/naiada.y.c"

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
     UNOP = 266,
     NOTOP = 267,
     BASIC_TYPE = 268,
     ID = 269,
     BOOL_CONST = 270,
     STRING_CONST = 271,
     VEC_COMP = 272,
     MAT_COMP = 273,
     INT_CONST = 274,
     FLOAT_CONST = 275,
     IF = 276,
     THEN = 277,
     ELSE = 278,
     WHILE = 279,
     RETURN = 280,
     END = 281,
     EXIT = 282,
     LOOP = 283,
     PROCEDURE = 284,
     FUNCTION = 285,
     IS = 286,
     BGN = 287,
     ASSIGN = 288,
     ASM = 289,
     ADDR_TYPE = 290,
     NULL_STMNT = 291,
     MATH_TYPE = 292
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 293 of yacc.c  */
#line 39 "./src/naiada.y"

   t_tree       yyNode;
   floatStruct  yyFloat;
   intStruct    yyInt;
   compStruct	yyComp;
   stringStruct yyString;
   typeStruct   yyType;
   opStruct     yyOperator;
   int          yyLineNr;



/* Line 293 of yacc.c  */
#line 180 "./src/naiada.y.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 343 of yacc.c  */
#line 192 "./src/naiada.y.c"

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
#define YYLAST   521

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  45
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  15
/* YYNRULES -- Number of rules.  */
#define YYNRULES  57
/* YYNRULES -- Number of states.  */
#define YYNSTATES  188

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   292

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      40,    41,     2,     2,    14,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    43,    42,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    13,     2,    44,     2,     2,     2,     2,     2,     2,
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
       5,     6,     7,     8,     9,    10,    11,    12,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,    10,    23,    33,    48,    60,
      64,    66,    70,    73,    74,    79,    81,    86,    89,    91,
      96,   102,   110,   120,   128,   132,   135,   141,   147,   150,
     153,   156,   159,   164,   168,   172,   176,   180,   184,   188,
     192,   196,   200,   205,   207,   212,   214,   216,   218,   226,
     252,   254,   256,   258,   260,   262,   263,   267
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      46,     0,    -1,    47,    -1,    47,    48,    -1,    48,    -1,
      31,    16,    40,    49,    41,    33,    51,    34,    54,    28,
      16,    42,    -1,    31,    16,    33,    51,    34,    54,    28,
      16,    42,    -1,    32,    16,    40,    49,    41,    27,    15,
      33,    51,    34,    54,    28,    16,    42,    -1,    32,    16,
      27,    15,    33,    51,    34,    54,    28,    16,    42,    -1,
      49,    42,    50,    -1,    50,    -1,    16,    43,    53,    -1,
      51,    52,    -1,    -1,    16,    43,    53,    42,    -1,    15,
      -1,    37,    40,    15,    41,    -1,    54,    55,    -1,    55,
      -1,    16,    35,    56,    42,    -1,    36,    40,    18,    41,
      42,    -1,    23,    56,    24,    54,    28,    23,    42,    -1,
      23,    56,    24,    54,    25,    54,    28,    23,    42,    -1,
      26,    56,    30,    54,    28,    30,    42,    -1,    27,    56,
      42,    -1,    27,    42,    -1,    16,    40,    58,    41,    42,
      -1,    30,    54,    28,    30,    42,    -1,    29,    42,    -1,
      38,    42,    -1,     9,    56,    -1,    12,    56,    -1,    57,
      40,    56,    41,    -1,    56,     8,    56,    -1,    56,     9,
      56,    -1,    56,    10,    56,    -1,    56,     4,    56,    -1,
      56,     3,    56,    -1,    56,     5,    56,    -1,    56,     7,
      56,    -1,    56,     6,    56,    -1,    40,    56,    41,    -1,
      16,    40,    58,    41,    -1,    16,    -1,    37,    40,    16,
      41,    -1,    21,    -1,    17,    -1,    22,    -1,    13,    56,
      14,    56,    14,    56,    44,    -1,    13,    13,    56,    14,
      56,    14,    56,    44,    14,    13,    56,    14,    56,    14,
      56,    44,    14,    13,    56,    14,    56,    14,    56,    44,
      44,    -1,    19,    -1,    20,    -1,    15,    -1,    39,    -1,
      59,    -1,    -1,    59,    14,    56,    -1,    56,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    80,    80,    83,    84,    87,    88,    89,    90,    94,
      95,    98,   101,   102,   105,   108,   109,   112,   113,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     129,   130,   131,   132,   133,   134,   135,   136,   137,   138,
     139,   140,   141,   142,   143,   144,   145,   146,   147,   148,
     153,   154,   157,   158,   161,   162,   165,   166
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "OROP", "ANDOP", "EQOP", "MEMTOP",
  "LELTOP", "PLUSOP", "MINUSOP", "MULDIVOP", "UNOP", "NOTOP", "'['", "','",
  "BASIC_TYPE", "ID", "BOOL_CONST", "STRING_CONST", "VEC_COMP", "MAT_COMP",
  "INT_CONST", "FLOAT_CONST", "IF", "THEN", "ELSE", "WHILE", "RETURN",
  "END", "EXIT", "LOOP", "PROCEDURE", "FUNCTION", "IS", "BGN", "ASSIGN",
  "ASM", "ADDR_TYPE", "NULL_STMNT", "MATH_TYPE", "'('", "')'", "';'",
  "':'", "']'", "$accept", "program", "functions", "function", "formals",
  "formal", "decls", "decl", "type", "stmnts", "stmnt", "expr", "unaryop",
  "actuals", "exprs", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,    91,    44,   268,   269,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
      40,    41,    59,    58,    93
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    45,    46,    47,    47,    48,    48,    48,    48,    49,
      49,    50,    51,    51,    52,    53,    53,    54,    54,    55,
      55,    55,    55,    55,    55,    55,    55,    55,    55,    55,
      56,    56,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    56,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    56,    57,    57,    58,    58,    59,    59
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,    12,     9,    14,    11,     3,
       1,     3,     2,     0,     4,     1,     4,     2,     1,     4,
       5,     7,     9,     7,     3,     2,     5,     5,     2,     2,
       2,     2,     4,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     4,     1,     4,     1,     1,     1,     7,    25,
       1,     1,     1,     1,     1,     0,     3,     1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     2,     4,     0,     0,     1,     3,
      13,     0,     0,     0,     0,     0,     0,    10,     0,     0,
       0,     0,    12,     0,     0,     0,    13,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    18,    15,
       0,    11,    13,     9,     0,     0,     0,     0,    55,     0,
       0,     0,    52,    43,    46,    50,    51,    45,    47,     0,
      53,     0,     0,     0,     0,    25,     0,    28,     0,     0,
      29,     0,    17,     0,     0,     0,     0,    14,     0,    57,
       0,    54,    30,    31,     0,     0,    55,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      24,     0,     0,     0,     0,     0,     0,    13,    19,     0,
       0,     0,     0,     0,     0,    41,    37,    36,    38,    40,
      39,    33,    34,    35,     0,     0,     0,     0,     0,     6,
      16,     0,     0,     0,    26,    56,     0,     0,    42,    44,
       0,     0,    32,     0,    27,    20,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,     0,     0,     0,     0,
      21,    23,     5,     0,     0,    48,     0,     0,    48,    22,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    49
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     3,     4,     5,    16,    17,    14,    22,    41,    37,
      38,    79,    63,    80,    81
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -35
static const yytype_int16 yypact[] =
{
     -18,     0,     8,    33,   -18,   -35,   -25,   -22,   -35,   -35,
     -35,    16,    43,    16,    -9,    24,    11,   -35,    38,    28,
      31,   369,   -35,   -11,    44,    16,   -35,    51,   -11,   -12,
     208,   208,   176,    37,   369,    45,    41,   257,   -35,   -35,
      46,   -35,   -35,   -35,    -7,    73,    49,   208,   208,   208,
     208,   222,   -35,    53,   -35,   -35,   -35,   -35,   -35,    54,
     -35,   208,   405,    55,   246,   -35,   125,   -35,   273,    71,
     -35,    80,   -35,   100,    -5,   369,    85,   -35,   152,   511,
      78,   107,   -35,   -35,   222,   413,   208,   109,   165,   208,
     208,   208,   208,   208,   208,   208,   208,   369,   208,   369,
     -35,    93,    96,    84,    97,   369,   289,   -35,   -35,    94,
     208,   427,   208,    99,   102,   -35,   195,   202,   394,    47,
      47,   131,   131,   -35,   241,   173,   305,   103,   105,   -35,
     -35,   321,   133,    -4,   -35,   511,   208,   439,   -35,   -35,
     369,   128,   -35,   123,   -35,   -35,   147,   122,   369,   451,
     208,   337,   124,   142,   144,   -35,   353,   208,    32,   164,
     -35,   -35,   -35,   149,    40,   -35,   148,   177,   212,   -35,
     -35,   209,   208,   463,   208,   475,   208,    95,   218,   220,
     208,   487,   208,   499,   208,   104,   192,   -35
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -35,   -35,   -35,   236,   233,   235,   -20,   -35,   230,   -24,
     -34,   -30,   -35,   179,   -35
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      62,    64,    66,    72,    39,    12,    44,    20,    10,    20,
      68,    20,    20,     1,     2,    11,     6,    78,    13,    82,
      83,    85,    74,    47,     7,    21,    40,    75,    48,   105,
     148,    88,    15,     8,    72,    89,    90,    91,    92,    93,
      94,    95,    96,    89,    90,    91,    92,    93,    94,    95,
      96,   106,    24,    25,   111,    94,    95,    96,    18,   116,
     117,   118,   119,   120,   121,   122,   123,    23,   125,    27,
      25,    26,    72,   124,    28,   126,   165,    42,    45,    67,
     135,   131,   137,    70,   168,    69,    73,   133,    76,   102,
      72,    77,    72,    86,    87,    98,   103,    72,    89,    90,
      91,    92,    93,    94,    95,    96,   149,    89,    90,    91,
      92,    93,    94,    95,    96,   104,   151,    72,   107,   109,
     158,   110,    72,   127,   156,   114,   129,   164,    89,    90,
      91,    92,    93,    94,    95,    96,   134,   128,   130,   178,
     138,    96,   173,   139,   175,   144,   177,   145,   186,   147,
     181,   152,   183,   153,   185,    89,    90,    91,    92,    93,
      94,    95,    96,   154,   155,   167,   160,   100,    89,    90,
      91,    92,    93,    94,    95,    96,    89,    90,    91,    92,
      93,    94,    95,    96,   161,    49,   162,   166,    50,    51,
     169,    52,    53,    54,   108,    55,    56,    57,    58,    90,
      91,    92,    93,    94,    95,    96,   115,    91,    92,    93,
      94,    95,    96,    59,   142,    60,    61,    49,    65,   170,
      50,    51,   172,    52,    53,    54,   171,    55,    56,    57,
      58,    49,   179,   180,    50,    84,   187,    52,    53,    54,
       9,    55,    56,    57,    58,    59,    19,    60,    61,    89,
      90,    91,    92,    93,    94,    95,    96,    29,    46,    59,
      43,    60,    61,     0,    30,   113,   140,    31,    32,   141,
      33,    34,     0,    29,     0,     0,    99,    35,     0,    36,
      30,     0,     0,    31,    32,    71,    33,    34,     0,    29,
       0,     0,     0,    35,     0,    36,    30,     0,     0,    31,
      32,   101,    33,    34,     0,    29,     0,     0,     0,    35,
       0,    36,    30,     0,     0,    31,    32,   132,    33,    34,
       0,    29,     0,     0,     0,    35,     0,    36,    30,     0,
       0,    31,    32,   143,    33,    34,     0,    29,     0,     0,
       0,    35,     0,    36,    30,     0,     0,    31,    32,   146,
      33,    34,     0,    29,     0,     0,     0,    35,     0,    36,
      30,     0,     0,    31,    32,   159,    33,    34,     0,    29,
       0,     0,     0,    35,     0,    36,    30,     0,     0,    31,
      32,   163,    33,    34,     0,    29,     0,     0,     0,    35,
       0,    36,    30,     0,     0,    31,    32,     0,    33,    34,
      92,    93,    94,    95,    96,    35,     0,    36,    89,    90,
      91,    92,    93,    94,    95,    96,    89,    90,    91,    92,
      93,    94,    95,    96,     0,     0,     0,   112,     0,    97,
      89,    90,    91,    92,    93,    94,    95,    96,     0,     0,
       0,   136,    89,    90,    91,    92,    93,    94,    95,    96,
       0,     0,     0,   150,    89,    90,    91,    92,    93,    94,
      95,    96,     0,     0,     0,   157,    89,    90,    91,    92,
      93,    94,    95,    96,     0,     0,     0,   174,    89,    90,
      91,    92,    93,    94,    95,    96,     0,     0,     0,   176,
      89,    90,    91,    92,    93,    94,    95,    96,     0,     0,
       0,   182,    89,    90,    91,    92,    93,    94,    95,    96,
       0,     0,     0,   184,    89,    90,    91,    92,    93,    94,
      95,    96
};

#define yypact_value_is_default(yystate) \
  ((yystate) == (-35))

#define yytable_value_is_error(yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
      30,    31,    32,    37,    15,    27,    26,    16,    33,    16,
      34,    16,    16,    31,    32,    40,    16,    47,    40,    49,
      50,    51,    42,    35,    16,    34,    37,    34,    40,    34,
      34,    61,    16,     0,    68,     3,     4,     5,     6,     7,
       8,     9,    10,     3,     4,     5,     6,     7,     8,     9,
      10,    75,    41,    42,    84,     8,     9,    10,    15,    89,
      90,    91,    92,    93,    94,    95,    96,    43,    98,    41,
      42,    33,   106,    97,    43,    99,    44,    33,    27,    42,
     110,   105,   112,    42,    44,    40,    40,   107,    15,    18,
     124,    42,   126,    40,    40,    40,    16,   131,     3,     4,
       5,     6,     7,     8,     9,    10,   136,     3,     4,     5,
       6,     7,     8,     9,    10,    15,   140,   151,    33,    41,
     150,    14,   156,    30,   148,    16,    42,   157,     3,     4,
       5,     6,     7,     8,     9,    10,    42,    41,    41,    44,
      41,    10,   172,    41,   174,    42,   176,    42,    44,    16,
     180,    23,   182,    30,   184,     3,     4,     5,     6,     7,
       8,     9,    10,    16,    42,    16,    42,    42,     3,     4,
       5,     6,     7,     8,     9,    10,     3,     4,     5,     6,
       7,     8,     9,    10,    42,     9,    42,    23,    12,    13,
      42,    15,    16,    17,    42,    19,    20,    21,    22,     4,
       5,     6,     7,     8,     9,    10,    41,     5,     6,     7,
       8,     9,    10,    37,    41,    39,    40,     9,    42,    42,
      12,    13,    13,    15,    16,    17,    14,    19,    20,    21,
      22,     9,    14,    13,    12,    13,    44,    15,    16,    17,
       4,    19,    20,    21,    22,    37,    13,    39,    40,     3,
       4,     5,     6,     7,     8,     9,    10,    16,    28,    37,
      25,    39,    40,    -1,    23,    86,    25,    26,    27,    28,
      29,    30,    -1,    16,    -1,    -1,    30,    36,    -1,    38,
      23,    -1,    -1,    26,    27,    28,    29,    30,    -1,    16,
      -1,    -1,    -1,    36,    -1,    38,    23,    -1,    -1,    26,
      27,    28,    29,    30,    -1,    16,    -1,    -1,    -1,    36,
      -1,    38,    23,    -1,    -1,    26,    27,    28,    29,    30,
      -1,    16,    -1,    -1,    -1,    36,    -1,    38,    23,    -1,
      -1,    26,    27,    28,    29,    30,    -1,    16,    -1,    -1,
      -1,    36,    -1,    38,    23,    -1,    -1,    26,    27,    28,
      29,    30,    -1,    16,    -1,    -1,    -1,    36,    -1,    38,
      23,    -1,    -1,    26,    27,    28,    29,    30,    -1,    16,
      -1,    -1,    -1,    36,    -1,    38,    23,    -1,    -1,    26,
      27,    28,    29,    30,    -1,    16,    -1,    -1,    -1,    36,
      -1,    38,    23,    -1,    -1,    26,    27,    -1,    29,    30,
       6,     7,     8,     9,    10,    36,    -1,    38,     3,     4,
       5,     6,     7,     8,     9,    10,     3,     4,     5,     6,
       7,     8,     9,    10,    -1,    -1,    -1,    14,    -1,    24,
       3,     4,     5,     6,     7,     8,     9,    10,    -1,    -1,
      -1,    14,     3,     4,     5,     6,     7,     8,     9,    10,
      -1,    -1,    -1,    14,     3,     4,     5,     6,     7,     8,
       9,    10,    -1,    -1,    -1,    14,     3,     4,     5,     6,
       7,     8,     9,    10,    -1,    -1,    -1,    14,     3,     4,
       5,     6,     7,     8,     9,    10,    -1,    -1,    -1,    14,
       3,     4,     5,     6,     7,     8,     9,    10,    -1,    -1,
      -1,    14,     3,     4,     5,     6,     7,     8,     9,    10,
      -1,    -1,    -1,    14,     3,     4,     5,     6,     7,     8,
       9,    10
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    31,    32,    46,    47,    48,    16,    16,     0,    48,
      33,    40,    27,    40,    51,    16,    49,    50,    15,    49,
      16,    34,    52,    43,    41,    42,    33,    41,    43,    16,
      23,    26,    27,    29,    30,    36,    38,    54,    55,    15,
      37,    53,    33,    50,    51,    27,    53,    35,    40,     9,
      12,    13,    15,    16,    17,    19,    20,    21,    22,    37,
      39,    40,    56,    57,    56,    42,    56,    42,    54,    40,
      42,    28,    55,    40,    51,    34,    15,    42,    56,    56,
      58,    59,    56,    56,    13,    56,    40,    40,    56,     3,
       4,     5,     6,     7,     8,     9,    10,    24,    40,    30,
      42,    28,    18,    16,    15,    34,    54,    33,    42,    41,
      14,    56,    14,    58,    16,    41,    56,    56,    56,    56,
      56,    56,    56,    56,    54,    56,    54,    30,    41,    42,
      41,    54,    28,    51,    42,    56,    14,    56,    41,    41,
      25,    28,    41,    28,    42,    42,    28,    16,    34,    56,
      14,    54,    23,    30,    16,    42,    54,    14,    56,    28,
      42,    42,    42,    28,    56,    44,    23,    16,    44,    42,
      42,    14,    13,    56,    14,    56,    14,    56,    44,    14,
      13,    56,    14,    56,    14,    56,    44,    44
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
#line 80 "./src/naiada.y"
    { treeRoot = mProgram((yyvsp[(1) - (1)].yyNode)); }
    break;

  case 3:

/* Line 1806 of yacc.c  */
#line 83 "./src/naiada.y"
    { (yyval.yyNode) = connectFunctions((yyvsp[(1) - (2)].yyNode),(yyvsp[(2) - (2)].yyNode)); }
    break;

  case 4:

/* Line 1806 of yacc.c  */
#line 84 "./src/naiada.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 5:

/* Line 1806 of yacc.c  */
#line 87 "./src/naiada.y"
    { if (strcmp((yyvsp[(2) - (12)].yyString).strVal, (yyvsp[(11) - (12)].yyString).strVal) != 0) { yyerror("syntax error"); YYERROR; } else (yyval.yyNode) = mFunction(connectVariables((yyvsp[(4) - (12)].yyNode), (yyvsp[(7) - (12)].yyNode)), (yyvsp[(9) - (12)].yyNode), (yyvsp[(2) - (12)].yyString).strVal, VOID, (yyvsp[(2) - (12)].yyString).lineNr); }
    break;

  case 6:

/* Line 1806 of yacc.c  */
#line 88 "./src/naiada.y"
    { if (strcmp((yyvsp[(2) - (9)].yyString).strVal, (yyvsp[(8) - (9)].yyString).strVal) != 0) { yyerror("syntax error"); YYERROR; } else (yyval.yyNode) = mFunction((yyvsp[(4) - (9)].yyNode), (yyvsp[(6) - (9)].yyNode), (yyvsp[(2) - (9)].yyString).strVal, VOID, (yyvsp[(2) - (9)].yyString).lineNr); }
    break;

  case 7:

/* Line 1806 of yacc.c  */
#line 89 "./src/naiada.y"
    { if (strcmp((yyvsp[(2) - (14)].yyString).strVal, (yyvsp[(13) - (14)].yyString).strVal) != 0) { yyerror("syntax error"); YYERROR; } else (yyval.yyNode) = mFunction(connectVariables((yyvsp[(4) - (14)].yyNode), (yyvsp[(9) - (14)].yyNode)), (yyvsp[(11) - (14)].yyNode), (yyvsp[(2) - (14)].yyString).strVal, (yyvsp[(7) - (14)].yyType).type, (yyvsp[(2) - (14)].yyString).lineNr); }
    break;

  case 8:

/* Line 1806 of yacc.c  */
#line 90 "./src/naiada.y"
    { if (strcmp((yyvsp[(2) - (11)].yyString).strVal, (yyvsp[(10) - (11)].yyString).strVal) != 0) { yyerror("syntax error"); YYERROR; } else (yyval.yyNode) = mFunction((yyvsp[(6) - (11)].yyNode), (yyvsp[(8) - (11)].yyNode), (yyvsp[(2) - (11)].yyString).strVal, (yyvsp[(4) - (11)].yyType).type, (yyvsp[(2) - (11)].yyString).lineNr); }
    break;

  case 9:

/* Line 1806 of yacc.c  */
#line 94 "./src/naiada.y"
    { (yyval.yyNode) = connectVariables((yyvsp[(1) - (3)].yyNode),(yyvsp[(3) - (3)].yyNode)); }
    break;

  case 10:

/* Line 1806 of yacc.c  */
#line 95 "./src/naiada.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 11:

/* Line 1806 of yacc.c  */
#line 98 "./src/naiada.y"
    { (yyval.yyNode) = mVariable(kFormal, (yyvsp[(1) - (3)].yyString).strVal, (yyvsp[(3) - (3)].yyType).type, (yyvsp[(1) - (3)].yyString).lineNr); }
    break;

  case 12:

/* Line 1806 of yacc.c  */
#line 101 "./src/naiada.y"
    { if ((yyvsp[(1) - (2)].yyNode) != NULL) { (yyval.yyNode) = connectVariables((yyvsp[(1) - (2)].yyNode), (yyvsp[(2) - (2)].yyNode)); } else { (yyval.yyNode) = (yyvsp[(2) - (2)].yyNode); } }
    break;

  case 13:

/* Line 1806 of yacc.c  */
#line 102 "./src/naiada.y"
    { (yyval.yyNode) = NULL; }
    break;

  case 14:

/* Line 1806 of yacc.c  */
#line 105 "./src/naiada.y"
    { (yyval.yyNode) = mVariable(kLocal, (yyvsp[(1) - (4)].yyString).strVal, (yyvsp[(3) - (4)].yyType).type, (yyvsp[(1) - (4)].yyString).lineNr); }
    break;

  case 15:

/* Line 1806 of yacc.c  */
#line 108 "./src/naiada.y"
    { (yyval.yyType) = (yyvsp[(1) - (1)].yyType); }
    break;

  case 16:

/* Line 1806 of yacc.c  */
#line 109 "./src/naiada.y"
    { (yyval.yyType).lineNr = (yyvsp[(1) - (4)].yyLineNr); (yyval.yyType).type = (yyvsp[(3) - (4)].yyType).type + MATRIX; }
    break;

  case 17:

/* Line 1806 of yacc.c  */
#line 112 "./src/naiada.y"
    { (yyval.yyNode) = connectStmnts((yyvsp[(1) - (2)].yyNode),(yyvsp[(2) - (2)].yyNode)); }
    break;

  case 18:

/* Line 1806 of yacc.c  */
#line 113 "./src/naiada.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 19:

/* Line 1806 of yacc.c  */
#line 116 "./src/naiada.y"
    { (yyval.yyNode) = mAssign((yyvsp[(1) - (4)].yyString).strVal, (yyvsp[(3) - (4)].yyNode), (yyvsp[(1) - (4)].yyString).lineNr); }
    break;

  case 20:

/* Line 1806 of yacc.c  */
#line 117 "./src/naiada.y"
    { (yyval.yyNode) = mAsm((yyvsp[(3) - (5)].yyString).strVal, (yyvsp[(1) - (5)].yyLineNr)); }
    break;

  case 21:

/* Line 1806 of yacc.c  */
#line 118 "./src/naiada.y"
    { (yyval.yyNode) = mIf((yyvsp[(2) - (7)].yyNode), (yyvsp[(4) - (7)].yyNode), NULL, (yyvsp[(1) - (7)].yyLineNr)); }
    break;

  case 22:

/* Line 1806 of yacc.c  */
#line 119 "./src/naiada.y"
    { (yyval.yyNode) = mIf((yyvsp[(2) - (9)].yyNode), (yyvsp[(4) - (9)].yyNode), (yyvsp[(6) - (9)].yyNode), (yyvsp[(1) - (9)].yyLineNr)); }
    break;

  case 23:

/* Line 1806 of yacc.c  */
#line 120 "./src/naiada.y"
    { (yyval.yyNode) = mWhile((yyvsp[(2) - (7)].yyNode), (yyvsp[(4) - (7)].yyNode), (yyvsp[(1) - (7)].yyLineNr)); }
    break;

  case 24:

/* Line 1806 of yacc.c  */
#line 121 "./src/naiada.y"
    { (yyval.yyNode) = mReturn((yyvsp[(2) - (3)].yyNode), (yyvsp[(1) - (3)].yyLineNr)); }
    break;

  case 25:

/* Line 1806 of yacc.c  */
#line 122 "./src/naiada.y"
    { (yyval.yyNode) = mReturn(NULL, (yyvsp[(1) - (2)].yyLineNr)); }
    break;

  case 26:

/* Line 1806 of yacc.c  */
#line 123 "./src/naiada.y"
    { (yyval.yyNode) = mFuncCallStmnt((yyvsp[(3) - (5)].yyNode), (yyvsp[(1) - (5)].yyString).strVal, (yyvsp[(1) - (5)].yyString).lineNr); }
    break;

  case 27:

/* Line 1806 of yacc.c  */
#line 124 "./src/naiada.y"
    { (yyval.yyNode) = mLoop((yyvsp[(2) - (5)].yyNode), (yyvsp[(1) - (5)].yyLineNr)); }
    break;

  case 28:

/* Line 1806 of yacc.c  */
#line 125 "./src/naiada.y"
    { (yyval.yyNode) = mExit((yyvsp[(1) - (2)].yyLineNr)); }
    break;

  case 29:

/* Line 1806 of yacc.c  */
#line 126 "./src/naiada.y"
    { (yyval.yyNode) = mAsm("NULL", (yyvsp[(1) - (2)].yyLineNr)); }
    break;

  case 30:

/* Line 1806 of yacc.c  */
#line 129 "./src/naiada.y"
    { (yyval.yyNode) = mUnary((yyvsp[(1) - (2)].yyOperator).opType, (yyvsp[(2) - (2)].yyNode), (yyvsp[(1) - (2)].yyOperator).lineNr); }
    break;

  case 31:

/* Line 1806 of yacc.c  */
#line 130 "./src/naiada.y"
    { (yyval.yyNode) = mUnary((yyvsp[(1) - (2)].yyOperator).opType, (yyvsp[(2) - (2)].yyNode), (yyvsp[(1) - (2)].yyOperator).lineNr); }
    break;

  case 32:

/* Line 1806 of yacc.c  */
#line 131 "./src/naiada.y"
    { (yyval.yyNode) = mUnary((yyvsp[(1) - (4)].yyOperator).opType, (yyvsp[(3) - (4)].yyNode), (yyvsp[(1) - (4)].yyOperator).lineNr); }
    break;

  case 33:

/* Line 1806 of yacc.c  */
#line 132 "./src/naiada.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 34:

/* Line 1806 of yacc.c  */
#line 133 "./src/naiada.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 35:

/* Line 1806 of yacc.c  */
#line 134 "./src/naiada.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 36:

/* Line 1806 of yacc.c  */
#line 135 "./src/naiada.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 37:

/* Line 1806 of yacc.c  */
#line 136 "./src/naiada.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 38:

/* Line 1806 of yacc.c  */
#line 137 "./src/naiada.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 39:

/* Line 1806 of yacc.c  */
#line 138 "./src/naiada.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 40:

/* Line 1806 of yacc.c  */
#line 139 "./src/naiada.y"
    { (yyval.yyNode) = mBinary((yyvsp[(1) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).opType, (yyvsp[(3) - (3)].yyNode), (yyvsp[(2) - (3)].yyOperator).lineNr); }
    break;

  case 41:

/* Line 1806 of yacc.c  */
#line 140 "./src/naiada.y"
    { (yyval.yyNode) = (yyvsp[(2) - (3)].yyNode); }
    break;

  case 42:

/* Line 1806 of yacc.c  */
#line 141 "./src/naiada.y"
    { (yyval.yyNode) = mFuncCallExpr((yyvsp[(3) - (4)].yyNode), (yyvsp[(1) - (4)].yyString).strVal, (yyvsp[(1) - (4)].yyString).lineNr); }
    break;

  case 43:

/* Line 1806 of yacc.c  */
#line 142 "./src/naiada.y"
    { (yyval.yyNode) = mRValue((yyvsp[(1) - (1)].yyString).strVal, (yyvsp[(1) - (1)].yyString).lineNr); }
    break;

  case 44:

/* Line 1806 of yacc.c  */
#line 143 "./src/naiada.y"
    { (yyval.yyNode) = mLValue((yyvsp[(3) - (4)].yyString).strVal, (yyvsp[(1) - (4)].yyLineNr)); }
    break;

  case 45:

/* Line 1806 of yacc.c  */
#line 144 "./src/naiada.y"
    { (yyval.yyNode) = mIntConst((yyvsp[(1) - (1)].yyInt).intVal, (yyvsp[(1) - (1)].yyInt).lineNr); }
    break;

  case 46:

/* Line 1806 of yacc.c  */
#line 145 "./src/naiada.y"
    { (yyval.yyNode) = mBoolConst((yyvsp[(1) - (1)].yyString).strVal, (yyvsp[(1) - (1)].yyString).lineNr); }
    break;

  case 47:

/* Line 1806 of yacc.c  */
#line 146 "./src/naiada.y"
    { (yyval.yyNode) = mFloatConst((yyvsp[(1) - (1)].yyFloat).floatVal, (yyvsp[(1) - (1)].yyFloat).lineNr); }
    break;

  case 48:

/* Line 1806 of yacc.c  */
#line 147 "./src/naiada.y"
    { (yyval.yyNode) = mVecValue((yyvsp[(2) - (7)].yyNode), (yyvsp[(4) - (7)].yyNode), (yyvsp[(6) - (7)].yyNode)); }
    break;

  case 49:

/* Line 1806 of yacc.c  */
#line 150 "./src/naiada.y"
    { (yyval.yyNode) = mMatValue((yyvsp[(3) - (25)].yyNode), (yyvsp[(5) - (25)].yyNode), (yyvsp[(7) - (25)].yyNode), 
													         (yyvsp[(11) - (25)].yyNode), (yyvsp[(13) - (25)].yyNode), (yyvsp[(15) - (25)].yyNode), 
														 (yyvsp[(19) - (25)].yyNode), (yyvsp[(21) - (25)].yyNode), (yyvsp[(23) - (25)].yyNode)); }
    break;

  case 50:

/* Line 1806 of yacc.c  */
#line 153 "./src/naiada.y"
    { (yyval.yyNode) = mCompValue((yyvsp[(1) - (1)].yyComp).strVal, (yyvsp[(1) - (1)].yyComp).lineNr, (yyvsp[(1) - (1)].yyComp).iComponent, VECTOR); }
    break;

  case 51:

/* Line 1806 of yacc.c  */
#line 154 "./src/naiada.y"
    { (yyval.yyNode) = mCompValue((yyvsp[(1) - (1)].yyComp).strVal, (yyvsp[(1) - (1)].yyComp).lineNr, (yyvsp[(1) - (1)].yyComp).iComponent, MATRIX); }
    break;

  case 52:

/* Line 1806 of yacc.c  */
#line 157 "./src/naiada.y"
    { (yyval.yyOperator).opType = ((yyvsp[(1) - (1)].yyType).type == INT ? INTOP : ((yyvsp[(1) - (1)].yyType).type == FLOAT ? FLOATOP : ERROP)); (yyval.yyOperator).lineNr = (yyvsp[(1) - (1)].yyType).lineNr; }
    break;

  case 53:

/* Line 1806 of yacc.c  */
#line 158 "./src/naiada.y"
    { (yyval.yyOperator) = (yyvsp[(1) - (1)].yyOperator); }
    break;

  case 54:

/* Line 1806 of yacc.c  */
#line 161 "./src/naiada.y"
    { (yyval.yyNode) = (yyvsp[(1) - (1)].yyNode); }
    break;

  case 55:

/* Line 1806 of yacc.c  */
#line 162 "./src/naiada.y"
    { (yyval.yyNode) = NULL; }
    break;

  case 56:

/* Line 1806 of yacc.c  */
#line 165 "./src/naiada.y"
    { (yyval.yyNode) = connectActuals((yyvsp[(1) - (3)].yyNode), mActual((yyvsp[(3) - (3)].yyNode))); }
    break;

  case 57:

/* Line 1806 of yacc.c  */
#line 166 "./src/naiada.y"
    { (yyval.yyNode) = mActual((yyvsp[(1) - (1)].yyNode)); }
    break;



/* Line 1806 of yacc.c  */
#line 2016 "./src/naiada.y.c"
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
#line 169 "./src/naiada.y"

int main (int argc, char *argv[])
{
	int syntax_errors, bVerbose, bRegenerateCode;
	char *basename, *smcname;
	t_symtable *symbolTable;
	eType typeRet;

	symbolTable = NULL;
	bVerbose = 0;
	bRegenerateCode = 0;

	switch (argc)
	{
	case 1:
		fprintf (stderr, "No source file specified.\n");
		showManual();
		printf("\n");
		return 1;
	case 2:
		yyin = fopen (argv[1], "r+");
		if (yyin == NULL) 
		{
			fprintf (stderr, "Could not open input file %s\n", argv[1]);	
			showManual();
			printf("\n");
			return 1;
		}
		break;
	case 3:
		yyin = fopen (argv[2], "r+");
		if (yyin == NULL) 
		{
			fprintf (stderr, "Could not open input file %s\n", argv[2]);	
			showManual();
			printf("\n");
			return 1;
		}
		if (argv[1][0] == '-')
		{
			argv[1]++;
			while (argv[1][0] != 0)
			{
				switch (argv[1][0])
				{
					case 'v':
						bVerbose = 1;
						break;
					case 'g':
						bRegenerateCode = 1;
						break;
					default:
						showManual();
						printf("\n");
						return 1;								
				}
				argv[1]++;
			}
		}
		else
		{
			showManual();
			printf("\n");
			return 1;
		}
	}


	basename = malloc(strlen(argv[1]) + 1);
	strcpy(basename, argv[1]);
	basename[strlen(basename)] = 0;

	smcname = malloc(strlen(basename) + 5);
	strcpy(smcname, basename);
	strcat(smcname, ".nmc");
	smcname[strlen(smcname)] = 0;	

	syntax_errors = yyparse();
	if (!syntax_errors) 
	{		
		if (bRegenerateCode) // pass 1 - regenerate NaiAda code back from AST
		{
			if (bVerbose)
				printf("Regenerating NaiAda code from AST to file \"regeneratedcode.nai\"... ");
			regenNaiAda(treeRoot);
			if (bVerbose)
				printf("DONE.\n");
		}

		//pass 2 - name analysis
		if (bVerbose)
			printf("Building symbol tables and performing name analysis... ");
		symbolTable = nameAnalysis(treeRoot);
		if (nameErrorType > 0)
		{
			if (bVerbose)
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
			if (bVerbose)
				printf("DONE.\n");

			// pass 3 - type analysis
			if (bVerbose)
				printf("Performing type control... ");
			typeRet = typeControl(treeRoot, symbolTable);
			if (typeRet != VOID)
			{
				fprintf (stderr, "Type mismatch on line %d.\n", typeErrorLineNr);
			}
			else
			{
				if (bVerbose)
					printf("DONE.\n");
				
				// pass 4 - offset calculations
				if (bVerbose)
					printf("Calculating offsets for IDs... ");
				offsetCalc(treeRoot, symbolTable);


				if (bVerbose)
					printf("DONE.\n");

				// pass 5 - generate stack machine code
				if (bVerbose)
				{
					printf("Generating NaiAda VM stack machine code to file \"");
					printf(smcname);
					printf("\"... ");
				}
				generateSMC(treeRoot, symbolTable, smcname);

				if (bVerbose)
				{
					printf("DONE.\n");
					printf("Cleaning up and exiting...\n");
				}
				
			}
			destroyTables(symbolTable);
		}
		destroy_tree(treeRoot);
	 }
	free(basename);
	free(smcname);

	printf("\n");
	return 0;
}

int yyerror(const char *s)
{
   extern int yylineno;
   fprintf (stderr, "A %s at line %d\n",s, yylineno);
   return 0;
}

void showManual()
{
	printf("\nUsage: naiada [-gv] source\n\n");
	printf("g	Regenerate NaiAda code from abstract syntax tree.\n");
	printf("v	Verbose.\n\n");
}


