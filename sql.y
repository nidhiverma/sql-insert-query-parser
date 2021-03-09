//yacc file
 
%{
    #include <stdio.h>
    #include <stdlib.h>
    int columnCount = 0, valueCount = 0;
%}

%token ID NUM INSERT INTO VALUES
 
%%
 
S               : ST1';'{    
                            printf("QUERY ACCEPTED");
                            exit(0);
                        }
                ;

ST1             : INSERT INTO table '(' attributeList ')' VALUES '(' valuesList ')' 
                    {
                            if(valueCount != columnCount) {
                                printf("Invalid SQL Statement\nERROR : Mismatching LENGTH of Attributes and Values\n");
                                return 0;
                            }
                    }               
                | INSERT INTO table VALUES '(' valuesList ')' 
                ;

attributeList   :    ID','attributeList     {columnCount++;}    
                |    ID                     {columnCount++;}
                ;

valuesList      :    ID ',' valuesList      {valueCount++;}
                |    ID                     {valueCount++;}
                ;

table           : ID;
%%

int yyerror (const char *str) {
    fprintf(stderr, "error: %s\n", str);
    exit(1);
}

int main()
{
    printf("Enter the Insert Query:\n");
    yyparse();
}
 
int yywrap() {
    return 1;
}
 

 