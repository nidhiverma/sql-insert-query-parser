# SQL Insert Query Parser with LEX / YACC
Simple parser for SQL Insert Statement, this tool is developed using Lex and Yacc. 

The source file of __yacc__ is defined in <code>sql.y</code> The source file of __lex__ is defined in <code> sql.l</code>


## Statement of the problem
```
Using lex/yacc implement a parser for the insert SQL statement.
The Syntax of Insert statement is

Format 1:
insert into <table-name> (col1, col2, col3, ...., coln) values (val1, val2, val3, ... , valn)

where the (col1, col2, col3, ..., coln) and values (val1, val2, val3, ... , valn) should have the 
same length.

Format 2:
insert into <table-name> values (val1, val2, val3, ... , valn)

Output: Valid/Invalid statement
```


## How to build

When using lex with yacc, either can be run first. The following command generates a parser in the 
file y.tab.c:

```
$ yacc -vdy sql.y
```

Now invoke lex with the following command:

```
$ flex sql.l
```

Now compile and link the output files with the command:
```
$ gcc lex.yy.c y.tab.c
```

The execuatable is created in __./a.exe__
